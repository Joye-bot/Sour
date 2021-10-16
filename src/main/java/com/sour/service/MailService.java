package com.sour.service;

import java.util.Map;

/**
 * 邮件业务逻辑层
 *
 * @author nndmw
 * @date 2021/10/14
 */
public interface MailService {

    /**
     * 发送邮件
     *
     * @param to      接收者
     * @param subject 主题
     * @param content 内容
     */
    void sendMail(String to, String subject, String content);

    /**
     * 发送模板邮件
     *
     * @param to           接收者
     * @param subject      主题
     * @param content      内容
     * @param templateName
     */
    void sendTemplateMail(String to, String subject, Map<String, Object> content, String templateName);
}
