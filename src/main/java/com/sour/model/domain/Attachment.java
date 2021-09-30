package com.sour.model.domain;

import lombok.*;
import org.hibernate.Hibernate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

/**
 * 附件实体类
 *
 * @author dell
 * @date 2021/09/05
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@Table(name = "sour_attachment")
public class Attachment implements Serializable {

    private static final long serialVersionUID = 7377374701167196067L;

    /**
     * 附件编号
     */
    @Id
    @GeneratedValue
    private Long attachId;

    /**
     * 附件名
     */
    private String attachName;

    /**
     * 附件路径
     */
    private String attachPath;

    /**
     * 附件缩略图路径
     */
    private String attachSmallPath;

    /**
     * 附件类型
     */
    private String attachType;

    /**
     * 附件后缀
     */
    private String attachSuffix;

    /**
     * 上传时间
     */
    private Date attachCreated;

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Attachment that = (Attachment) o;
        return Objects.equals(attachId, that.attachId) &&
                Objects.equals(attachName, that.attachName) &&
                Objects.equals(attachPath, that.attachPath) &&
                Objects.equals(attachSmallPath, that.attachSmallPath) &&
                Objects.equals(attachType, that.attachType) &&
                Objects.equals(attachSuffix, that.attachSuffix) &&
                Objects.equals(attachCreated, that.attachCreated);
    }

    @Override
    public int hashCode() {
        return Objects.hash(
                attachId, attachName, attachPath, attachSmallPath,
                attachType, attachSuffix, attachCreated
        );
    }
}
