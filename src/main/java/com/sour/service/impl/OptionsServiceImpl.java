package com.sour.service.impl;

import com.sour.model.domain.Options;
import com.sour.repository.OptionsRepository;
import com.sour.service.OptionsService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 设置业务层实现类
 *
 * @author nndmw
 * @date 2021/09/19
 */
@Service
public class OptionsServiceImpl implements OptionsService {

    private final OptionsRepository optionsRepository;

    @Autowired
    public OptionsServiceImpl(OptionsRepository optionsRepository) {
        this.optionsRepository = optionsRepository;
    }

    /**
     * 找到所有设置选项
     *
     * @return {@link Map}<{@link String}, {@link String}>
     */
    @Override
    public Map<String, String> findAllOptions() {
        final Map<String, String> options = new HashMap<>(10);
        final List<Options> optionsList = optionsRepository.findAll();
        if (optionsList != null) {
            optionsList.forEach(option -> options.put(option.getOptionName(), option.getOptionValue()));
        }
        return options;
    }

    /**
     * 根据key查询单个设置
     *
     * @param key 关键字
     * @return {@link String}
     */
    @Override
    public String findOneOption(String key) {
        Options options = optionsRepository.findOptionsByOptionName(key);
        if (options != null) {
            return options.getOptionValue();
        }
        return null;
    }

    /**
     * 保存单个设置选项
     *
     * @param key   key
     * @param value value
     */
    @Override
    public void saveOption(String key, String value) {
        Options options;
        if (StringUtils.equals(value, "")) {
            options = new Options();
            options.setOptionName(key);
            this.removeOption(options);
        } else {
            if (StringUtils.isNoneEmpty(key)) {
                if (optionsRepository.findOptionsByOptionName(key) == null) {
                    options = new Options();
                    options.setOptionName(key);
                    options.setOptionValue(value);
                    optionsRepository.save(options);
                } else {
                    options = optionsRepository.findOptionsByOptionName(key);
                    options.setOptionValue(value);
                    optionsRepository.save(options);
                }
            }
        }
    }

    /**
     * 保存多个设置选项
     *
     * @param options 选项
     */
    @Override
    public void saveOptions(Map<String, String> options) {
        if (options != null && !options.isEmpty()) {
            options.forEach(this::saveOption);
        }
    }

    /**
     * 移除设置项
     *
     * @param options 选项
     */
    @Override
    public void removeOption(Options options) {
        optionsRepository.delete(options);
    }
}
