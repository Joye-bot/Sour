package com.sour.model.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * 主题
 *
 * @author nndmw
 * @date 2021/09/25
 */
@Data
public class Theme implements Serializable {

    private static final long serialVersionUID = -861816756004912525L;

    /**
     * 主题名称
     */
    private String themeName;

    /**
     * 是否支持设置
     */
    private boolean hasOptions;
}
