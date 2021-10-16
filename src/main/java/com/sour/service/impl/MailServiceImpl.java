package com.sour.service.impl;

import com.sour.model.dto.SourConst;
import com.sour.service.MailService;
import com.sour.util.SourUtil;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import io.github.biezhi.ome.OhMyEmail;
import io.github.biezhi.ome.SendMailException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import java.io.IOException;
import java.util.Map;

/**
 * 邮件业务逻辑层实现类
 *
 * @author nndmw
 * @date 2021/10/14
 */
@Service
public class MailServiceImpl implements MailService {

    private final FreeMarkerConfigurer freeMarker;

    @Autowired
    public MailServiceImpl(FreeMarkerConfigurer freeMarker) {
        this.freeMarker = freeMarker;
    }

    /**
     * 发送邮件
     *
     * @param to      接收者
     * @param subject 主题
     * @param content 内容
     */
    @Override
    public void sendMail(String to, String subject, String content) {
        // 配置邮件服务器
        SourUtil.configMail(
                SourConst.OPTIONS.get("mail_smtp_host"),
                SourConst.OPTIONS.get("mail_smtp_username"),
                SourConst.OPTIONS.get("mail_smtp_password")
        );
        try {
            OhMyEmail.subject(subject)
                    .from(SourConst.OPTIONS.get("mail_from_name"))
                    .to(to)
                    .text(content)
                    .send();
        } catch (SendMailException e) {
            e.printStackTrace();
        }
    }

    /**
     * 发送模板邮件
     *
     * @param to           接收者
     * @param subject      主题
     * @param content      内容
     * @param templateName 模板路径
     */
    @Override
    public void sendTemplateMail(String to, String subject, Map<String, Object> content, String templateName) {
        // 配置邮件服务器
        SourUtil.configMail(
                SourConst.OPTIONS.get("mail_smtp_host"),
                SourConst.OPTIONS.get("mail_smtp_username"),
                SourConst.OPTIONS.get("mail_smtp_password")
        );
        String text;
        try {
            final Template template = freeMarker.getConfiguration().getTemplate(templateName);
            text = FreeMarkerTemplateUtils.processTemplateIntoString(template, content);
            OhMyEmail.subject(subject)
                    .from(SourConst.OPTIONS.get("mail_from_name"))
                    .to(to)
                    .html(text)
                    .send();
        } catch (IOException | TemplateException | SendMailException e) {
            e.printStackTrace();
        }
    }
}
