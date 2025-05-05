package com.qf.courier.util;

import java.sql.*;

public class JdbcBase {
    static Connection con = null;
    static ResultSet rs = null;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    private static String url = "jdbc:mysql://localhost:3306/dddd?serverTimezone=UTC";
    private static String username = "root";
    private static String pass = "123456";

    //    建立连接
    public static Connection getConnection() {
        try {
            con = DriverManager.getConnection(url, username, pass);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return con;
    }

    //    执行查询的sql语句
    public static ResultSet querySql(String sql, Object[] obj) {

        try {
            con = getConnection();
            PreparedStatement pstm = con.prepareStatement(sql);
//            判断sql语句是否需要参数
            for (int i = 0; i < obj.length; i++) {
                if (obj[i] != null) {
                    pstm.setObject(i + 1, obj[i]);
                }
            }
//            执行sql语句
            rs = pstm.executeQuery();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rs;
    }


    //    执行增删改的方法
    public static int updataSql(String sql, Object[] obj) {
        int num = 0;
        try {
            con = getConnection();
            PreparedStatement pstm = con.prepareStatement(sql);
//            判断sql语句是否需要参数
            for (int i = 0; i < obj.length; i++) {
                if (obj[i] != null) {
                    pstm.setObject(i + 1, obj[i]);
                }
            }
//            执行sql语句
            num = pstm.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    //    关闭流
    public static void close() {
        try {
            rs.close();
            con.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
