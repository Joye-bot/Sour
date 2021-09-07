package com.sour.service.impl;

import com.sour.model.domain.Logs;
import com.sour.repository.LogsRepository;
import com.sour.service.LogsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 日志业务层实现类
 *
 * @author nndmw
 * @date 2021/09/06
 */
@Service
public class LogsServiceImpl implements LogsService {

    private final LogsRepository logsRepository;

    @Autowired
    public LogsServiceImpl(LogsRepository logsRepository) {
        this.logsRepository = logsRepository;
    }

    /**
     * 保存日志
     *
     * @param logs 日志
     * @return {@link Logs}
     */
    @Override
    public Logs saveByLogs(Logs logs) {
        return logsRepository.save(logs);
    }
}
