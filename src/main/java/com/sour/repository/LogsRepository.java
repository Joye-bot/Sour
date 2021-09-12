package com.sour.repository;

import com.sour.model.domain.Logs;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * 日志持久层
 *
 * @author nndmw
 * @date 2021/09/06
 */
public interface LogsRepository extends JpaRepository<Logs, Long> {

    /**
     * 查询最新的五条数据
     *
     * @return {@link List}<{@link Logs}>
     */
    @Query(value = "SELECT * FROM sour_logs ORDER BY log_id DESC LIMIT 5;", nativeQuery = true)
    List<Logs> findTopFive();
}
