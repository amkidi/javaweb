package com.qf.courier.controller;

import com.alibaba.fastjson.JSON;
import com.qf.courier.pojo.User;
import com.qf.courier.service.UserService;
import com.qf.courier.util.ResultMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/join")
public class UserJoinContorller extends HttpServlet {
    UserService userService = new UserService();
    ResultMap resultMap = new ResultMap();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            String name = req.getParameter("name");
            String phone = req.getParameter("phone");
            User user = userService.join(username, password, name, phone);
            HttpSession session = req.getSession();
            session.setAttribute("user",user);
            session.setAttribute("name",name);
            resultMap.setStatus(true);
        } catch (Exception e) {
            resultMap.setStatus(false);
            resultMap.setMessage(e.getMessage());
        }
//        响应给前端
//        将resultMap对象转成json格式的字符串
        String json = JSON.toJSONString(resultMap);
//        向前端响应
//        设置编码格式
        resp.setCharacterEncoding("utf-8");
//        利用响应对象，将json数据返回给前端
        resp.getWriter().print(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
