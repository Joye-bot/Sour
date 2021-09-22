package com.sour.service.impl;

import com.sour.model.domain.Options;
import com.sour.repository.OptionsRepository;
import com.sour.service.OptionsService;
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
}
