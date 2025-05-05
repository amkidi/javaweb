<%--
  Created by IntelliJ IDEA.
  User: 黑羽快斗
  Date: 2024/7/7
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="js/Vue.js"></script>
    <script src="js/index.js"></script>
    <script src="js/axios.js"></script>
    <link rel="stylesheet" href="css/index.css">
    <style>
        *{
            margin: 0px;
            padding: 0px;
        }
        /*选中所有的标签设置高度为100%*/
        html,body,#box,.el-container,.el-menu{
            height: 100%;
        }
        .el-header{
            background-color: white;
            color: #333;
            text-align: center;
            line-height: 60px;

        }

        .el-main {
            background-color: #E9EEF3;
            color: #333;
            text-align: center;
            line-height: 160px;
        }

        .logo{
            float: left;
            margin-left: 20px;
        }
        .zhuxiao{
            margin-top: 10px;
            height: 40px;
            float: right;
        }
        a{
            text-decoration: none;
            color: white;
        }
        .logout{
            float: right;
        }
        .out{
            color: black;
        }
    </style>
</head>
<body>
    <div id="box" >
        <el-container>
            <el-header>
                <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
                    <span class="logo" style="font-size: 30px; letter-spacing: 10px; color: #000000;opacity: 0.65;">快递信息管理系统</span>
                    <el-menu-item index="1" style="margin-left: 250px;font-size: 20px">首页</el-menu-item>
                    <el-menu-item index="2" style="font-size:20px;">寄包裹</el-menu-item>
                    <el-submenu index="3" >
                        <template slot="title" style="size:20px">个人中心</template>
                        <el-menu-item index="3-1">取包裹</el-menu-item>
                        <el-menu-item index="3-2">历史包裹</el-menu-item>
                        </el-submenu>
                    </el-submenu>
                    <div class="logout">
                        <spen style="margin-right: 20px">欢迎：${name}</spen>
                        <a href="logOutServlet" class="out">注销</a>
                    </div>

                </el-menu>
            </el-header>
            <el-main style="background-image: url('/img/5.jpg');background-size: cover;background-position: center;background-repeat: no-repeat;background-attachment: fixed;">
                <iframe id="page-iframe" width="95%" height="650px" frameborder="0" style="opacity: 0.75;background: white"></iframe>
            </el-main>
        </el-container>
    </div>
    <script>
        new Vue({
            el: "#box",
            data: {},
            methods: {
                handleSelect(index) {
                    if (index === "1") {
                        document.getElementById('page-iframe').style.opacity = 0;
                    } else if(index === "2"){
                        document.getElementById('page-iframe').src = 'putgood.jsp';
                        document.getElementById('page-iframe').style.opacity = 0.9;
                    }else if(index == "3-1"){
                        document.getElementById('page-iframe').src = 'newcourier.jsp';
                        document.getElementById('page-iframe').style.opacity = 0.9;
                    }else if(index == "3-2"){
                        document.getElementById('page-iframe').src = 'oldcourier.jsp';
                        document.getElementById('page-iframe').style.opacity = 0.9;
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
