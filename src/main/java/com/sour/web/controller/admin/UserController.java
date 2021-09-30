package com.sour.web.controller.admin;

import com.sour.model.domain.User;
import com.sour.service.UserService;
import com.sour.util.SourUtil;
import freemarker.template.Configuration;
import freemarker.template.TemplateModelException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

/**
 * 用户控制器
 *
 * @author nndmw
 * @date 2021/09/16
 */
@Controller
@RequestMapping(value = "/admin/profile")
@Slf4j
public class UserController {

    private final UserService userService;

    private final Configuration configuration;

    @Autowired
    public UserController(UserService userService, Configuration configuration) {
        this.userService = userService;
        this.configuration = configuration;
    }

    /**
     * 获取用户信息并跳转
     *
     * @return {@link String}
     */
    @GetMapping
    public String profile() {
        return "admin/admin_profile";
    }

    /**
     * 处理修改用户资料的请求
     *
     * @param user    用户
     * @param session 会话
     * @return boolean true：修改成功，false：修改失败
     */
    @PostMapping(value = "/save")
    @ResponseBody
    public boolean saveProfile(@ModelAttribute User user, HttpSession session) {
        try {
            if (user != null) {
                userService.saveByUser(user);
                configuration.setSharedVariable("user", userService.findUser());
                session.invalidate();
            } else {
                return false;
            }
        } catch (TemplateModelException e) {
            log.error("未知错误：{}", e.getMessage());
            return false;
        }
        return true;
    }

    /**
     * 处理修改密码的请求
     *
     * @param oldPass 旧密码
     * @param newPass 新密码
     * @param userId  用户编号
     * @param session 会话
     * @return boolean true：修改密码成功，false：修改密码失败
     */
    @PostMapping(value = "/changePass")
    @ResponseBody
    public boolean changePass(@ModelAttribute("oldPass") String oldPass,
                              @ModelAttribute("newPass") String newPass,
                              @ModelAttribute("userId") Long userId,
                              HttpSession session) {
        try {
            final User user = userService.findByUserIdAndUserPass(userId, SourUtil.getMD5(oldPass));
            if (user != null) {
                user.setUserPass(SourUtil.getMD5(newPass));
                userService.saveByUser(user);
                session.invalidate();
            } else {
                return false;
            }
        } catch (Exception e) {
            log.error("修改密码，未知错误：{}", e.getMessage());
            return false;
        }
        return true;
    }
}
