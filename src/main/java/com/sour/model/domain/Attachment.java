package com.sour.model.domain;

import jdk.jfr.Enabled;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * 附件实体类
 *
 * @author dell
 * @date 2021/09/05
 */
@Enabled
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
}
