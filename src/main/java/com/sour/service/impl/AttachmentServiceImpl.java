package com.sour.service.impl;

import com.sour.model.domain.Attachment;
import com.sour.repository.AttachmentRepository;
import com.sour.service.AttachmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

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
}
