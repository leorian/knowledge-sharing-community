package com.ruoyi.openapi.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.openapi.domain.OpenApiUser;
import com.ruoyi.openapi.mapper.OpenApiUserMapper;
import com.ruoyi.openapi.service.OpenApiUserService;
import org.springframework.stereotype.Service;

/**
 * @author xiezhonggui
 */
@Service
public class OpenApiUserServiceImpl extends ServiceImpl<OpenApiUserMapper, OpenApiUser>
        implements OpenApiUserService {
}
