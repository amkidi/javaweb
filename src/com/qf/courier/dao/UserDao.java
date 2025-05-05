package com.qf.courier.dao;

import com.qf.courier.pojo.User;
import com.qf.courier.util.JdbcBase;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserDao {
    public User login(String username, String password){
        String sql = "select * from user where username = ? and password = ?";
        Object[] obj = {username, password};
        User user = null;
        ResultSet rs = JdbcBase.querySql(sql,obj);
        try {
            if(rs.next()){
                user = new User(rs.getString("name"), rs.getString("phone"),rs.getInt("type"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        JdbcBase.close();
        return user;
    }

    public User join(String username){
        String sql = "select * from user where username = ?";
        Object[] obj = {username};
        User user = null;
        ResultSet rs = JdbcBase.querySql(sql,obj);
        try {
            if(rs.next()){
                user = new User(rs.getString("name"), rs.getString("phone"), rs.getInt("type"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        JdbcBase.close();
        return user;
    }

    //增加用户
    public int addUser(String username, String password, String name, String phone, int type, Date createdate) {
        String sql = "insert into user(username, password, name, phone, type, createdate) value(?,?,?,?,?,?)";
        Object[] obj = {username, password, name, phone, type, createdate};
        int num = JdbcBase.updataSql(sql, obj);
        JdbcBase.close();
        return num;
    }

    //删除用户
    public int delUser(String username){
        String sql = "delete from user where username = ?";
        Object[] obj = {username};
        //调用增加改方法
        int num = JdbcBase.updataSql(sql, obj);
        JdbcBase.close();
        return num;
    }

//    修改用户
    public int upUser(String username, String password, String name, String phone,Date createdate){
        String sql = "update user set password = ?, name = ?, phone = ?, createdate = ? where username = ?";
        Object[] obj = {password,name,phone,createdate,username};
        int num = JdbcBase.updataSql(sql, obj);
        return num;
    }
//    查询用户
    public List<User> selUser() throws SQLException {
        String sql = "select * from user where type = 0";
        Object[] obj = {};
        ResultSet rs = JdbcBase.querySql(sql,obj);
        List<User> list = new ArrayList<>();
        while(rs.next()){
            User user = new User();
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            user.setName(rs.getString("name"));
            user.setPhone(rs.getString("phone"));
            user.setCreatedate(rs.getDate("createdate"));
            list.add(user);
        }
        JdbcBase.close();
        return list;
    }
}
