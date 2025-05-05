package com.qf.courier.service;

import com.qf.courier.dao.CourierDao;
import com.qf.courier.pojo.Courier;
import com.qf.courier.util.JdbcBase;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public class CourierService {
    CourierDao courierDao = new CourierDao();
    public int addCourier(String getter, String putter, String fromd,String tod){
        String cno = UUID.randomUUID().toString();
        java.util.Date date = new java.util.Date();
        Date putdate = new Date(date.getTime());
        int num = courierDao.addCourier(cno,getter,putter,putdate,fromd,tod,"待审批");
        if (num == 0) {
            throw new RuntimeException("邮寄失败失败，请联系管理员");
        }
        return num;
    }
//    查询所有快递
    public List<Courier> selectAllCourie() throws SQLException{
        return courierDao.selectAllCourie();
    }

//    查询历史订单
    public List<Courier> seloldCourier(String getter) throws SQLException {
        return courierDao.seloutCourier(getter);
    }
    //    查询现有订单
    public List<Courier> selnewCourier(String getter) throws SQLException {
        return courierDao.selnewCourier(getter);
    }

//    删除订单
    public int delCourier(String cno){
        int num = courierDao.delCourier(cno);
        if (num == 0) {
            throw new RuntimeException("删除类型失败，联系管理员");
        }
        return num;
    }

//    修改订单
    public int upCourier(String cno, String putter, String getter, String fromd, String tod, String state){
        int num = courierDao.upCourier(cno, putter, getter, fromd, tod, state);
        if (num == 0) {
            throw new RuntimeException("修改失败，请联系管理员");
        }
        return num;
    }

//    需要审批的订单
    public List<Courier> ispassCourier() throws SQLException {
        return courierDao.ispassCourier();
    }
//    通过订单
    public int passCourier(String cno){
        String state = "运输中";
        int num = courierDao.passCourier(cno,state);
        if (num == 0) {
            throw new RuntimeException("修改失败，请联系管理员");
        }
        return num;
    }
}
