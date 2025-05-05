<%--
  Created by IntelliJ IDEA.
  User: 黑羽快斗
  Date: 2024/7/7
  Time: 14:37
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
        <el-table-column prop="getter" label="寄件人">
        </el-table-column>
        <el-table-column prop="putter" label="收件人">
        </el-table-column>
        <el-table-column prop="fromd" label="发货地址">
        </el-table-column>
        <el-table-column prop="tod" label="收货地址">
        </el-table-column>
        <el-table-column prop="state" label="状态">
        </el-table-column>
        <el-table-column
                fixed="right"
                label="操作"
                width="100">
            <template slot-scope="scope">
                <el-button type="text" size="small" @click="edit(scope.row)">编辑</el-button>
                <el-button type="text" size="small" @click="del(scope.row.cno)">删除</el-button>
            </template>
        </el-table-column>
    </el-table>
    <el-dialog title="删除提示框" :visible.sync="delTypeVis" width="30%">
        <span>确定删除吗？</span>
        <span slot="footer" class="dialog-footer">
          <el-button @click="delTypeVis = false">取 消</el-button>
          <el-button type="primary" @click="delType">确 定</el-button>
              </span>
    </el-dialog>


    <el-dialog title="编辑提示框" :visible.sync="editTypeVis" width="53%">
        <el-form :model="type" label-width="100px">
            <el-form-item label="寄件人">
                <el-input v-model="type.putter" width="319px"></el-input>
            </el-form-item>
            <el-form-item label="收件人">
                <el-input v-model="type.getter" width="319px"></el-input>
            </el-form-item>
            <el-form-item label="发货地址">
                <el-input v-model="type.fromd" width="319px"></el-input>
            </el-form-item>
            <el-form-item label="收货地址">
                <el-input v-model="type.tod" width="319px"></el-input>
            </el-form-item>
            <el-form-item label="状态">
                <el-input v-model="type.state" width="319px"></el-input>
            </el-form-item>
        </el-form>
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
            type: {
                putter:"",
                getter:"",
                fromd:"",
                tod:"",
                state:""
            },
            addTypeVis: false,//控制新增面板的开关
            editTypeVis: false//控制编辑面板的开关
        },
        methods: {
            //查询所有客房类型
            selectAllType: function () {
                var that = this;//相当于把data中的属性，定义为全局变量
                axios.get("courierselall").then(function (res) {
                    if (res.data.status) {
                        that.typeList = res.data.list;//对typeList属性进行赋值
                    } else {
                        alert(res.data.message)
                    }
                })
            },

            //点击删除按钮
            del: function (cno) {
                this.delTypeVis = true;
                this.cno = cno;
            },
            //点击对话框中的确定按钮
            delType: function () {
                var cno = this.cno;
                var that = this;
                axios.get("courierdel?cno=" + cno).then(function (res) {
                    if (res.data.status) {
                        that.delTypeVis = false;
                        that.selectAllType();
                    } else {
                        alert(res.data.message)
                    }
                })
            },
            //编辑按钮
            edit: function (type) {
                this.type = type;
                this.editTypeVis = true;
                this.cno = cno;
            },
            //点击编辑面板确定按钮
            editType: function () {
                var cno = this.type.cno;
                var putter = this.type.putter;
                var getter = this.type.getter;
                var fromd = this.type.fromd;
                var tod = this.type.tod;
                var state = this.type.state;
                var that = this;
                axios.get("courierup?putter=" + putter + "&getter=" + getter + "&fromd=" + fromd + "&tod=" + tod + "&state=" + state + "&cno=" + cno).then(function (res) {
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
