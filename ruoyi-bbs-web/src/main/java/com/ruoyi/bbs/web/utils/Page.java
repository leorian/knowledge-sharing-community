package com.ruoyi.bbs.web.utils;


/**
 * 分页基本信息
 *
 * @author xiezhonggui
 */
public class Page {
    /**
     * 当前页码
     */
    private int page = 1;

    /**
     * 每页显示数量
     */
    private int limit;

    /**
     * 对应数据库中的偏移量
     */
    private int offset;

    private String search;

    private String tag;

    private String searchContent;

    private Long searchBlockId;

    private Long searchModuleId;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getOffset() {
//        this.offset = (page - 1) * limit;
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getSearchContent() {
        return searchContent;
    }

    public void setSearchContent(String searchContent) {
        this.searchContent = searchContent;
    }

    public Long getSearchBlockId() {
        return searchBlockId;
    }

    public void setSearchBlockId(Long searchBlockId) {
        this.searchBlockId = searchBlockId;
    }

    public Long getSearchModuleId() {
        return searchModuleId;
    }

    public void setSearchModuleId(Long searchModuleId) {
        this.searchModuleId = searchModuleId;
    }
}
