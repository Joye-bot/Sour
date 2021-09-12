package com.sour.service;

import com.sour.model.domain.Logs;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 日志业务层
 *
 * @author nndmw
 * @date 2021/09/06
 */
public interface LogsService {

    /**
     * 保存日志
     *
     * @param logs 日志
     * @return {@link Logs}
     */
    Logs saveByLogs(Logs logs);

    /**
     * 查询最新的五条日志
     *
     * @return {@link List}<{@link Logs}>
     */
    List<Logs> findLogsLatest();

    /**
     * 查询所有日志并分页
     *
     * @param pageable 可分页
     * @return {@link Page}<{@link Logs}>
     */
    Page<Logs> findAllLogs(Pageable pageable);

    /**
     * 删除所有日志
     */
    void removeAllLogs();
}
