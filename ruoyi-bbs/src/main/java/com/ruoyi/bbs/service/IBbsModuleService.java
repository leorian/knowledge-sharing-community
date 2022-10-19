package com.ruoyi.bbs.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.bbs.domain.BbsModule;

import java.util.List;

/**
 * @author xiezhonggui
 */
public interface IBbsModuleService extends IService<BbsModule> {


    /**
     * 查询栏目列表
     *
     * @param module 栏目信息
     * @return 栏目集合
     */
    List<BbsModule> selectModuleList(BbsModule module);

    /**
     * 统计栏目列表
     *
     * @param module
     * @return
     */
    List<BbsModule> statisticsModuleList(BbsModule module);

    /**
     * 统计栏目帖子数量
     *
     * @param module
     * @return
     */
    List<BbsModule> statisticsModuleForumList(BbsModule module);


    /**
     * 新增栏目
     *
     * @param module 栏目信息
     * @return 结果
     */
    int insertModule(BbsModule module);

    /**
     * 查询栏目信息
     *
     * @param moduleId 栏目ID
     * @return 栏目信息
     */
    BbsModule selectModuleById(Long moduleId);

    /**
     * 修改栏目
     *
     * @param module 栏目信息
     * @return 结果
     */
    int updateModule(BbsModule module);


    /**
     * 删除栏目信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteModuleByIds(String ids);

    /**
     * 根据blockId检索改版块下所有的栏目
     *
     * @param blockId
     * @return
     */
    List<Long> getModuleIdListByBlockId(Long blockId);
}
