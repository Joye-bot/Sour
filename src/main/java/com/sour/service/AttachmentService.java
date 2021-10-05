package com.sour.service;

import com.sour.model.domain.Attachment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 附件业务逻辑层
 *
 * @author nndmw
 * @date 2021/10/04
 */
public interface AttachmentService {

    /**
     * 查询所有附件
     *
     * @return {@link List}<{@link Attachment}>
     */
    List<Attachment> findAllAttachments();

    /**
     * 查询所有附件，分页
     *
     * @param pageable 分页
     * @return {@link Page}<{@link Attachment}>
     */
    Page<Attachment> findAllAttachments(Pageable pageable);

    /**
     * 添加附件信息
     *
     * @param attachment 附件
     * @return {@link Attachment}
     */
    Attachment saveByAttachment(Attachment attachment);
}
