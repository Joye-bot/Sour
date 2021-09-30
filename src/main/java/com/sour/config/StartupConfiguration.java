package com.sour.config;

import com.sour.model.dto.SourConst;
import com.sour.model.dto.Theme;
import com.sour.service.OptionsService;
import com.sour.util.SourUtil;
import com.sour.web.controller.core.BaseController;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.event.ContextRefreshedEvent;

import java.util.List;
import java.util.Map;

/**
 * 启动配置
 *
 * @author dell
 * @date 2021/09/19
 */
@Configuration
@Slf4j
public class StartupConfiguration implements ApplicationListener<ContextRefreshedEvent> {

    private final OptionsService optionsService;

    @Autowired
    public StartupConfiguration(OptionsService optionsService) {
        this.optionsService = optionsService;
    }

    @Override
    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
        this.loadOptions();
        this.loadActiveTheme();
        this.loadThemes();
    }

    /**
     * 加载设置选项
     */
    private void loadOptions() {
        try {
            final Map<String, String> options = optionsService.findAllOptions();
            if (options != null && !options.isEmpty()) {
                SourConst.OPTIONS = options;
            }
        } catch (Exception e) {
            log.error("加载主题设置失败：{}", e.getMessage());
        }
    }

    /**
     * 加载主题设置
     */
    private void loadActiveTheme() {
        try {
            final String themeValue = optionsService.findOneOption("theme");
            if (SourUtil.isNotNull(themeValue)) {
                BaseController.THEME = themeValue;
            }
        } catch (Exception e) {
            log.error("加载主题设置失败：{}", e.getMessage());
        }
    }

    /**
     * 加载所有主题
     */
    private void loadThemes() {
        try {
            SourConst.THEMES.clear();
            final List<Theme> themes = SourUtil.getThemes();
            if (themes != null) {
                SourConst.THEMES = themes;
            }
        } catch (Exception e) {
            log.error("加载主题失败：{}", e.getMessage());
        }
    }
}
