<%--
  Created by IntelliJ IDEA.
  User: 黑羽快斗
  Date: 2024/7/7
  Time: 18:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/camroll_slider.css" />
    <link href="css/video-js.min.css" rel="stylesheet">
    <%--    <script src="js/video.min.js"></script>--%>
    <%--    <script src="js/vue.global.prod.js" type="text/javascript" charset="utf-8"></script>--%>
    <script src="js/Vue.js"></script>
    <script src="js/index.js"></script>
    <%--    <script src="./js/jquery-1.11.0.min.js" type="text/javascript"></script>--%>
    <script src="js/index.js"></script>
    <%--    <script src="./js/camroll_slider.js"></script>--%>
    <script src="./js/axios.js"></script>
</head>
<style>
    .n1{
        margin-top: 40px;
        margin-bottom: 40px;
        font-size: 20px;
    }
    .n2{
        margin-top: -5px;
        margin-bottom: 20px;
        font-size: 30px;
    }
</style>
<body>
<div id="app">
    <div style="font-size: 25px;margin: auto;">历史订单</div>
    <div style="border: 1px solid black;height: fit-content;border-radius: 15px;margin-top: 10px;">
        <ul>
            <li v-for="item in List1" :key="index">{{item.fromd}}+{{item.tod}}+{{item.getter}}+{{item.putter}}+{{item.getdate}}+{{item.putdate}}</li>
        </ul>
    </div>
</div>
</body>
<script>
    new Vue({
        el: "#app",
        data() {
            return {
                activeIndex: '1',
                circleUrl: "https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png",
                sizeList: ["medium"],
                restaurants: [],
                state: '',
                timeout: null,
                List1:[],
                List2:[]
            };
        },
        methods: {
            handleSelect(key, keyPath) {
                console.log(key, keyPath);
            },
            selectAllType: function () {
                var that = this;//相当于把data中的属性，定义为全局变量
                axios.get("usersel").then(function (res) {
                    if (res.data.status) {
                        that.List1 = res.data.list;//对typeList属性进行赋值
                    } else {
                        alert(res.data.message)
                    }
                })
            },


        },
        mounted() {
            this.selectAllType();
        }
    })
</script>
</html>