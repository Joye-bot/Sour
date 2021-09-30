package com.sour.util;

import com.sour.model.dto.Theme;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.ResourceUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Sour工具类
 *
 * @author nndmw
 * @date 2021/09/06
 */
@Slf4j
public class SourUtil {

    /**
     * md5加密字符串
     *
     * @param str str
     * @return {@link String}
     */
    public static String getMD5(String str) {
        String md5 = "";
        try {
            final MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(str.getBytes(StandardCharsets.UTF_8));
            byte[] byteDigest = md.digest();
            md5 = bytesToHex(byteDigest);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return md5;
    }

    /**
     * 2进制转16进制
     *
     * @param bytes bytes
     * @return {@link String}
     */
    public static String bytesToHex(byte[] bytes) {
        StringBuilder hexStr = new StringBuilder();
        int num;
        for (byte temp : bytes) {
            num = temp;
            if (num < 0) {
                num += 256;
            }
            if (num < 16) {
                hexStr.append("0");
            }
            hexStr.append(Integer.toHexString(num));
        }
        // 32位小写加密
        return hexStr.toString().toLowerCase();
    }

    /**
     * 获取客户端的ip信息
     *
     * @param request 请求
     * @return {@link String}
     */
    public static String getIpAddr(HttpServletRequest request) {
        if (request == null) {
            return "unknown";
        }
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Forwarded-For");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Real-IP");
        }

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }

        return "0:0:0:0:0:0:0:1".equals(ip) ? "127.0.0.1" : ip;
    }

    /**
     * 获取当前日期
     *
     * @return {@link Date}
     */
    public static Date getDate() {
        return new Date();
    }

    /**
     * 验证字符串是否为空
     *
     * @param str str
     * @return boolean
     */
    public static boolean isNotNull(String str) {
        return str != null && "".equals(str.trim());
    }

    /**
     * 获取所有主题
     *
     * @return {@link List}<{@link Theme}>
     */
    public static List<Theme> getThemes() {
        final List<Theme> themes = new ArrayList<>();
        try {
            final File basePath = new File(ResourceUtils.getURL("classpath:").getPath());
            final File themesPath = new File(basePath.getAbsoluteFile(), "templates/themes");
            final File[] files = themesPath.listFiles();
            if (files != null) {
                Theme theme = null;
                for (File file : files) {
                    if (file.isDirectory()) {
                        theme = new Theme();
                        theme.setThemeName(file.getName());
                        final File optionsPath = new File(themesPath.getAbsoluteFile(), file.getName() + "/module/options.ftl");
                        if (optionsPath.exists()) {
                            theme.setHasOptions(true);
                        } else {
                            theme.setHasOptions(false);
                        }
                        themes.add(theme);
                    }
                }
            }
        } catch (FileNotFoundException e) {
            log.error("主题获取失败：{}", e.getMessage());
        }
        return themes;
    }

    /**
     * 提取html中的文字
     *
     * @param html html
     * @return {@link String}
     */
    public static String htmlToText(String html) {
        if (!"".equals(html)) {
            return html.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", "");
        }
        return "";
    }

    /**
     * 提取文章摘要
     *
     * @param html    html
     * @param summary summary
     * @return {@link String}
     */
    public static String getSummary(String html, Integer summary) {
        return htmlToText(html).substring(0, summary);
    }

    /**
     * 获取主题下的模板文件名
     *
     * @param theme 主题
     * @return {@link List}<{@link String}>
     */
    public static List<String> getTplName(String theme) {
        final List<String> tpls = new ArrayList<>();
        try {
            // 获取项目根路径
            final File basePath = new File(ResourceUtils.getURL("classpath:").getPath());
            // 获取主题路径
            final File themesPath = new File(basePath.getAbsoluteFile(), "templates/themes/" + theme);
            final File modulePath = new File(themesPath.getAbsoluteFile(), "module");
            final File[] baseFiles = themesPath.listFiles();
            final File[] moduleFiles = modulePath.listFiles();
            if (moduleFiles != null) {
                for (File file : moduleFiles) {
                    if (file.isFile() && file.getName().endsWith(".ftl")) {
                        tpls.add("module/" + file.getName());
                    }
                }
            }
            if (baseFiles != null) {
                for (File file : baseFiles) {
                    if (file.isFile() && file.getName().endsWith(".ftl")) {
                        tpls.add(file.getName());
                    }
                }
            }
        } catch (FileNotFoundException e) {
            log.error("未知错误：{}", e.getMessage());
        }
        return tpls;
    }

    /**
     * 获取文件内容
     *
     * @param filePath 文件路径
     * @return {@link String}
     */
    public static String getFileContent(String filePath) {
        final File file = new File(filePath);
        final long fileLength = file.length();
        final byte[] fileContent = new byte[(int) fileLength];
        try {
            final FileInputStream inputStream = new FileInputStream(file);
            inputStream.read(fileContent);
            inputStream.close();
            return new String(fileContent, StandardCharsets.UTF_8);
        } catch (IOException e) {
            log.error("读取模板文件错误：{}", e.getMessage());
        }
        return null;
    }
}
