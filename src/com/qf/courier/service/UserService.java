package com.qf.courier.service;

import com.qf.courier.dao.UserDao;
import com.qf.courier.pojo.User;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

public class UserService {
    UserDao userDao = new UserDao();
//    登录验证
    public User login(String username, String password) {
//            调用dao层去数据库验证
        User user = userDao.login(username, password);
        if (user == null) {
            throw new RuntimeException("账号或密码输入错误！");
        }
        return user;
    }

//    注册验证
    public User join(String username, String password, String name, String phone){
        User user = userDao.join(username);
        int num = 0;
        if(user != null){
            throw new RuntimeException("该用户名已创建");
        }else{
            java.util.Date date = new java.util.Date();
            Date createdate = new Date(date.getTime());
            num = userDao.addUser(username, password, name, phone, 0, createdate);
        }
        if (num == 0){
            throw new RuntimeException("创建用户失败，请联系管理员");
        }
        return user;
    }

//    删除/注销用户
    public int delUser(String username){
        int num = userDao.delUser(username);
        if (num == 0) {
            throw new RuntimeException("删除用户失败，请联系管理员");
        }
        return num;
    }

//    修改用户
    public int upUser(String username, String password, String name, String phone){
        java.util.Date date = new java.util.Date();
        Date createdate = new Date(date.getTime());
        int num =  userDao.upUser(username,password,name,phone,createdate);
        if(num==0){
            throw new RuntimeException("修改失败失败，请联系管理员");
        }
        return num;
    }
//    查询用户
    public List<User> selUser() throws SQLException {
        return userDao.selUser();
    }
}
