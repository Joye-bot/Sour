package com.sour.service;

import java.util.Map;

/**
 * 设置业务层
 *
 * @author nndmw
 * @date 2021/09/19
 */
public interface OptionsService {

    /**
     * 获取所有设置选项
     *
     * @return {@link Map}<{@link String}, {@link String}>
     */
    Map<String, String> findAllOptions();

    /**
     * 根据key查询单个设置
     *
     * @param key 关键字
     * @return {@link String}
     */
    String findOneOption(String key);
}
