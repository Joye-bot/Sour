package com.sour.config;

import com.sour.model.tag.CommonTagDirective;
import com.sour.service.OptionsService;
import com.sour.service.UserService;
import freemarker.template.TemplateModelException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

/**
 * freemarker配置
 *
 * @author dell
 * @date 2021/09/19
 */
@Configuration
public class FreeMarkerConfig {

    private final freemarker.template.Configuration configuration;

    private final CommonTagDirective commonTagDirective;

    private final UserService userService;

    private final OptionsService optionsService;

    @Autowired
    public FreeMarkerConfig(freemarker.template.Configuration configuration,
                            CommonTagDirective commonTagDirective,
                            OptionsService optionsService,
                            UserService userService) {
        this.configuration = configuration;
        this.commonTagDirective = commonTagDirective;
        this.optionsService = optionsService;
        this.userService = userService;
    }

    @PostConstruct
    public void setShareVariable() {
        configuration.setSharedVariable("commonTag", commonTagDirective);
        try {
            configuration.setSharedVariable("options", optionsService.findAllOptions());
            configuration.setSharedVariable("user", userService.findUser());
        } catch (TemplateModelException e) {
            e.printStackTrace();
        }
    }
}
