package com.ruoyi.bbs.web.utils;

import lombok.*;


/**
 * @author xiezhonggui
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class FileResult<T, R, Q> extends Result {

    public Q filepath;

    public FileResult(T type, R msg, Q filepath) {
        super(type, msg);
        this.filepath = filepath;
    }

    public FileResult(Result<T, R> result, Q filepath) {
        this(result.getType(), result.getMsg(), filepath);
    }

    public static <R, Q> FileResult builderSuccessMsg(R msg, Q filepath) {
        return new FileResult(Result.builderSuccessMsg(msg), filepath);
    }
}
