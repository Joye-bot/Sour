package com.sour.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 备份控制器
 *
 * @author nndmw
 * @date 2021/09/19
 */
@Controller
@RequestMapping(value = "/admin/backup")
public class BackupController {

    /**
     * 渲染备份页面
     *
     * @param model 模型
     * @return {@link String}
     */
    @GetMapping
    public String backup(Model model) {
        return "admin/admin_backup";
    }
}
