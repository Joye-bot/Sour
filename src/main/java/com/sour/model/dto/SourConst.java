package com.sour.model.dto;

import com.sour.model.domain.Attachment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author nndmw
 * @date 2021/09/05
 */
public class SourConst {

    /**
     * user_session
     */
    public static String USER_SESSION_KEY = "user_session";
    public static String POST_TYPE_POST = "post";
    public static String POST_TYPE_PAGE = "page";

    /**
     * 所有设置选项(key, value)
     */
    public static Map<String, String> OPTIONS = new HashMap<>();

    /**
     * 所有主题
     */
    public static List<Theme> THEMES = new ArrayList<>();

    /**
     * 所有文件
     */
    public static List<Attachment> ATTACHMENTS = new ArrayList<>();
}
