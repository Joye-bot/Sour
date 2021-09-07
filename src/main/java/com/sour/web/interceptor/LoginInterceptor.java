package com.sour.web.interceptor;

import com.sour.model.dto.SourConst;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录拦截器
 *
 * @author nndmw
 * @date 2021/09/05
 */
@Component
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        final Object obj = request.getSession().getAttribute(SourConst.USER_SESSION_KEY);
        // 如果user不为空则执行
        if (obj != null) {
            return true;
        }
        // 否则拦截并跳转
        response.sendRedirect("/admin/login");
        return false;

    }
}
