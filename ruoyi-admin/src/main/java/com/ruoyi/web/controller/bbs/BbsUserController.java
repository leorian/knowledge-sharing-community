package com.ruoyi.web.controller.bbs;

import com.ruoyi.bbs.domain.BbsUser;
import com.ruoyi.bbs.service.IBbsUserService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.framework.util.ShiroUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * @author xiezhonggui
 */
@Controller
@RequestMapping("/bbs/user")
public class BbsUserController extends BaseController {
    private String prefix = "bbs/user";

    @Autowired
    private IBbsUserService userService;

    @RequiresPermissions("bbs:user:view")
    @GetMapping()
    public String user() {
        return prefix + "/user";
    }

    /**
     * 查询论坛用户列表
     */
    @RequiresPermissions("bbs:user:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BbsUser user) {
        startPage();
        List<BbsUser> list = userService.selectUserList(user);
        return getDataTable(list);
    }


    /**
     * 新增论坛用户
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存论坛用户
     */
    @RequiresPermissions("bbs:user:add")
    @Log(title = "论坛用户", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BbsUser user) {
        user.setCreateBy(ShiroUtils.getLoginName());
        user.setUpdateBy(ShiroUtils.getLoginName());
        user.setBirthday(new Date());
        return toAjax(userService.insertUser(user));
    }

    /**
     * 修改论坛用户
     */
    @GetMapping("/edit/{userId}")
    public String edit(@PathVariable("userId") Long userId, ModelMap mmap) {
        mmap.put("user", userService.selectUserById(userId));
        return prefix + "/edit";
    }

    /**
     * 修改保存论坛用户
     */
    @RequiresPermissions("bbs:user:edit")
    @Log(title = "论坛用户", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BbsUser user) {
        user.setUpdateBy(ShiroUtils.getLoginName());
        return toAjax(userService.updateUser(user));
    }

    /**
     * 删除论坛用户
     */
    @RequiresPermissions("bbs:user:remove")
    @Log(title = "论坛用户", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(userService.deleteUserByIds(ids));
    }
}
