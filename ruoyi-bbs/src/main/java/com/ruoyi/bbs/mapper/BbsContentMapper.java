package com.ruoyi.bbs.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.bbs.domain.BbsContent;

import java.util.List;
import java.util.Map;

/**
 * @author xiezhonggui
 */
public interface BbsContentMapper extends BaseMapper<BbsContent> {
    /**
     * 查询内容列表
     *
     * @param bbsContent
     * @return
     */
    List<BbsContent> selectContentList(BbsContent bbsContent);

    /**
     * 新增内容
     *
     * @param content 内容信息
     * @return 结果
     */
    int insertContent(BbsContent content);


    /**
     * 查询内容信息
     *
     * @param contentId 内容ID
     * @return 内容信息
     */
    BbsContent selectContentById(Long contentId);


    /**
     * 更新内容
     *
     * @param content
     * @return
     */
    int updateContent(BbsContent content);

    /**
     * 批量删除内容
     *
     * @param contentIds 需要删除的数据ID
     * @return 结果
     */
    int deleteContentByIds(String[] contentIds);

    /**
     * 分页查询集合
     *
     * @param queryMap
     * @return
     */
    List<BbsContent> findList(Map<String, Object> queryMap);


    /**
     * 分页查询总数
     *
     * @param queryMap
     * @return
     */
    int getTotal(Map<String, Object> queryMap);

}
