package com.sour.model.domain;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

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
}
