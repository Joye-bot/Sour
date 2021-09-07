package com.sour.service;

import com.sour.model.domain.Logs;

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
}
