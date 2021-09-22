package com.sour.repository;

import com.sour.model.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * 用户持久层
 *
 * @author nndmw
 * @date 2021/09/05
 */
public interface UserRepository extends JpaRepository<User, Long> {


    /**
     * 根据用户名和密码查询
     *
     * @param userName 用户名
     * @param userPass 用户密码
     * @return {@link List}<{@link User}>
     */
    List<User> findByUserNameAndUserPass(String userName, String userPass);

    /**
     * 根据用户邮箱和密码查询
     *
     * @param userEmail 用户邮箱
     * @param userPass  用户密码
     * @return {@link List}<{@link User}>
     */
    List<User> findByUserEmailAndUserPass(String userEmail, String userPass);

    /**
     * 根据用户编号和密码查询
     *
     * @param userId   用户编号
     * @param userPass 用户密码
     * @return {@link User}
     */
    User findByUserIdAndUserPass(Long userId, String userPass);
}
