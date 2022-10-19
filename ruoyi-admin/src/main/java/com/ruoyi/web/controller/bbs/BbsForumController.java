package com.ruoyi.web.controller.bbs;

import com.ruoyi.bbs.domain.BbsForum;
import com.ruoyi.bbs.service.IBbsForumService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author xiezhonggui
 */
@Controller
@RequestMapping("/bbs/forum")
public class BbsForumController extends BaseController {

    private String prefix = "bbs/forum";

    @Autowired
    private IBbsForumService forumService;


    @RequiresPermissions("bbs:forum:view")
    @GetMapping()
    public String forum() {
        return prefix + "/forum";
    }

    /**
     * 查询论坛帖子列表
     */
    @RequiresPermissions("bbs:forum:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BbsForum forum) {
        startPage();
        List<BbsForum> list = forumService.selectForumList(forum);
        return getDataTable(list);
    }

    /**
     * 删除论坛帖子
     */
    @RequiresPermissions("bbs:forum:remove")
    @Log(title = "论坛帖子", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(forumService.deleteForumByIds(ids));
    }
}
