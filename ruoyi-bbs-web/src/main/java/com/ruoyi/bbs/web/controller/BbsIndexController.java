package com.ruoyi.bbs.web.controller;

import com.ruoyi.bbs.domain.*;
import com.ruoyi.bbs.service.*;
import com.ruoyi.bbs.web.aop.InjectLoginUser;
import com.ruoyi.bbs.web.aop.InjectNowDate;
import com.ruoyi.bbs.web.check.RequestDtoCheck;
import com.ruoyi.bbs.web.context.LoginContext;
import com.ruoyi.bbs.web.entity.*;
import com.ruoyi.bbs.web.utils.*;
import com.ruoyi.common.config.Global;
import com.ruoyi.common.utils.file.FileUploadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author xiezhonggui
 */
@Controller
@RequestMapping("/bbs")
public class BbsIndexController {


    @Autowired
    private IBbsBlockService blockService;

    @Autowired
    private IBbsModuleService moduleService;

    @Autowired
    private IBbsTopicService topicService;

    @Autowired
    private IBbsUserService userService;

    @Autowired
    private IBbsForumService forumService;

    @Autowired
    private LoginContext loginContext;


    /**
     * 论坛用户登录页面
     *
     * @param modelMap
     * @return
     */
    @RequestMapping("/login")
    public String login(ModelMap modelMap) {
        modelMap.put("msg", "用户登录页面");
        return "login";
    }

    /**
     * 论坛用户注册页面
     *
     * @param modelMap
     * @return
     */
    @RequestMapping("/register")
    public String register(ModelMap modelMap) {
        modelMap.put("msg", "用户注册页面");
        return "register";
    }

    /**
     * 个人中心
     *
     * @param modelMap
     * @return
     */
    @RequestMapping("/personal")
    @InjectLoginUser
    @InjectNowDate
    public String personal(HttpServletRequest request, ModelMap modelMap) {
        BbsUser bbsUser = loginContext.getCurrentUser(request);
        if (bbsUser != null && bbsUser.getUserId() != null) {
            modelMap.put("bbsUser", bbsUser);
        } else {
            modelMap.put("msg1_tips", "未登录, 不能修改密码！");
            modelMap.put("msg2_tips", "未登录，无法反馈意见！");
        }

        return "personal";
    }


    /**
     * 首页
     *
     * @param modelMap
     * @return
     */
    @RequestMapping("/index")
    @InjectLoginUser
    @InjectNowDate
    public String index(ModelMap modelMap, HttpServletRequest request) {
        List<BlockEntity> blockEntityList = builderBlockEntityList();
        modelMap.put("blockEntityList", blockEntityList);

        //最新资源
        List<BbsTopic> newsTopicTop5 = topicService.newsTopicTop5();
        modelMap.put("newsTopicTop5", newsTopicTop5);

        //最新回复
        List<BbsTopic> newCommentTopicTop5 = topicService.newCommentTopicTop5();
        modelMap.put("newCommentTopicTop5", newCommentTopicTop5);

        //热门资源
        List<BbsTopic> hotTopicTop5 = topicService.hotTopicTop5();
        modelMap.put("hotTopicTop5", hotTopicTop5);

        Long totalUserCount = userService.getUserCount(0);
        Long totalFeeUserCount = userService.getUserCount(1);
        modelMap.put("totalUserCount", totalUserCount);
        modelMap.put("totalFeeUserCount", totalFeeUserCount);

        Integer totalTopicCount = topicService.getTotal(new HashMap<>(0));
        modelMap.put("totalTopicCount", totalTopicCount);

        Long totalForumCount = forumService.getForumCount();
        modelMap.put("totalForumCount", totalForumCount);
        return "index";
    }

    /**
     * 搜索页面
     *
     * @param modelMap
     * @param request
     * @return
     */
    @RequestMapping("/search")
    @InjectLoginUser
    @InjectNowDate
    public String search(ModelMap modelMap, HttpServletRequest request) {

        List<BbsBlock> blockList = blockService.selectBlockList(new BbsBlock());
        if (!CollectionUtils.isEmpty(blockList)) {
            modelMap.put("blockList", blockList);
        }

        List<BbsModule> moduleList = moduleService.selectModuleList(new BbsModule());
        if (!CollectionUtils.isEmpty(moduleList)) {
            modelMap.put("moduleList", moduleList);
        }

        return "search";
    }

    /**
     * 列表页
     *
     * @param moduleId
     * @param modelMap
     * @return
     */
    @RequestMapping("/list")
    @InjectLoginUser
    public String list(@RequestParam("moduleId") Long moduleId, ModelMap modelMap, HttpServletRequest request) {
        BbsModule module = moduleService.selectModuleById(moduleId);
        modelMap.put("module", module);
        BbsBlock block = blockService.selectBlockById(module.getBlockId());
        modelMap.put("block", block);
        List<BlockEntity> blockEntityList = builderBlockEntityList();
        modelMap.put("blockEntityList", blockEntityList);

        List<BbsTopic> bbsTopicList = topicService.tagCount(moduleId);
        modelMap.put("tagList", bbsTopicList);
        modelMap.put("tagTotalCount", bbsTopicList.stream().mapToLong(BbsTopic::getTagCount).sum());
        return "list";
    }


    /**
     * 详情页
     *
     * @return
     */
    @RequestMapping("/detail")
    @InjectLoginUser
    public String detail(@RequestParam("topicId") Long topicId, ModelMap modelMap, HttpServletRequest request) {
        BbsTopic topic = topicService.selectTopicById(topicId);
        BbsUser bbsSessionUser = loginContext.getCurrentUser(request);
        if (bbsSessionUser == null || bbsSessionUser.getAccount() == null) {
            modelMap.put("commentFlag", 0);
            topic.setPrivateContent("<div class=\"alert alert-danger\" role=\"alert\">您处于未登录状态，不能查看隐藏内容，请先登录，谢谢您的配合！</div>");
        } else {
            if (bbsSessionUser.getUserType() == 0) {
                modelMap.put("commentFlag", 0);
                topic.setPrivateContent("<div class=\"alert alert-info\" role=\"alert\">您属于普通用户，不能查看隐藏内容，请联系客服，升级为终身会员，方可查看！</div>");
            } else {
                BbsForum bbsForum = new BbsForum();
                bbsForum.setUserId(bbsSessionUser.getUserId());
                bbsForum.setTopicId(topicId);
                List<BbsForum> bbsForumList = forumService.selectForumList(bbsForum);
                if (CollectionUtils.isEmpty(bbsForumList)) {
                    modelMap.put("commentFlag", 0);
                    topic.setPrivateContent("<div class=\"alert alert-success\" role=\"alert\">您属于终身会员，回复即可查看隐藏内容！</div>");
                } else {
                    modelMap.put("commentFlag", 1);
                    modelMap.put("comment", bbsForumList.get(0));
                }
            }
        }
        modelMap.put("topic", topic);
        BbsModule module = moduleService.selectModuleById(topic.getModuleId());
        modelMap.put("module", module);
        BbsBlock block = blockService.selectBlockById(module.getBlockId());
        modelMap.put("block", block);
        List<BlockEntity> blockEntityList = builderBlockEntityList();
        modelMap.put("blockEntityList", blockEntityList);
        return "detail";
    }

    /**
     * 获取主题列表
     *
     * @param page
     * @return
     */
    @RequestMapping("/topic_list")
    @ResponseBody
    public Map<String, Object> getTopicList(@RequestBody Page page) {
        Map<String, Object> ret = new HashMap<String, Object>(2);
        Map<String, Object> queryMap = new HashMap<String, Object>(4);
        queryMap.put("offset", page.getOffset());
        queryMap.put("pageSize", page.getLimit());
        if (!StringUtils.isEmpty(page.getSearch())) {
            queryMap.put("moduleId", Long.valueOf(page.getSearch()));
        }

        if (!StringUtils.isEmpty(page.getTag())) {
            queryMap.put("tag", page.getTag());
        }

        if (!StringUtils.isEmpty(page.getSearchContent())) {
            queryMap.put("title", page.getSearchContent());
        }

        if (page.getSearchModuleId() != null && page.getSearchModuleId() != -1) {
            queryMap.put("moduleId", page.getSearchModuleId());
        } else {
            if (page.getSearchBlockId() != null && page.getSearchBlockId() != -1) {
                List<Long> moduleIdList = moduleService.getModuleIdListByBlockId(page.getSearchBlockId());
                if (!CollectionUtils.isEmpty(moduleIdList)) {
                    queryMap.put("moduleIdList", moduleIdList);
                }
            }
        }

        if (!StringUtils.isEmpty(page.getSearchContent())) {
            queryMap.put("title", page.getSearchContent());
        }
        List<BbsTopic> topics = topicService.findList(queryMap);
        if (!CollectionUtils.isEmpty(topics)) {
            List<Long> topicIds = topics.stream().map(BbsTopic::getTopicId).collect(Collectors.toList());
            List<BbsTopic> bbsTopics = topicService.statisticsForumList(topicIds);
            if (!CollectionUtils.isEmpty(bbsTopics)) {
                Map<Long, Long> topicCommentCountMap = bbsTopics.stream().collect(Collectors.toMap(BbsTopic::getTopicId,
                        BbsTopic::getCommentCount));
                for (BbsTopic topic : topics) {
                    Long commentCount = topicCommentCountMap.get(topic.getTopicId());
                    if (commentCount != null) {
                        topic.setCommentCount(commentCount);
                    }
                }
            }
        }
        ret.put("rows", topics);
        ret.put("total", topicService.getTotal(queryMap));
        return ret;
    }

    /**
     * 本系统所有的验证码均采用此方法
     *
     * @param vCodeLen
     * @param width
     * @param height
     * @param captchaType:用来区别验证码的类型，传入字符串
     * @param request
     * @param response
     */
    @RequestMapping(value = "/get_captcha", method = RequestMethod.GET)
    public void generateCaptcha(
            @RequestParam(name = "vl", required = false, defaultValue = "4") Integer vCodeLen,
            @RequestParam(name = "w", required = false, defaultValue = "100") Integer width,
            @RequestParam(name = "h", required = false, defaultValue = "30") Integer height,
            @RequestParam(name = "type", defaultValue = "loginCaptcha") String captchaType,
            HttpServletRequest request,
            HttpServletResponse response) {
        CpachaUtil cpachaUtil = new CpachaUtil(vCodeLen, width, height);
        String generatorCode = cpachaUtil.generatorVCode();
        request.getSession().setAttribute(captchaType, generatorCode);
        BufferedImage generatorRotateCodeImage = cpachaUtil.generatorRotateVCodeImage(generatorCode, true);
        try {
            ImageIO.write(generatorRotateCodeImage, "gif", response.getOutputStream());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * 登录表单提交处理控制器
     *
     * @param user
     * @param captcha
     * @return
     */
    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    @ResponseBody
    public Result loginAct(UserEntity user, String captcha, HttpServletRequest request) {
        Result ret = RequestDtoCheck.loginActCheck(user, captcha, request);
        if (ret != null) {
            return ret;
        }


        BbsUser findByAccount = userService.selectUserByAccount(user.getAccount());
        if (findByAccount == null) {
            return Result.builderErrorMsg("该账号不存在！");
        }
        if (!user.getPassword().equals(findByAccount.getPassword())) {
            return Result.builderErrorMsg("密码错误！");
        }
        //说明用户名密码及验证码都正确

        //把角色信息、菜单信息放到session中
        String token = UUID.randomUUID().toString();
        loginContext.setCurrentUser(request, findByAccount, token);
        return Result.builderSuccessMsg("登录成功！");
    }

    /**
     * 修改密码
     *
     * @param passwordEntity
     * @param captcha
     * @param request
     * @return
     */
    @RequestMapping("/doModifyPassword")
    @ResponseBody
    public Result modifyPasswordAct(PasswordEntity passwordEntity, String captcha, HttpServletRequest request) {
        Result result = RequestDtoCheck.modifyPasswordActCheck(passwordEntity, captcha, request);
        if (result != null) {
            return result;
        }

        BbsUser bbsUser = loginContext.getCurrentUser(request);
        if (bbsUser == null) {
            return Result.builderErrorMsg("请先登录，再修改密码！");
        }

        if (!bbsUser.getPassword().equals(passwordEntity.getOld_password())) {
            return Result.builderErrorMsg("请输入正确的原始密码！");
        }

        bbsUser.setPassword(passwordEntity.getNew_password());

        userService.updateUser(bbsUser);

        return Result.builderSuccessMsg("修改成功");
    }

    /**
     * 注册表单提交处理控制器
     *
     * @param user
     * @param captcha
     * @return
     */
    @RequestMapping(value = "/doRegister", method = RequestMethod.POST)
    @ResponseBody
    public Result registerAct(UserEntity user, String captcha, HttpServletRequest request) {
        Result ret = RequestDtoCheck.registerActCheck(user, captcha, request);
        if (ret != null) {
            return ret;
        }

        BbsUser findByAccount = userService.selectUserByAccount(user.getAccount());
        if (findByAccount != null) {
            return Result.builderErrorMsg("该账号已存在！");
        }

        findByAccount = userService.selectUserByAccount(user.getEmail());
        if (findByAccount != null) {
            return Result.builderErrorMsg("该邮箱已存在！");
        }

        BbsUser bbsUser = new BbsUser();
        bbsUser.setUserName(user.getUsername());
        bbsUser.setAccount(user.getAccount());
        bbsUser.setPassword(user.getPassword());
        bbsUser.setEmail(user.getEmail());
        bbsUser.setSex(user.getSex());
        //用户图像
        bbsUser.setUserImage("");
        //用户手机号
        bbsUser.setPhoneNumber("");
        //用户QQ
        bbsUser.setQq("");
        bbsUser.setUserType(0);
        bbsUser.setStatus(0);
        bbsUser.setDelFlag(0);
        bbsUser.setBirthday(new Date());
        bbsUser.setCreateBy("bbs_register");
        bbsUser.setCreateTime(new Date());
        bbsUser.setUpdateBy("bbs_register");
        bbsUser.setUpdateTime(new Date());
        try {
            userService.insertUser(bbsUser);
            return Result.builderSuccessMsg("注册成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.builderErrorMsg("注册异常！");
        }
    }

    /**
     * 回复主题表单提交处理控制器
     *
     * @param forum
     * @param request
     * @return
     */
    @RequestMapping(value = "/doComment", method = RequestMethod.POST)
    @ResponseBody
    public Result commentAct(ForumEntity forum, String captcha, HttpServletRequest request) {
        Result ret = RequestDtoCheck.commentActCheck(forum, captcha, request);
        if (ret != null) {
            return ret;
        }


        BbsUser bbsSessionUser = loginContext.getCurrentUser(request);
        if (bbsSessionUser == null || StringUtils.isEmpty(bbsSessionUser.getAccount())) {
            return Result.builderErrorMsg("回复内容之前请先登录！");
        }

        if (bbsSessionUser.getUserType() == null || bbsSessionUser.getUserType() == 0) {
            return Result.builderErrorMsg("您现在的身份是普通用户，不能进行回复，请先升级为终身会员！");
        }


        BbsTopic bbsTopic = topicService.selectTopicById(forum.getTopicId());

        BbsForum bbsForum = new BbsForum();
        bbsForum.setTopicId(forum.getTopicId());
        bbsForum.setTopicTitle(bbsTopic.getTopicTitle());

        bbsForum.setUserId(bbsSessionUser.getUserId());
        bbsForum.setUserName(bbsSessionUser.getUserName());
        bbsForum.setAccount(bbsSessionUser.getAccount());
        bbsForum.setForumContent(forum.getForumContent());
        bbsForum.setForumTime(new Date());
        bbsForum.setStatus(0);
        bbsForum.setDelFlag(0);
        bbsForum.setCreateBy(bbsSessionUser.getAccount());
        bbsForum.setCreateTime(new Date());
        bbsForum.setUpdateBy(bbsSessionUser.getAccount());
        bbsForum.setUpdateTime(new Date());

        try {
            forumService.insertForum(bbsForum);
            return Result.builderSuccessMsg("回复成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.builderSuccessMsg("回复异常！");
        }
    }

    /**
     * 后台退出注销功能
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request) {
        BbsUser bbsUser = loginContext.getCurrentUser(request);
        if (bbsUser != null) {
            loginContext.clearCurrentUser(request, bbsUser);
        }
        return "redirect:/bbs/index";
    }

    /**
     * 上传图片
     *
     * @param photo
     * @return
     */
    @RequestMapping(value = "/upload_photo", method = RequestMethod.POST)
    @ResponseBody
    public Result uploadPhoto(MultipartFile photo, HttpServletRequest request) throws IOException {

        BbsUser bbsUser = loginContext.getCurrentUser(request);
        if (bbsUser == null || bbsUser.getUserType() == 0) {
            return Result.builderErrorMsg("社区文件服务器资源有限，暂且只有终身会员才能上传图片");
        }

        if (photo == null) {
            return Result.builderErrorMsg("选择要上传的文件！");
        }
        if (photo.getSize() > 1024 * 1024 * 1024) {
            return Result.builderErrorMsg("文件大小不能超过10M！");
        }
        //获取文件后缀
        String suffix = photo.getOriginalFilename().substring(photo.getOriginalFilename().lastIndexOf(".") + 1,
                photo.getOriginalFilename().length());
        if (!"jpg,jpeg,gif,png".toUpperCase().contains(suffix.toUpperCase())) {
            return Result.builderErrorMsg("请选择jpg,jpeg,gif,png格式的图片！");
        }

        // 上传文件路径
        String filePath = Global.getUploadPath();
        String filepath = FileUploadUtils.upload(filePath, photo);
        return FileResult.builderSuccessMsg(photo.getOriginalFilename(), filepath);
    }

    /**
     * 构造版块和栏目
     *
     * @return
     */
    private List<BlockEntity> builderBlockEntityList() {
        List<BlockEntity> blockEntityList = null;
        List<BbsBlock> blockList = blockService.selectBlockList(new BbsBlock());
        if (CollectionUtils.isEmpty(blockList)) {
            return null;
        }

        blockEntityList = blockList.stream().map(block -> {
            BlockEntity blockEntity = new BlockEntity();
            blockEntity.setBlockId(block.getBlockId());
            blockEntity.setBlockTitle(block.getBlockTitle());
            blockEntity.setModuleEntityList(new ArrayList<>());
            return blockEntity;
        }).collect(Collectors.toList());

        List<BbsModule> moduleList = moduleService.selectModuleList(new BbsModule());
        if (CollectionUtils.isEmpty(moduleList)) {
            return blockEntityList;
        }

        //主题数量，精华主题数量，最后发表时间
        List<BbsModule> moduleStatisticsList = moduleService.statisticsModuleList(new BbsModule());
        if (!CollectionUtils.isEmpty(moduleStatisticsList)) {
            Map<Long, BbsModule> moduleMap = moduleStatisticsList.stream().collect(Collectors.toMap(BbsModule::getModuleId,
                    module -> module));
            for (BbsModule module : moduleList) {
                BbsModule bbsModule = moduleMap.get(module.getModuleId());
                if (bbsModule != null) {
                    module.setTopicCount(bbsModule.getTopicCount());
                    module.setGoodTopicCount(bbsModule.getGoodTopicCount());
                    module.setLastUpdateTime(bbsModule.getLastUpdateTime());
                }
            }
        }

        //帖子数量
        List<BbsModule> moduleStatisticsForumList = moduleService.statisticsModuleForumList(new BbsModule());
        if (!CollectionUtils.isEmpty(moduleStatisticsForumList)) {
            Map<Long, BbsModule> moduleMap = moduleStatisticsForumList.stream().collect(Collectors.toMap(BbsModule::getModuleId,
                    module -> module));
            for (BbsModule module : moduleList) {
                BbsModule bbsModule = moduleMap.get(module.getModuleId());
                if (bbsModule != null) {
                    module.setForumCount(bbsModule.getForumCount());
                }
            }
        }

        for (BbsModule module : moduleList) {
            for (BlockEntity blockEntity : blockEntityList) {
                if (module.getBlockId().equals(blockEntity.getBlockId())) {
                    ModuleEntity moduleEntity = new ModuleEntity();
                    moduleEntity.setModuleId(module.getModuleId());
                    moduleEntity.setModuleTitle(module.getModuleTitle());
                    moduleEntity.setModuleIcon(module.getIcon());
                    //主题数量
                    if (module.getTopicCount() != null) {
                        moduleEntity.setTopicCount(String.valueOf(module.getTopicCount()));
                    } else {
                        moduleEntity.setTopicCount("0");
                    }

                    //帖子数量
                    if (module.getForumCount() != null) {
                        moduleEntity.setForumCount(String.valueOf(module.getForumCount()));
                    } else {
                        moduleEntity.setForumCount("0");
                    }

                    //精华主题数量
                    if (module.getGoodTopicCount() != null) {
                        moduleEntity.setGoodTopicCount(String.valueOf(module.getGoodTopicCount()));
                    } else {
                        moduleEntity.setGoodTopicCount("0");
                    }

                    //最后发表时间
                    if (module.getLastUpdateTime() != null) {
                        moduleEntity.setForumTime(RelativeDateFormat.format(module.getLastUpdateTime()));
                    } else {
                        moduleEntity.setForumTime("暂无");
                    }


                    blockEntity.getModuleEntityList().add(moduleEntity);
                }
            }
        }

        return blockEntityList;
    }
}
