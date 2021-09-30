package com.sour.model.domain;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

/**
 * 日志实体类
 *
 * @author nndmw
 * @date 2021/09/04
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
@RequiredArgsConstructor
@Entity
@Table(name = "sour_logs")
public class Logs implements Serializable {

    private static final long serialVersionUID = -4599460611681975526L;

    /**
     * 日志编号
     */
    @Id
    @GeneratedValue
    private Long logId;

    /**
     * 日志标题
     */
    @NonNull
    private String logTitle;

    /**
     * 日志内容
     */
    @NonNull
    private String logContent;

    /**
     * 产生日志的ip
     */
    @NonNull
    private String logIp;

    /**
     * 产生日志的时间
     */
    @NonNull
    private Date logCreated;

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Logs logs = (Logs) o;
        return Objects.equals(logId, logs.logId) &&
                logTitle.equals(logs.logTitle) &&
                logContent.equals(logs.logContent) &&
                logIp.equals(logs.logIp) &&
                logCreated.equals(logs.logCreated);
    }

    @Override
    public int hashCode() {
        return Objects.hash(logId, logTitle, logContent, logIp, logCreated);
    }
}
