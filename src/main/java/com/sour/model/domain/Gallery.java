package com.sour.model.domain;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * 图库实体类
 *
 * @author nndmw
 * @date 2021/09/05
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@Table(name = "sour_gallery")
public class Gallery implements Serializable {

    private static final long serialVersionUID = 2259555748667781736L;

    /**
     * 图片编号
     */
    @Id
    @GeneratedValue
    private Long galleryId;

    /**
     * 图片名称
     */
    private String galleryName;

    /**
     * 图片描述
     */
    private String galleryDesc;

    /**
     * 图片日期/拍摄日期
     */
    private String galleryDate;

    /**
     * 图片拍摄地点
     */
    private String galleryLocation;

    /**
     * 图片缩略地址
     */
    private String galleryThumbnailUrl;

    /**
     * 图片地址
     */
    private String galleryUrl;
}
