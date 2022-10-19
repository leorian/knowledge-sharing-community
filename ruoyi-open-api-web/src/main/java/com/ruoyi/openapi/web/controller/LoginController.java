package com.ruoyi.openapi.web.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.ruoyi.openapi.domain.OpenApiUser;
import com.ruoyi.openapi.service.OpenApiUserService;
import com.ruoyi.openapi.web.common.Result;
import com.ruoyi.openapi.web.context.LoginContext;
import com.ruoyi.openapi.web.dto.LoginReqDTO;
import com.ruoyi.openapi.web.dto.LoginResDTO;
import com.ruoyi.openapi.web.dto.LogoutReqDTO;
import com.ruoyi.openapi.web.dto.RegisterReqDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;


/**
 * @author xiezhonggui
 */
@Controller
@RequestMapping("/open-api")
public class LoginController extends BaseController {

    @Autowired
    private OpenApiUserService openApiUserService;

    @Autowired
    private LoginContext loginContext;


    /**
     * 登录接口
     *
     * @param loginReqDTO
     * @param bindingResult
     * @return
     */
    @RequestMapping("/login")
    @ResponseBody
    public Result login(@Validated LoginReqDTO loginReqDTO, BindingResult bindingResult) {
        String error = getError(bindingResult);
        if (error != null) {
            return Result.error(error);
        }

        LambdaQueryWrapper<OpenApiUser> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(OpenApiUser::getAccount, loginReqDTO.getAccount());
        OpenApiUser openApiUser = openApiUserService.getOne(lambdaQueryWrapper);
        if (openApiUser == null) {
            return Result.error("账号不存在！");
        }

        if (!openApiUser.getPassword().equals(loginReqDTO.getPassword())) {
            return Result.error("账号密码错误！");
        }

        String token = loginContext.login(openApiUser.getAccount());
        LoginResDTO loginResDTO = new LoginResDTO();
        loginResDTO.setAccount(openApiUser.getAccount());
        loginResDTO.setToken(token);
        loginResDTO.setIntroduction(openApiUser.getIntroduction());
        loginResDTO.setPersonalImage(openApiUser.getPersonalImage());
        return Result.successData(loginResDTO);
    }

    /**
     * 注销账号
     *
     * @param logoutReqDTO
     * @param bindingResult
     * @return
     */
    @RequestMapping("/logout")
    @ResponseBody
    public Result logout(@Validated LogoutReqDTO logoutReqDTO, BindingResult bindingResult) {
        String error = getError(bindingResult);
        if (error != null) {
            return Result.error(error);
        }

        Boolean logoutFlag = loginContext.logout(logoutReqDTO.getAccount(), logoutReqDTO.getToken());
        return logoutFlag ? Result.success("注销账号成功") : Result.error("注销账号失败");
    }


    /**
     * 注册账号接口
     *
     * @param registerReqDTO
     * @param bindingResult
     * @return
     */
    @RequestMapping("/register")
    @ResponseBody
    public Result register(@Validated RegisterReqDTO registerReqDTO, BindingResult bindingResult) {
        String error = getError(bindingResult);
        if (error != null) {
            return Result.error(error);
        }

        OpenApiUser openApiUser = new OpenApiUser();
        openApiUser.setAccount(registerReqDTO.getAccount());
        openApiUser.setPassword(registerReqDTO.getPassword());
        openApiUser.setPersonalImage(registerReqDTO.getPersonalImage());
        openApiUser.setIntroduction(registerReqDTO.getIntroduction());
        openApiUser.setCreateBy(registerReqDTO.getAccount());
        openApiUser.setCreateTime(new Date());
        openApiUser.setUpdateBy(registerReqDTO.getAccount());
        openApiUser.setUpdateTime(new Date());
        try {
            openApiUserService.save(openApiUser);
        } catch (Exception e) {
            e.printStackTrace();
            if (e instanceof DuplicateKeyException) {
                return Result.error("账号已被占用，请更换账号！");
            } else {
                return Result.error("注册失败！");
            }
        }
        return Result.success("注册成功");
    }
}
