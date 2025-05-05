package com.qf.courier.filter;

import com.qf.courier.pojo.User;
import com.qf.courier.pojo.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

//只要你访问此地址，就要走过滤器去拦截请求
@WebFilter(urlPatterns = {"/index.jsp", "/opindex.jsp"})

public class IndexFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("初始化");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
//        每次打开一个浏览器，浏览器就会自动JSESSIONID、（key-value（你登录的信息））
//        服务器会接受JSESSIONID的key，利用这个key去生成session(缓存)
//        此时如果你关闭当前的浏览器，打开新的浏览器，name新浏览器就会生成新的JSESSIONID，利用JSESSIONID的key去生成缓存
//        1、将请求与响应对象转换成带有HTTP协议的对象
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
//        获取session对象
        HttpSession session = req.getSession();
//        从session对象中获取用户登录信息
        User user = (User) session.getAttribute("user");
        if (user == null) {//用户没登陆过

//            请求转发:可以在页面之间进行传值

//            重定向：不涉及任何页面之间的传至，直接跳转。

            resp.sendRedirect("login.jsp");//请求重定向
        } else {//用户登录过
//            放开过滤器,让用户访问到目标地址
            filterChain.doFilter(req, resp);
        }
    }

    @Override
    public void destroy() {
        System.out.println("销毁方法");
    }
}
