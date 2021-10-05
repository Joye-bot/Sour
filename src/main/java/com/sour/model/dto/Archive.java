package com.sour.model.dto;

import com.sour.model.domain.Post;
import lombok.Data;

import java.util.List;

/**
 * 存档
 *
 * @author nndmw
 * @date 2021/10/01
 */
@Data
public class Archive {

    /**
     * 年份
     */
    private String year;

    /**
     * 月份
     */
    private String month;

    /**
     * 对应的文章数
     */
    private String count;

    /**
     * 对应的文章
     */
    private List<Post> posts;

}
