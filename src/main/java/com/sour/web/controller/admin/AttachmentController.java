package com.sour.web.controller.admin;

import com.sour.model.domain.Attachment;
import com.sour.model.domain.Logs;
import com.sour.model.dto.LogsRecord;
import com.sour.model.dto.SourConst;
import com.sour.service.AttachmentService;
import com.sour.service.LogsService;
import com.sour.util.SourUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

/**
 * 附件控制器
 *
 * @author dell
 * @date 2021/09/18
 */
@Controller
@RequestMapping(value = "/admin/attachments")
@Slf4j
public class AttachmentController {

    private final AttachmentService attachmentService;

    private final LogsService logsService;

    @Autowired
    public AttachmentController(AttachmentService attachmentService, LogsService logsService) {
        this.attachmentService = attachmentService;
        this.logsService = logsService;
    }

    /**
     * 获取upload的所有图片资源并渲染页面
     *
     * @param model 模型
     * @param page  页面
     * @param size  大小
     * @return {@link String}
     */
    @GetMapping
    public String attachments(Model model,
                              @RequestParam(value = "page", defaultValue = "0") Integer page,
                              @RequestParam(value = "size", defaultValue = "18") Integer size) {
        final Sort sort = Sort.by(Sort.Direction.DESC, "attachId");
        final Pageable pageable = PageRequest.of(page, size, sort);
        final Page<Attachment> attachments = attachmentService.findAllAttachments(pageable);
        model.addAttribute("attachments", attachments);
        return "admin/admin_attachment";
    }

    /**
     * 跳转到附件页面
     *
     * @param model 模型
     * @param page  页面
     * @param id    id
     * @return {@link String}
     */
    @GetMapping(value = "/select")
    public String selectAttachment(Model model,
                                   @RequestParam(value = "page", defaultValue = "0") Integer page,
                                   @RequestParam(value = "id") String id) {
        final Sort sort = Sort.by(Sort.Direction.DESC, "attachId");
        final Pageable pageable = PageRequest.of(page, 18, sort);
        final Page<Attachment> attachments = attachmentService.findAllAttachments(pageable);
        model.addAttribute("attachments", attachments);
        model.addAttribute("id", id);
        return "admin/widget/_attachment-select";
    }

    /**
     * 上传附件
     *
     * @param file    文件
     * @param request 请求
     * @return {@link Map}<{@link String}, {@link Object}>
     */
    @PostMapping(value = "/upload", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Map<String, Object> upload(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
        return uploadAttachment(file, request);
    }

    /**
     * editor.md上传图片
     *
     * @param file    文件
     * @param request 请求
     * @return {@link Map}<{@link String}, {@link Object}>
     */
    @PostMapping(value = "/upload/editor", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Map<String, Object> editorUpload(@RequestParam("editormd-image-file") MultipartFile file,
                                            HttpServletRequest request) {
        return uploadAttachment(file, request);
    }

    public Map<String, Object> uploadAttachment(MultipartFile file, HttpServletRequest request) {
        final Map<String, Object> result = new HashMap<>();
        if (!file.isEmpty()) {
            try {
                final File basePath = new File(ResourceUtils.getURL("classpath:").getPath());
                final StringBuffer sbMedia = new StringBuffer("upload/");
                sbMedia.append(SourUtil.YEAR).append("/").append(SourUtil.MONTH).append("/");
                final File mediaPath = new File(basePath.getAbsolutePath(), sbMedia.toString());
                if (!mediaPath.exists()) {
                    mediaPath.mkdirs();
                }
                file.transferTo(new File(mediaPath.getAbsolutePath(), file.getOriginalFilename()));
                final String fileName = file.getOriginalFilename();
                final String nameWithOutSuffix = fileName.substring(0, fileName.lastIndexOf('.'));
                final String fileSuffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.') + 1);

                // 保存在数据库
                final Attachment attachment = new Attachment();
                attachment.setAttachName(fileName);
                attachment.setAttachPath("/upload/" + SourUtil.YEAR + "/" + SourUtil.MONTH + "/" + fileName);
                System.out.println(mediaPath.getAbsolutePath() + "/" + fileName);

                // 判断图片大小，如果长宽都小于500，则保存原始图片路径
                final BufferedImage sourceImg = ImageIO.read(new FileInputStream(mediaPath.getPath() + "/" + fileName));
                if (sourceImg.getWidth() < 500 && sourceImg.getHeight() < 500) {
                    attachment.setAttachSmallPath("/upload/" + SourUtil.YEAR + "/" + SourUtil.MONTH + "/" + fileName);
                } else {
                    attachment.setAttachSmallPath(
                            "/upload/" + SourUtil.YEAR + "/" + SourUtil.MONTH + "/" + nameWithOutSuffix + "_small." + fileSuffix
                    );

                    // 剪裁图片
                    SourUtil.cutCenterImage(
                            mediaPath.getAbsolutePath() + "/" + fileName,
                            mediaPath.getAbsolutePath() + "/" + nameWithOutSuffix + "_small." + fileSuffix,
                            500, 500, fileSuffix
                    );
                }

                attachment.setAttachType(file.getContentType());
                attachment.setAttachSuffix("." + fileSuffix);
                attachment.setAttachCreated(SourUtil.getDate());
                attachmentService.saveByAttachment(attachment);

                updateConst();
                log.info("上传文件[{}]到[{}]成功", file.getOriginalFilename(), mediaPath.getAbsolutePath());
                logsService.saveByLogs(
                        new Logs(LogsRecord.UPLOAD_FILE, file.getOriginalFilename(), SourUtil.getIpAddr(request), SourUtil.getDate())
                );

                result.put("success", 1);
                result.put("message", "上传成功！");
                result.put("url", attachment.getAttachPath());
            } catch (IOException e) {
                log.error("未知错误：{}", e.getMessage());
                result.put("success", 0);
                result.put("message", "上传失败！");
            }
        } else {
            log.error("文件不能为空");
        }
        return result;
    }

    /**
     * 刷新SourConst
     */
    private void updateConst() {
        SourConst.ATTACHMENTS.clear();
        SourConst.ATTACHMENTS = attachmentService.findAllAttachments();
    }

    /**
     * 处理获取附件详情的请求
     *
     * @param model    模型
     * @param attachId 附件编号
     * @return {@link String}
     */
    @GetMapping(value = "/attachment")
    public String attachmentDetail(Model model, @PathParam("attachId") Long attachId) {
        final Optional<Attachment> attachment = attachmentService.findByAttachId(attachId);
        attachment.ifPresent(value -> model.addAttribute("attachment", value));

        // 设置选项
        model.addAttribute("options", SourConst.OPTIONS);
        return "admin/widget/_attachment-detail";
    }

    /**
     * 移除附件的请求
     *
     * @param attachId 附件编号
     * @param request  请求
     * @return boolean true：y移除附件成功，false：移除附件失败
     */
    @GetMapping(value = "/remove")
    @ResponseBody
    public boolean removeAttachment(@PathParam("attachId") Long attachId, HttpServletRequest request) {
        Optional<Attachment> attachment = attachmentService.findByAttachId(attachId);
        String delFileName = attachment.get().getAttachName();
        String delSmallFileName = delFileName.substring(0, delFileName.lastIndexOf(".")) + "_small" + attachment.get().getAttachSuffix();
        try {
            // 删除数据库中的内容
            attachmentService.removeByAttachId(attachId);
            // 刷新SourConst变量
            updateConst();
            // 删除文件
            File basePath = new File(ResourceUtils.getURL("classpath:").getPath());
            File mediaPath = new File(basePath.getAbsolutePath(), attachment.get().getAttachPath().substring(0, attachment.get().getAttachPath().lastIndexOf('/')));
            File delFile = new File(mediaPath.getAbsolutePath() + "/" + delFileName);
            File delSmallFile = new File(mediaPath.getAbsolutePath() + "/" + delSmallFileName);


            BufferedImage sourceImg = ImageIO.read(new FileInputStream(delFile));
            if (sourceImg.getWidth() > 500 && sourceImg.getHeight() > 500) {
                if (delSmallFile.exists()) {
                    if (delSmallFile.delete()) {
                        updateConst();
                    }
                }
            }
            if (delFile.exists() && delFile.isFile()) {
                if (delFile.delete()) {
                    updateConst();
                    log.info("删除文件[{}]成功！", delFileName);
                    logsService.saveByLogs(
                            new Logs(LogsRecord.REMOVE_FILE, delFileName, SourUtil.getIpAddr(request), SourUtil.getDate())
                    );
                } else {
                    log.error("删除附件[{}]失败", delFileName);
                    return false;
                }
            }
        } catch (IOException e) {
            log.error("删除附件[{}]失败！：{}", delFileName, e.getMessage());
            return false;
        }
        return true;
    }
}
