package com.sour.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 用户控制器
 *
 * @author nndmw
 * @date 2021/09/16
 */
@Controller
@RequestMapping(value = "/admin/profile")
public class UserController {

    /**
     * 获取用户信息并跳转
     *
     * @return {@link String}
     */
    @GetMapping
    public String profile() {
        return "admin/admin_profile";
    }
}
