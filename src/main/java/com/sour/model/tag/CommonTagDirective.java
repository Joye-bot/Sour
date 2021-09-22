package com.sour.model.tag;

import com.sour.service.CategoryService;
import com.sour.service.MenuService;
import freemarker.core.Environment;
import freemarker.template.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;

/**
 * 通用标签指令
 *
 * @author dell
 * @date 2021/09/19
 */
@Component
public class CommonTagDirective implements TemplateDirectiveModel {

    private static final String METHOD_KEY = "method";

    private final CategoryService categoryService;

    private final MenuService menuService;

    @Autowired
    public CommonTagDirective(CategoryService categoryService, MenuService menuService) {
        this.categoryService = categoryService;
        this.menuService = menuService;
    }

    @Override
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
        final DefaultObjectWrapperBuilder builder = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_31);
        if (map.containsKey(METHOD_KEY)) {
            final String method = map.get(METHOD_KEY).toString();
            switch (method) {
                case "categories":
                    environment.setVariable("categories", builder.build().wrap(categoryService.findAllCategories()));
                    break;
                case "menus":
                    environment.setVariable("menus", builder.build().wrap(menuService.findAllMenus()));
                    break;
                default:
                    break;
            }
        }
        templateDirectiveBody.render(environment.getOut());
    }
}
