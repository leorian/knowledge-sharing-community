package com.ruoyi.openapi.web.controller;

import org.springframework.validation.BindingResult;

/**
 * @author xiezhonggui
 */
public class BaseController {
    public String getError(BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return bindingResult.getAllErrors().stream()
                    .findFirst().get().getDefaultMessage();
        }
        return null;
    }
}
