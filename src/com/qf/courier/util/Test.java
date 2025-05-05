package com.qf.courier.util;

import com.qf.courier.dao.UserDao;
import com.qf.courier.pojo.Courier;
import com.qf.courier.pojo.User;
import com.qf.courier.service.CourierService;
import com.qf.courier.service.UserService;

import java.sql.SQLException;
import java.util.List;

public class Test {
    public static void main(String[] args) throws SQLException {
        UserService userService = new UserService();
        CourierService courierService = new CourierService();
        UserDao userDao = new UserDao();
        int num = userDao.delUser("1");
        System.out.println(num);
//        int num = courierService.passCourier("1234");
//        System.out.println(num);
//        courierService.upCourier("153241","chike","kid","福建","大连大学","运输中");
//        List<Courier> list = courierService.selectAllCourie();
//        for (Courier courier : list) {
//            System.out.println(courier.toString());
//        }
//        userService.upUser("zs","123","sb","98765432100");
//        List<User> list = userService.selUser();
//        for (User user : list) {
//            System.out.println(user.toString());
//        }
    }
}
