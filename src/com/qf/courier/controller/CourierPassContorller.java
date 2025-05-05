package com.qf.courier.controller;

import com.alibaba.fastjson.JSON;
import com.qf.courier.service.CourierService;
import com.qf.courier.util.ResultMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/courierpass")
public class CourierPassContorller extends HttpServlet {
    CourierService courierService = new CourierService();
    ResultMap resultMap = new ResultMap();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String cno = req.getParameter("cno");
            courierService.passCourier(cno);
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
