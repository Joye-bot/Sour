package com.sour.config;

import com.sour.model.dto.SourConst;
import com.sour.service.OptionsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.event.ContextRefreshedEvent;

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
}
