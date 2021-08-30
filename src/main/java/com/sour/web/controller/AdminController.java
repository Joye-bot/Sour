package com.sour.web.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 后台首页控制器
 *
 * @author nndmw
 * @date 2021/08/30
 */
@RestController
public class AdminController {

    @GetMapping("/")
    public String index(){
        return "Hello Spring Boot!";
    }
}
