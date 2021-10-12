package com.sour.model.dto;

/**
 * 日志记录
 *
 * @author nndmw
 * @date 2021/09/06
 */
public interface LogsRecord {

    String INSTALL = "初始化博客";

    String LOGIN = "登录后台";

    String LOGIN_SUCCESS = "登录成功";

    String LOGIN_ERROR = "登录失败";

    String LOGOUT = "退出登录";

    String PUSH_POST = "发表文章";

    String REMOVE_POST = "删除文章";

    String CHANGE_THEME = "更换主题";

    String UPLOAD_FILE = "上传附件";

    String REMOVE_FILE = "移除附件";

    String UPLOAD_THEME = "上传主题";
}
