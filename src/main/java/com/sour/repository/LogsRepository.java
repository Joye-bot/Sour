package com.sour.repository;

import com.sour.model.domain.Logs;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 日志持久层
 *
 * @author nndmw
 * @date 2021/09/06
 */
public interface LogsRepository extends JpaRepository<Logs, Long> {
}
