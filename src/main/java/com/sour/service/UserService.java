package com.sour.service;

import com.sour.model.domain.User;

import java.util.Date;
import java.util.List;

/**
 * 用户业务层
 *
 * @author nndmw
 * @date 2021/09/05
 */
public interface UserService {

    /**
     * 查询所有用户
     *
     * @return {@link User}
     */
    User findUser();

    /**
     * 根据用户名和密码查询，用于登录
     *
     * @param userName userName
     * @param userPass userPass
     * @return {@link List}<{@link User}>
     */
    List<User> userLoginByName(String userName, String userPass);

    /**
     * 根据邮箱和密码查询，用于登录
     *
     * @param userEmail userEmail
     * @param userPass  userPass
     * @return {@link List}<{@link User}>
     */
    List<User> userLoginByEmail(String userEmail, String userPass);


    /**
     * 修改用户的状态为正常
     *
     * @return {@link User}
     */
    User updateUserNormal();

    /**
     * 修改最后登录时间
     *
     * @param lastDate lastDate
     * @return {@link User}
     */
    User updateUserLoginLast(Date lastDate);

    /**
     * 修改/增加登录错误次数
     *
     * @return {@link Integer}
     */
    Integer updateUserLoginError();

    /**
     * 修改禁用状态
     *
     * @param enable 启用
     */
    void updateUserLoginEnable(String enable);
}
