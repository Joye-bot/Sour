package com.sour.service.impl;

import com.sour.model.domain.Attachment;
import com.sour.repository.AttachmentRepository;
import com.sour.service.AttachmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * 附件业务逻辑层实现类
 *
 * @author nndmw
 * @date 2021/10/04
 */
@Service
public class AttachmentServiceImpl implements AttachmentService {

    private final AttachmentRepository attachmentRepository;

    @Autowired
    public AttachmentServiceImpl(AttachmentRepository attachmentRepository) {
        this.attachmentRepository = attachmentRepository;
    }

    /**
     * 查询所有附件
     *
     * @return {@link List}<{@link Attachment}>
     */
    @Override
    public List<Attachment> findAllAttachments() {
        return attachmentRepository.findAll();
    }

    /**
     * 查询所有附件，分页
     *
     * @param pageable 分页
     * @return {@link Page}<{@link Attachment}>
     */
    @Override
    public Page<Attachment> findAllAttachments(Pageable pageable) {
        return attachmentRepository.findAll(pageable);
    }

    /**
     * 添加附件信息
     *
     * @param attachment 附件
     * @return {@link Attachment}
     */
    @Override
    public Attachment saveByAttachment(Attachment attachment) {
        return attachmentRepository.save(attachment);
    }

    /**
     * 根据附件编号查询附件
     *
     * @param attachId 附件编号
     * @return {@link Optional}<{@link Attachment}>
     */
    @Override
    public Optional<Attachment> findByAttachId(Long attachId) {
        return attachmentRepository.findById(attachId);
    }

    /**
     * 根据编号移除附件
     * @param attachId 附件编号
     * @return {@link Attachment}
     */
    @Override
    public Attachment removeByAttachId(Long attachId) {
        final Optional<Attachment> attachment = this.findByAttachId(attachId);
        if (attachment.isPresent()) {
            attachmentRepository.delete(attachment.get());
            return attachment.get();
        }
        return null;
    }
}
