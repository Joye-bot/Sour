package com.sour.repository;

import com.sour.model.domain.Attachment;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 附件持久层
 *
 * @author nndmw
 * @date 2021/10/04
 */
public interface AttachmentRepository extends JpaRepository<Attachment, Long> {
}
