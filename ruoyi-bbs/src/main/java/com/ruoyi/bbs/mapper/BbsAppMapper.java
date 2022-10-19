package com.ruoyi.bbs.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.bbs.domain.BbsApp;

import java.util.List;

/**
 * @author xiezhonggui
 */
public interface BbsAppMapper extends BaseMapper<BbsApp> {

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
     * 批量删除应用
     *
     * @param appIds 需要删除的数据ID
     * @return 结果
     */
    int deleteAppByIds(String[] appIds);

    /**
     * 增加下载次数
     *
     * @param appId
     * @return
     */
    int plusOneDownloadTimes(Long appId);
}
