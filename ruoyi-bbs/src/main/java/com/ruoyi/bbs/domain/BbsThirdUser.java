package com.ruoyi.bbs.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.ToString;

/**
 * @author xiezhonggui
 */
@Data
@ToString
@TableName("bbs_third_user")
public class BbsThirdUser extends BbsBaseEntity {
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    private Long userId;
    private String uuid;
    private String username;
    private String nickName;
    private String avatar;
    private String source;
    private String accessToken;
    private Integer status;
    private Integer delFlag;
}
