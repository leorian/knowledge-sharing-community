package com.ruoyi.openapi.web.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author xiezhonggui
 */
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Result<T> {
    private static final String SUCCESS = "success";
    private static final String ERROR = "error";
    private String type;
    private String msg;
    private T data;

    @SuppressWarnings("all")
    public static Result success(String msg) {
        return new Result(SUCCESS, msg, null);
    }

    @SuppressWarnings("all")
    public static <T> Result successData(T data) {
        return new Result(SUCCESS, "操作成功", data);
    }

    @SuppressWarnings("all")
    public static <T> Result success(String msg, T data) {
        return new Result(SUCCESS, msg, data);
    }

    @SuppressWarnings("all")
    public static Result error(String msg) {
        return new Result(ERROR, msg, null);
    }
}
