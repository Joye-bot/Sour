package com.sour.model.tag;

import com.sour.service.PostService;
import freemarker.core.Environment;
import freemarker.template.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;

/**
 * 标签条指令
 *
 * @author dell
 * @date 2021/10/01
 */
@Component
public class ArticleTagDirective implements TemplateDirectiveModel {

    private static final String METHOD_HEY = "method";

    private final PostService postService;

    @Autowired
    public ArticleTagDirective(PostService postService) {
        this.postService = postService;
    }

    @Override
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
        final DefaultObjectWrapperBuilder builder = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_31);
        if (map.containsKey(METHOD_HEY)) {
            String method = map.get(METHOD_HEY).toString();
            switch (method) {
                case "archivesLess":
                    environment.setVariable("archivesLess", builder.build().wrap(postService.findPostGroupByYear()));
                    break;
                default:
                    break;
            }
        }
        templateDirectiveBody.render(environment.getOut());
    }
}
