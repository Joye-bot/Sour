package com.sour.service;

import com.sour.model.domain.Attachment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

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

    /**
     * 根据附件编号查询附件
     *
     * @param attachId 附件编号
     * @return {@link Optional}<{@link Attachment}>
     */
    Optional<Attachment> findByAttachId(Long attachId);

    /**
     * 根据编号移除附件
     *
     * @param attachId 附件编号
     * @return {@link Attachment}
     */
    Attachment removeByAttachId(Long attachId);
}
