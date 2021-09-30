package com.sour.repository;

import com.sour.model.domain.Options;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 设置选项持久层
 *
 * @author nndmw
 * @date 2021/09/19
 */
public interface OptionsRepository extends JpaRepository<Options, Long> {

    /**
     * 根据key查询单个设置
     *
     * @param key 关键字
     * @return {@link Options}
     */
    Options findOptionsByOptionName(String key);
}
