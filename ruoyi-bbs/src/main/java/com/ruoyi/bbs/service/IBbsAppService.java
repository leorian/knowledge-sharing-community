package com.ruoyi.bbs.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.bbs.domain.BbsApp;

import java.util.List;

/**
 * @author xiezhonggui
 */
public interface IBbsAppService extends IService<BbsApp> {
    /**
     * 查询应用列表
     *
     * @param app 应用信息
     * @return 应用集合
     */
    List<BbsApp> selectAppList(BbsApp app);


    /**
     * 新增应用
     *
     * @param app 应用信息
     * @return 结果
     */
    int insertApp(BbsApp app);

    /**
     * 查询应用信息
     *
     * @param appId 应用ID
     * @return 应用信息
     */
    BbsApp selectAppById(Long appId);

    /**
     * 修改应用
     *
     * @param app 应用信息
     * @return 结果
     */
    int updateApp(BbsApp app);

    /**
     * 删除应用信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteAppByIds(String ids);

    /**
     * 增加下载次数
     *
     * @param appId
     * @return
     */
    int plusOneDownloadTimes(Long appId);

}
