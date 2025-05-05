<%--
  Created by IntelliJ IDEA.
  User: 黑羽快斗
  Date: 2024/7/7
  Time: 18:38
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
</head>
<body>
<div id="box">
    <template>
        <el-table
                :data="list"
                style="width: 100%">
            <el-table-column
                    prop="cno"
                    label="快递单号"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="putter"
                    label="寄件人"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="fromd"
                    label="发货地址"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="tod"
                    label="收货地址"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="putdate"
                    label="发货日期"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="getdate"
                    label="到货日期"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="state"
                    label="状态"
                    width="180">
            </el-table-column>
        </el-table>
    </template>
</div>
<script>
    new Vue({
        el: "#box",
        data: {
            list:[],
        },
        methods: {
            selectAllType: function () {
                //this指向的当前变量，
                //axios请求时会处理大量的数据，
                //当请求处理完数据后，预加载函数已经执行完了
                var that = this;//this执向定义了全局变量
                axios.get("courierselold?getter=" + "${name}").then(function (res) {
                    if (res.data.status) {
                        that.list = res.data.list;
                    } else {
                        that.$message.error(res.data.message)
                    }
                })
            }
        },
        //预加载函数
        mounted: function () {
            this.selectAllType();
        }
    })
</script>
</body>
</html>
