package com.sour.web.controller.admin;

import com.sour.model.domain.Logs;
import com.sour.model.dto.LogsRecord;
import com.sour.service.LogsService;
import com.sour.service.OptionsService;
import com.sour.util.SourUtil;
import com.sour.web.controller.core.BaseController;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

/**
 * 主题控制器
 *
 * @author nndmw
 * @date 2021/09/18
 */
@Controller
@RequestMapping(value = "/admin/themes")
@Slf4j
public class ThemeController {

    private final OptionsService optionsService;

    private final LogsService logsService;

    @Autowired
    public ThemeController(OptionsService optionsService, LogsService logsService) {
        this.optionsService = optionsService;
        this.logsService = logsService;
    }

    /**
     * 渲染主题设置页面
     *
     * @return {@link String}
     */
    @GetMapping
    public String themes() {
        return "admin/admin_theme";
    }

    /**
     * 编辑主题
     *
     * @param model 模型
     * @return {@link String}
     */
    @GetMapping(value = "/editor")
    public String editor(Model model) {
        final List<String> tpls = SourUtil.getTplName(BaseController.THEME);
        model.addAttribute("tpls", tpls);
        return "admin/admin_theme_editor";
    }

    /**
     * 获取模板文件内容
     *
     * @param tplName 模板文件名
     * @return {@link String}
     */
    @GetMapping(value = "/getTpl", produces = "text/text;charset=UTF-8")
    @ResponseBody
    public String getTplContent(@RequestParam("tplName") String tplName) {
        String tplContent = "";
        try {
            // 获取项目根路径
            File basePath = new File(ResourceUtils.getURL("classpath:").getPath());
            // 获取主题路路径
            File themesPath = new File(basePath.getAbsolutePath(), "templates/themes/" + BaseController.THEME + "/" + tplName);
            tplContent = SourUtil.getFileContent(themesPath.getAbsolutePath());
        } catch (FileNotFoundException e) {
            log.error("获取模板文件错误：{}", e.getMessage());
        }
        return tplContent;
    }

    /**
     * 保存修改模板
     *
     * @param tplName    模板名称
     * @param tplContent 模板内容
     * @return boolean true：修改成功，false：修改失败
     */
    @PostMapping(value = "/editor/save")
    @ResponseBody
    public boolean saveTpl(@RequestParam("tplName") String tplName,
                           @RequestParam("tplContent") String tplContent) {
        if (StringUtils.isBlank(tplContent)) {
            return false;
        }
        try {
            // 获取项目根路径
            File basePath = new File(ResourceUtils.getURL("classpath:").getPath());
            // 获取主题路径
            File tplPath = new File(basePath.getAbsolutePath(), "templates/themes/" + BaseController.THEME + "/" + tplName);
            byte[] tplContentBytes = tplContent.getBytes(StandardCharsets.UTF_8);
            Files.write(Paths.get(tplPath.getAbsolutePath()), tplContentBytes);
        } catch (IOException e) {
            log.error("文件保存失败：{}", e.getMessage());
            return false;
        }
        return true;
    }

    /**
     * 激活主题
     *
     * @param siteTheme 主题名称
     * @param request   请求
     * @return boolean true：激活成功，false：激活失败
     */
    @GetMapping(value = "/set")
    @ResponseBody
    public boolean activeTheme(@PathParam("siteTheme") String siteTheme, HttpServletRequest request) {
        try {
            // 保存主题设置项
            optionsService.saveOption("theme", siteTheme);
            // 设置主题
            BaseController.THEME = siteTheme;
            log.info("已将主题改变为：" + siteTheme);
            logsService.saveByLogs(
                    new Logs(LogsRecord.CHANGE_THEME, "更换为" + siteTheme, SourUtil.getIpAddr(request), SourUtil.getDate())
            );
            return true;
        } catch (Exception e) {
            log.error("主题设置失败，当前主题为：" + siteTheme);
            return false;
        }
    }
}
