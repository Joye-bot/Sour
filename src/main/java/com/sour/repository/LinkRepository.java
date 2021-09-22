package com.sour.repository;

import com.sour.model.domain.Link;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 友情链接持久层
 *
 * @author nndmw
 * @date 2021/09/22
 */
public interface LinkRepository extends JpaRepository<Link, Long> {
}
