package com.sour.web.controller.core;

import com.sour.model.domain.*;
import com.sour.model.dto.LogsRecord;
import com.sour.model.dto.SourConst;
import com.sour.service.*;
import com.sour.util.SourUtil;
import freemarker.template.Configuration;
import freemarker.template.TemplateModelException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 安装控制器
 *
 * @author nndmw
 * @date 2021/10/12
 */
@Controller
@RequestMapping(value = "/install")
@Slf4j
public class InstallController {

    private final UserService userService;

    private final OptionsService optionsService;

    private final LogsService logsService;

    private final CategoryService categoryService;

    private final PostService postService;

    private final CommentService commentService;

    private final Configuration configuration;

    @Autowired
    public InstallController(UserService userService,
                             OptionsService optionsService,
                             LogsService logsService,
                             CategoryService categoryService,
                             PostService postService,
                             CommentService commentService,
                             Configuration configuration) {
        this.userService = userService;
        this.optionsService = optionsService;
        this.logsService = logsService;
        this.categoryService = categoryService;
        this.postService = postService;
        this.commentService = commentService;
        this.configuration = configuration;
    }

    /**
     * 渲染安装页面
     *
     * @param model 模型
     * @return {@link String}
     */
    @GetMapping
    public String install(Model model) {
        try {
            File basePath = new File(ResourceUtils.getURL("classpath:").getPath());
            File installFile = new File(basePath.getAbsolutePath(), "install.lock");
            if (installFile.exists()) {
                model.addAttribute("isInstall", true);
            } else {
                model.addAttribute("isInstall", false);
            }
        } catch (FileNotFoundException e) {
            log.error(e.getMessage());
        }
        return "common/install";
    }

    /**
     * 执行安装
     *
     * @param blogTitle       博客标题
     * @param blogUrl         博客网址
     * @param userName        用户名
     * @param userDisplayName 用户显示名称
     * @param userEmail       用户邮箱
     * @param userPwd         用户密码
     * @param request         请求
     * @return boolean
     */
    @PostMapping(value = "/do")
    @ResponseBody
    public boolean doInstall(@RequestParam("blogTitle") String blogTitle,
                             @RequestParam("blogUrl") String blogUrl,
                             @RequestParam("userName") String userName,
                             @RequestParam("userDisplayName") String userDisplayName,
                             @RequestParam("userEmail") String userEmail,
                             @RequestParam("userPwd") String userPwd,
                             HttpServletRequest request) {
        try {
            // 创建install.lock文件
            final File basePath = new File(ResourceUtils.getFile("classpath:").getPath());
            final File installFile = new File(basePath.getAbsolutePath(), "install.lock");
            if (installFile.exists()) {
                return false;
            } else {
                installFile.createNewFile();
            }

            // 创建新的用户
            final User user = new User();
            user.setUserName(userName);
            if (StringUtils.isBlank(userDisplayName)) {
                userDisplayName = userName;
            }
            user.setUserDisplayName(userDisplayName);
            user.setUserEmail(userEmail);
            user.setUserPass(SourUtil.getMD5(userPwd));
            userService.saveByUser(user);

            // 默认分类
            final Category category = new Category();
            category.setCateName("Default");
            category.setCateUrl("default");
            category.setCateDesc("默认分类");
            categoryService.saveByCategory(category);

            // 第一篇文章
            final Post post = new Post();
            List<Category> categories = new ArrayList<>();
            categories.add(category);
            post.setPostTitle("Hello Sour!");
            post.setPostContentMd("#Hello Sour!\n" + "欢迎使用Sour进行创作，删除这篇文章后赶紧开始吧。");
            post.setPostContent("<h1 id=\"h1-hello-sour-\"><a name=\"Hello Sour!\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>Hello Halo!</h1><p>欢迎使用Sour进行创作，删除这篇文章后赶紧开始吧。</p>\n");
            post.setPostSummary("欢迎使用Sour进行创作，删除这篇文章后赶紧开始吧。");
            post.setPostStatus(0);
            post.setPostDate(new Date());
            post.setPostUrl("hello-sour");
            post.setUser(user);
            post.setCategories(categories);
            postService.saveByPost(post);

            // 第一个评论
            Comment comment = new Comment();
            comment.setPost(post);
            comment.setCommentAuthor("nndmw");
            comment.setCommentAuthorEmail("2541019174@qq.com");
            comment.setCommentAuthorUrl("https://www.nndmw.club");
            comment.setCommentAuthorIp("127.0.0.1");
            comment.setCommentAuthorAvatarMd5("9e7c68b29d6e542b36f73a05ea35e1ea");
            comment.setCommentDate(new Date());
            comment.setCommentContent("欢迎，欢迎！");
            comment.setCommentAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36");
            comment.setIsAdmin(0);
            commentService.saveByComment(comment);

            // 保存博客标题和博客地址设置
            optionsService.saveOption("blog_title", blogTitle);
            optionsService.saveOption("blog_url", blogUrl);

            // 设置默认主题
            optionsService.saveOption("theme", "Kaze");

            // 建立网站时间
            optionsService.saveOption("blog_start", SourUtil.getStringDate("yyyy-MM-dd"));

            // 默认不配置邮件系统
            optionsService.saveOption("smtp_email_enable", "false");

            // 更新日志
            logsService.saveByLogs(
                    new Logs(
                            LogsRecord.INSTALL,
                            "安装成功，欢迎使用Sour。",
                            SourUtil.getIpAddr(request),
                            SourUtil.getDate()
                    )
            );

            SourConst.OPTIONS.clear();
            SourConst.OPTIONS = optionsService.findAllOptions();

            configuration.setSharedVariable("options", optionsService.findAllOptions());
            configuration.setSharedVariable("user", userService.findUser());
        } catch (IOException | TemplateModelException e) {
            log.error(e.getMessage());
            return false;
        }

        return true;
    }
}
