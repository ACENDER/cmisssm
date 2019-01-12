package com.inspur.common.interceptor;

import com.inspur.common.util.ConstUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

    private static final Logger log = LoggerFactory.getLogger(LoginInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String requestURI = request.getRequestURI();
        log.debug("LoginInterceptor preHandle requestURI=" + requestURI);

        Object user = request.getSession().getAttribute(ConstUtils.USER_SESSION_KEY);
        if (user != null) {
            //登陆成功的用户
            return true;
        } else {
            //没有登陆，转向登陆界面
            if (requestURI.indexOf("login/userLogin") > 0) {
                return true;
            } else {
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                return false;
            }
        }


//
//        if (requestURI.indexOf("editClientIfo.action") > 0) {
//
//
//            if (user != null) {
//                //登陆成功的用户
//                return true;
//            } else {
//                //没有登陆，转向登陆界面
//                request.getRequestDispatcher("/login.jsp").forward(request, response);
//                return false;
//            }
//        } else {
//            return true;
//        }
//        Object user = request.getSession().getAttribute(ConstUtils.USER_SESSION_KEY);
//        if (user == null) {
//            System.out.println("尚未登录，调到登录页面");
//            response.sendRedirect("/login");
//            return false;
//        }
//
//        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("postHandle");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("afterCompletion");
    }

}