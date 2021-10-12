package com.sour.web.controller.core;

import com.sour.model.domain.Category;
import com.sour.model.domain.Logs;
import com.sour.model.domain.User;
import com.sour.model.dto.LogsRecord;
import com.sour.model.dto.SourConst;
import com.sour.service.LogsService;
import com.sour.service.OptionsService;
import com.sour.service.UserService;
import com.sour.util.SourUtil;
import freemarker.template.Configuration;
import freemarker.template.TemplateModelException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

/**
 * 安装控制器
 *
 * @author nndmw
 * @date 2021/10/12
 */
@Controller
@RequestMapping(value = "/install")
@Slf4j
public class InstallController {

    private final UserService userService;

    private final OptionsService optionsService;

    private final LogsService logsService;

    private final Configuration configuration;

    @Autowired
    public InstallController(UserService userService,
                             OptionsService optionsService,
                             LogsService logsService,
                             Configuration configuration) {
        this.userService = userService;
        this.optionsService = optionsService;
        this.logsService = logsService;
        this.configuration = configuration;
    }

    /**
     * 渲染安装页面
     *
     * @param model 模型
     * @return {@link String}
     */
    @GetMapping
    public String install(Model model) {
        try {
            File basePath = new File(ResourceUtils.getURL("classpath:").getPath());
            File installFile = new File(basePath.getAbsolutePath(), "install.lock");
            if (installFile.exists()) {
                model.addAttribute("isInstall", true);
            } else {
                model.addAttribute("isInstall", false);
            }
        } catch (FileNotFoundException e) {
            log.error(e.getMessage());
        }
        return "common/install";
    }

    /**
     * 执行安装
     *
     * @param blogTitle       博客标题
     * @param blogUrl         博客网址
     * @param userName        用户名
     * @param userDisplayName 用户显示名称
     * @param userEmail       用户邮箱
     * @param userPwd         用户密码
     * @param request         请求
     * @return boolean
     */
    @PostMapping(value = "/do")
    @ResponseBody
    public boolean doInstall(@RequestParam("blogTitle") String blogTitle,
                             @RequestParam("blogUrl") String blogUrl,
                             @RequestParam("userName") String userName,
                             @RequestParam("userDisplayName") String userDisplayName,
                             @RequestParam("userEmail") String userEmail,
                             @RequestParam("userPwd") String userPwd,
                             HttpServletRequest request) {
        try {
            // 创建install.lock文件
            File basePath = new File(ResourceUtils.getFile("classpath:").getPath());
            File installFile = new File(basePath.getAbsolutePath(), "install.lock");
            if (installFile.exists()) {
                return false;
            } else {
                installFile.createNewFile();
            }

            // 创建新的用户
            User user = new User();
            user.setUserName(userName);
            if (StringUtils.isBlank(userDisplayName)) {
                userDisplayName = userName;
            }
            user.setUserDisplayName(userDisplayName);
            user.setUserEmail(userEmail);
            user.setUserPass(SourUtil.getMD5(userPwd));
            userService.saveByUser(user);

            // 保存博客标题和博客地址设置
            optionsService.saveOption("blog_title", blogTitle);
            optionsService.saveOption("blog_url", blogUrl);

            // 设置默认主题
            optionsService.saveOption("theme", "Kaze");

            // 更新日志
            logsService.saveByLogs(
                    new Logs(
                            LogsRecord.INSTALL,
                            "安装成功，欢迎使用Sour。",
                            SourUtil.getIpAddr(request),
                            SourUtil.getDate()
                    )
            );

            SourConst.OPTIONS.clear();
            SourConst.OPTIONS = optionsService.findAllOptions();

            configuration.setSharedVariable("options", optionsService.findAllOptions());
            configuration.setSharedVariable("user", userService.findUser());
        } catch (IOException | TemplateModelException e) {
            log.error(e.getMessage());
            return false;
        }

        return true;
    }
}
