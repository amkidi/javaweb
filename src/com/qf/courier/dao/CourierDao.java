package com.qf.courier.dao;

import com.qf.courier.pojo.Courier;
import com.qf.courier.util.JdbcBase;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public class CourierDao {
    //查询所有快递
    public List<Courier> selectAllCourie() throws SQLException {
        String sql = "select * from courier where state != '待审批'";
        Object[] obj = {};
        List<Courier> list = new ArrayList<>();
        ResultSet rs = JdbcBase.querySql(sql,obj);
        while (rs.next()){
            Courier courier = new Courier();
            courier.setCno(rs.getString("cno"));
            courier.setGetter(rs.getString("getter"));
            courier.setPutter(rs.getString("putter"));
            courier.setPutdate(rs.getDate("putdate"));
            courier.setGetdate(rs.getDate("getdate"));
            courier.setGetcode(rs.getString("getcode"));
            courier.setFromd(rs.getString("fromd"));
            courier.setTod(rs.getString("tod"));
            courier.setState(rs.getString("state"));
            list.add(courier);
        }
        JdbcBase.close();
        return list;
    }
//    查询个人历史快递
public List<Courier> seloutCourier(String getter) throws SQLException {
    String sql = "select * from courier where getter = ? and state = '已取' and state != '待审批'";
    Object[] obj = {getter};
    List<Courier> list = new ArrayList<>();
    ResultSet rs = JdbcBase.querySql(sql,obj);
    while (rs.next()){
        Courier courier = new Courier();
        courier.setCno(rs.getString("cno"));
        courier.setGetter(rs.getString("getter"));
        courier.setPutter(rs.getString("putter"));
        courier.setPutdate(rs.getDate("putdate"));
        courier.setGetdate(rs.getDate("getdate"));
        courier.setGetcode(rs.getString("getcode"));
        courier.setFromd(rs.getString("fromd"));
        courier.setTod(rs.getString("tod"));
        courier.setState(rs.getString("state"));
        list.add(courier);
    }
    JdbcBase.close();
    return list;
}
//    查询个人快递
public List<Courier> selnewCourier(String getter) throws SQLException {
    String sql = "select * from courier where getter = ? and state != '已取' and state != '待审批'";
    Object[] obj = {getter};
    List<Courier> list = new ArrayList<>();
    ResultSet rs = JdbcBase.querySql(sql,obj);
    while (rs.next()){
        Courier courier = new Courier();
        courier.setCno(rs.getString("cno"));
        courier.setGetter(rs.getString("getter"));
        courier.setPutter(rs.getString("putter"));
        courier.setPutdate(rs.getDate("putdate"));
        courier.setGetdate(rs.getDate("getdate"));
        courier.setGetcode(rs.getString("getcode"));
        courier.setFromd(rs.getString("fromd"));
        courier.setTod(rs.getString("tod"));
        courier.setState(rs.getString("state"));
        list.add(courier);
    }
    JdbcBase.close();
    return list;
}

//  寄快递（添加数据）
    public int addCourier(String cno,String getter, String putter, Date putdate, String fromd,String tod,String state){
        String sql = "insert into courier(cno,getter,putter,putdate,fromd,tod,state) value(?,?,?,?,?,?,?)";
        Object[] obj = {cno,getter,putter,putdate,fromd,tod,state};
        int num = JdbcBase.updataSql(sql, obj);
        JdbcBase.close();
        return num;
    }

//删除订单
    public int delCourier(String cno){
        String sql = "delete from courier where cno = ?";
        Object[] obj = {cno};
        //调用增加改方法
        int num = JdbcBase.updataSql(sql, obj);
        JdbcBase.close();
        return num;
    }

//    修改
public int upCourier(String cno, String putter, String getter, String fromd, String tod, String state){
    String sql = "update courier set putter = ?, getter = ?, fromd = ?, tod = ? where cno = ?";
    Object[] obj = {putter,getter,fromd,tod,cno};
    int num = JdbcBase.updataSql(sql, obj);
    return num;
}

//    查询需要审批的订单
    public List<Courier> ispassCourier() throws SQLException {
        String sql = "select * from courier where state = '待审批'";
        Object[] obj = {};
        List<Courier> list = new ArrayList<>();
        ResultSet rs = JdbcBase.querySql(sql,obj);
        while (rs.next()){
            Courier courier = new Courier();
            courier.setCno(rs.getString("cno"));
            courier.setGetter(rs.getString("getter"));
            courier.setPutter(rs.getString("putter"));
            courier.setPutdate(rs.getDate("putdate"));
            courier.setGetdate(rs.getDate("getdate"));
            courier.setGetcode(rs.getString("getcode"));
            courier.setFromd(rs.getString("fromd"));
            courier.setTod(rs.getString("tod"));
            courier.setState(rs.getString("state"));
            list.add(courier);
        }
        JdbcBase.close();
        return list;
    }
//    通过订单
    public int passCourier(String cno, String state){
        String sql = "update courier set state = ? where cno = ?";
        Object[] obj = {state,cno};
        int num = JdbcBase.updataSql(sql, obj);
        return num;
    }
}
