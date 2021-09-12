package com.sour.service.impl;

import com.sour.model.domain.Logs;
import com.sour.repository.LogsRepository;
import com.sour.service.LogsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

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

    /**
     * 查询最新的五条日志
     *
     * @return {@link List}<{@link Logs}>
     */
    @Override
    public List<Logs> findLogsLatest() {
        return logsRepository.findTopFive();
    }

    /**
     * 查询所有日志并分页
     *
     * @param pageable 可分页
     * @return {@link Page}<{@link Logs}>
     */
    @Override
    public Page<Logs> findAllLogs(Pageable pageable) {
        return logsRepository.findAll(pageable);
    }

    /**
     * 删除所有日志
     */
    @Override
    public void removeAllLogs() {
        logsRepository.deleteAll();
    }
}
