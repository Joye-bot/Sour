package com.sour.web.controller.admin;

import com.sour.model.domain.Logs;
import com.sour.model.domain.User;
import com.sour.model.dto.LogsRecord;
import com.sour.model.dto.SourConst;
import com.sour.service.LogsService;
import com.sour.service.PostService;
import com.sour.service.UserService;
import com.sour.util.SourUtil;
import com.sour.web.controller.core.BaseController;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 后台首页控制器
 *
 * @author nndmw
 * @date 2021/08/30
 */
@Slf4j
@Controller
@RequestMapping(value = "/admin")
public class AdminController extends BaseController {

    private final UserService userService;

    private final LogsService logsService;

    private final PostService postService;

    private final HttpServletRequest request;

    @Autowired
    public AdminController(UserService userService, LogsService logsService,
                           PostService postService, HttpServletRequest request) {
        this.userService = userService;
        this.logsService = logsService;
        this.postService = postService;
        this.request = request;
    }

    /**
     * 请求后台页面
     *
     * @param model   模型
     * @param session 会话
     * @return {@link String}
     */
    @GetMapping(value = {"", "/index"})
    public String index(Model model, HttpSession session) {
        // 查询最新的日志
        final List<Logs> logsLatest = logsService.findLogsLatest();
        model.addAttribute("logs", logsLatest);

        // 查询文章条数
        final Integer postCount = postService.findAllPosts(SourConst.POST_TYPE_POST).size();
        model.addAttribute("postCount", postCount);

        return "admin/admin_index";
    }

    /**
     * 处理跳转到登录页的请求
     *
     * @param session 会话
     * @return {@link String}
     */
    @GetMapping(value = "/login")
    public String login(HttpSession session) {
        final User user = (User) session.getAttribute(SourConst.USER_SESSION_KEY);

        // 如果session存在，跳转到后台首页
        if (user != null) {
            return "redirect:/admin";
        }
        return "admin/admin_login";
    }

    /**
     * 验证登录信息
     *
     * @param loginName 登录名
     * @param loginPwd  登录密码
     * @param session   会话
     * @return {@link String}
     */
    @PostMapping(value = "/getLogin")
    @ResponseBody
    public String getLogin(@ModelAttribute("loginName") String loginName,
                           @ModelAttribute("loginPwd") String loginPwd,
                           HttpSession session) {
        String status = "false";
        try {
            final User serviceUser = userService.findUser();
            User user;
            if (StringUtils.equals(serviceUser.getLoginEnable(), "false")) {
                status = "disable";
            } else {
                // 验证是否是邮箱登录
                final Pattern patternEmail = Pattern.compile("\\w[-\\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\\.)+[A-Za-z]{2,14}");
                final Matcher matcher = patternEmail.matcher(loginName);
                if (matcher.find()) {
                    user = userService.userLoginByEmail(loginName, SourUtil.getMD5(loginPwd)).get(0);
                } else {
                    user = userService.userLoginByName(loginName, SourUtil.getMD5(loginPwd)).get(0);
                }
                if (serviceUser == user) {
                    session.setAttribute(SourConst.USER_SESSION_KEY, user);
                    // 重置用户的登录状态为正常
                    userService.updateUserNormal();
                    userService.updateUserLoginLast(new Date());
                    logsService.saveByLogs(new Logs(LogsRecord.LOGIN, LogsRecord.LOGIN_SUCCESS,
                            SourUtil.getIpAddr(request), SourUtil.getDate()));
                    status = "true";
                }
            }
        } catch (Exception e) {
            final Integer errorCount = userService.updateUserLoginError();
            if (errorCount >= 5) {
                userService.updateUserLoginEnable("false");
            }
            userService.updateUserLoginLast(new Date());
            logsService.saveByLogs(new Logs(LogsRecord.LOGIN,
                    LogsRecord.LOGIN_ERROR + "[" + loginName + "," + loginPwd + "}",
                    SourUtil.getIpAddr(request), new Date()));
            log.error("登录失败！：{}", e.getMessage());
            e.printStackTrace();
        }
        return status;
    }

    /**
     * 注销 销毁session
     *
     * @param session 会话
     * @return {@link String}
     */
    @GetMapping(value = "/logOut")
    public String logOut(HttpSession session) {
        final User user = (User) session.getAttribute(SourConst.USER_SESSION_KEY);
        logsService.saveByLogs(new Logs(
                LogsRecord.LOGOUT, user.getUserName(), SourUtil.getIpAddr(request), SourUtil.getDate()
        ));
        session.invalidate();
        log.info("用户[" + user.getUserName() + "]退出登录");
        return "redirect:/admin/login";
    }

    /**
     * 查看所有日志
     *
     * @param model 模型
     * @param page  页面
     * @param size  大小
     * @return {@link String}
     */
    @GetMapping(value = "/logs")
    public String logs(Model model,
                       @RequestParam(value = "page", defaultValue = "0") Integer page,
                       @RequestParam(value = "size", defaultValue = "10") Integer size) {
        final Sort sort = Sort.by(Sort.Direction.DESC, "logId");
        final Pageable pageable = PageRequest.of(page, size, sort);
        final Page<Logs> logs = logsService.findAllLogs(pageable);
        model.addAttribute("logs", logs);
        return "admin/widget/_logs-all";
    }

    /**
     * 清除所有日志
     *
     * @return {@link String}
     */
    @GetMapping(value = "/logs/clear")
    public String logsClear() {
        try {
            logsService.removeAllLogs();
        } catch (Exception e) {
            log.error("未知错误：{}", e.getMessage());
        }
        return "redirect:/admin";
    }

    /**
     * 关于Sour页面
     *
     * @return {@link String}
     */
    @GetMapping(value = "/sour")
    public String sour() {
        return "admin/admin_sour";
    }
}
