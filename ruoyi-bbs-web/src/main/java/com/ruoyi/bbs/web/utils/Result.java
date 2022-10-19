package com.ruoyi.bbs.web.utils;

import lombok.*;

import java.io.Serializable;

/**
 * @author xiezhonggui
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Result<T, R> implements Serializable {

    private T type;

    private R msg;

    public static Result builderErrorMsg(String msg) {
        return new Result("error", msg);
    }

    public static <T> Result builderSuccessMsg(T msg) {
        return new Result("success", msg);
    }
}
