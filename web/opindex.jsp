<%--
  Created by IntelliJ IDEA.
  User: 黑羽快斗
  Date: 2024/7/7
  Time: 8:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>主页</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/camroll_slider.css" />
    <link href="css/video-js.min.css" rel="stylesheet">
<%--    <script src="js/video.min.js"></script>--%>
<%--    <script src="js/vue.global.prod.js" type="text/javascript" charset="utf-8"></script>--%>
    <script src="js/Vue.js"></script>
    <script src="js/index.js"></script>
<%--    <script src="./js/jquery-1.11.0.min.js" type="text/javascript"></script>--%>
    <script src="js/index.js"></script>
    <script src="./js/camroll_slider.min.js"></script>

    <style>
        /*取消内外边距*/
        * {
            margin: 0px;
            padding: 0px;

        }
        .el-header {
            background-color: #B3C0D1;
            color: #333;
            text-align: center;
            line-height: 60px;
        }
        .el-aside {
            background-color: #D3DCE6;
            color: #333;
            text-align: center;
            line-height: 200px;
        }
        .el-main {
            background-color: #E9EEF3;
            color: #333;
            text-align: center;
            line-height: 160px;
        }
        body > .el-container {
            margin-bottom: 40px;
        }
        html, #box, body .el-container, .el-menu {
            height: 100%;
        }
        a {
            text-decoration: none;
            color: white;
        }
        .logo {
            float: left;

        }
        .logout {
            float: right;
        }
    </style>
</head>
<body >
<div id="box" >
    <el-container>
        <el-header>
            <h2 class="logo">快递查询后台管理系统</h2>
            <div class="logout">
                <span>欢迎：${name} </span>
                <a href="logOutServlet">注销</a>
            </div>
        </el-header>
        <el-container>
            <el-aside width="200px">
                <el-menu
                        default-active="1"
                        class="el-menu-vertical-demo"
                        background-color="#545c64"
                        text-color="#fff"
                        active-text-color="#ffd04b"
                        @select="handleSelect">
                    <el-menu-item index="1">
                        <i class="el-icon-setting"></i>
                        <span slot="title">用户管理</span>
                    </el-menu-item>
                    <el-menu-item index="2">
                        <i class="el-icon-loading"></i>
                        <span slot="title">快递信息管理</span>
                    </el-menu-item>
                    <el-menu-item index="3">
                        <i class="el-icon-check"></i>
                        <span slot="title">快递审批</span>
                    </el-menu-item>
                </el-menu>
            </el-aside>
            <el-main>
                <iframe id="page-iframe" width="95%" height="650px" frameborder="0"></iframe>
            </el-main>
        </el-container>
    </el-container>
</div>
<script>
    new Vue({
        el: "#box",
        data: {},
        methods: {
            handleSelect(index) {
                if (index === "1") {
                    // 当点击首页菜单项时，设置 iframe 加载 type.jsp 页面
                    document.getElementById('page-iframe').src = 'opuser.jsp';
                } else if(index === "2"){
                    document.getElementById('page-iframe').src = 'opcourier.jsp';
                }else if(index == "3"){
                    document.getElementById('page-iframe').src = 'oporder.jsp';
                }
            }
        },
        mounted() {
            // 在页面加载后，默认显示首页内容
            this.handleSelect('1');
        }
    })
</script>
</body>
</html>
