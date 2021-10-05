package com.sour.web.controller.admin;

import com.sour.service.OptionsService;
import freemarker.template.Configuration;
import freemarker.template.TemplateModelException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 系统设置控制器
 *
 * @author nndmw
 * @date 2021/09/12
 */
@Controller
@RequestMapping("/admin/option")
@Slf4j
public class OptionController {

    private final OptionsService optionsService;

    private final Configuration configuration;

    @Autowired
    public OptionController(OptionsService optionsService, Configuration configuration) {
        this.optionsService = optionsService;
        this.configuration = configuration;
    }

    /**
     * 请求跳转到option页面并完成渲染
     *
     * @return {@link String}
     */
    @GetMapping
    public String options() {
        return "admin/admin_option";
    }

    /**
     * 保存设置选项
     *
     * @param options 选项
     * @return boolean true：保存成功，false：保存失败
     */
    @PostMapping(value = "/save")
    @ResponseBody
    public boolean saveOptions(@RequestParam Map<String, String> options) {
        try {
            optionsService.saveOptions(options);
            // 刷新options
            configuration.setSharedVariable("options", optionsService.findAllOptions());
            log.info("所保存的设置选项列表：{}", options);
            return true;
        } catch (TemplateModelException e) {
            log.error("未知错误：{}", e.getMessage());
            return false;
        }
    }
}
