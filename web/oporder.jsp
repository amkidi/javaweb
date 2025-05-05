<%--
  Created by IntelliJ IDEA.
  User: 黑羽快斗
  Date: 2024/7/7
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客房类型管理</title>
    <script src="js/Vue.js"></script><!-- 先引入vue在引入index -->
    <script src="js/index.js"></script>
    <script src="js/axios.js"></script>
    <link rel="stylesheet" href="css/index.css"/>
</head>
<body>
<div id="box">
    <el-table
            :data="typeList"
            style="width: 100%">
        <el-table-column prop="cno" label="订单号">
        </el-table-column>
        <el-table-column prop="putter" label="寄件人">
        </el-table-column>
        <el-table-column prop="getter" label="收货人">
        </el-table-column>
        <el-table-column prop="fromd" label="发货地址">
        </el-table-column>
        <el-table-column prop="tod" label="收货地址">
        </el-table-column>
        <el-table-column
                fixed="right"
                label="操作"
                width="100">
            <template slot-scope="scope">
                <el-button type="text" size="small" @click="edit(scope.row.cno)">审批</el-button>
            </template>
        </el-table-column>
    </el-table>
    <el-dialog title="是否审批通过" :visible.sync="editTypeVis" width="53%">
        <span slot="footer" class="dialog-footer">
          <el-button @click="editTypeVis = false">取 消</el-button>
          <el-button type="primary" @click="editType">确 定</el-button>
              </span>
    </el-dialog>
</div>
<script>
    new Vue({
        el: "#box",
        data: {
            typeList: [//对象类型的数组
            ],
            delTypeVis: false,//删除提示框默认关闭
            cno: "",
            type:{
                putter:"",
                getter:"",
                fromd:"",
                tod:""
            },
            addTypeVis: false,//控制新增面板的开关
            editTypeVis: false//控制编辑面板的开关

        },
        methods: {
            //查询所有客房类型
            selectAllType: function () {
                var that = this;//相当于把data中的属性，定义为全局变量
                axios.get("ispass").then(function (res) {
                    if (res.data.status) {
                        that.typeList = res.data.list;//对typeList属性进行赋值
                    } else {
                        alert(res.data.message)
                    }
                })
            },
            //编辑按钮
            edit: function (cno) {
                this.editTypeVis = true;
                this.cno = cno;
            },
            //点击编辑面板确定按钮
            editType: function () {
                var cno = this.cno;
                var that = this;
                axios.get("courierpass?cno=" + cno).then(function (res) {
                    console.log(cno);
                    if (res.data.status) {
                        that.editTypeVis = false;
                        that.selectAllType();
                    } else {
                        alert(res.data.message)
                    }
                })
            }

        },
        mounted: function () {
            //预加载：页面启动就开始执行，赋值完毕
            //请求：请求需要处理大量的数据，当请求处理完数据时，预加载函数执行完毕
            this.selectAllType();
        }
    })
</script>
</body>
</html>