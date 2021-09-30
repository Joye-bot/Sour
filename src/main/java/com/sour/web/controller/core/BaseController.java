package com.sour.web.controller.core;

/**
 * 基本控制器
 *
 * @author nndmw
 * @date 2021/09/25
 */
public abstract class BaseController {

    /**
     * 定义默认主题
     */
    public static String THEME = "default";

    /**
     * 根据主题名称渲染页面
     *
     * @param pageName 页面名称
     * @return {@link String}
     */
    public String render(String pageName) {
        return "themes/" + THEME + "/" + pageName;
    }
}
