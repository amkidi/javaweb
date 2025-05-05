<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2023/3/6
  Time: 14:32
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
        <el-table-column prop="username" label="账号">
        </el-table-column>
        <el-table-column prop="password" label="密码">
        </el-table-column>
        <el-table-column prop="name" label="用户名">
        </el-table-column>
        <el-table-column prop="phone" label="手机号">
        </el-table-column>
        <el-table-column prop="createdate" label="创建日期">
        </el-table-column>
        <el-table-column
                fixed="right"
                label="操作"
                width="100">
            <%--            scope:这一行所有的数据都存在于scope中--%>
            <template slot-scope="scope">
                <el-button type="text" size="small" @click="edit(scope.row)">编辑</el-button>
                <el-button type="text" size="small" @click="del(scope.row.username)">删除</el-button>
            </template>
        </el-table-column>
    </el-table>


        <%--    delTypeVis:有两个值分别为true（代表打开对话框） false(关闭对话框)--%>
        <el-dialog title="删除提示框" :visible.sync="delTypeVis" width="30%">
            <span>确定删除吗？</span>
            <span slot="footer" class="dialog-footer">
        <el-button @click="delTypeVis = false">取 消</el-button>
        <el-button type="primary" @click="delType">确 定</el-button>
            </span>
        </el-dialog>


        <el-dialog title="编辑提示框" :visible.sync="editTypeVis" width="53%">
            <el-form :model="type" label-width="100px">
                <el-form-item label="密码">
                    <el-input v-model="type.password" width="319px"></el-input>
                </el-form-item>
                <el-form-item label="用户名">
                    <el-input v-model="type.name" width="319px"></el-input>
                </el-form-item>
                <el-form-item label="手机号">
                    <el-input v-model="type.phone" width="319px"></el-input>
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
            username: "",
            type: {
                password:"",
                name:"",
                phone:"",
            },
            addTypeVis: false,//控制新增面板的开关
            editTypeVis: false//控制编辑面板的开关

        },
        methods: {
            //查询所有客房类型
            selectAllType: function () {
                var that = this;//相当于把data中的属性，定义为全局变量
                axios.get("usersel").then(function (res) {
                    if (res.data.status) {
                        that.typeList = res.data.list;//对typeList属性进行赋值
                    } else {
                        alert(res.data.message)
                    }
                })
            },

            //点击删除按钮
            del: function (username) {
                this.delTypeVis = true;
                this.username = username;
            },
            //点击对话框中的确定按钮
            delType: function () {
                var username = this.username;
                var that = this;
                axios.get("userdel?username=" + username).then(function (res) {
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
                this.username = username;
            },
            //点击编辑面板确定按钮
            editType: function () {
                var username = this.type.username;
                var password = this.type.password;
                var name = this.type.name;
                var phone = this.type.phone;

                var that = this;
                axios.get("userup?username=" + username + "&password=" + password + "&name=" + name + "&phone=" + phone).then(function (res) {
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
