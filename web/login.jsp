<%--
  Created by IntelliJ IDEA.
  User: 23804
  Date: 2024/7/5
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
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
    body{
        background: url("./img/2.jpg")  no-repeat center center fixed;
        background-size: cover;

    }

</style>
<body>
<div id="app">
    <header style="text-align: center;font-size: 30px;"><span style="font-size: 70px; letter-spacing: 30px; color: #000000;opacity: 0.65;">快递信息管理系统</span></header>

    <main >
        <div style="height: 490px;width: 400px;border: 2px solid black;position: absolute;top: 200px;left: 1000px;background-color: white;border-radius: 15px;opacity: 0.87;">
            <el-tabs v-model="activeName" @tab-click="handleClick" style="margin:auto;margin-top: 50px;margin-left: 20px;">
                <el-tab-pane label="登入" name="second">
                    <el-form :model="user" :rules="rules" ref="user" label-width="80px">
                        <!-- <el-form-item>一个作用域  prop:-->
                        <!-- prop:绑定的规则名称要与表单双向绑定的变量名一致 -->
                        <el-form-item label="账号" prop="username">
                            <el-input v-model="user.username" style="width: 80%;"></el-input>
                        </el-form-item>
                        <el-form-item label="密码" prop="password">
                            <el-input v-model="user.password" style="width: 80%;"></el-input>
                        </el-form-item>
                        <el-form-item>
                            <!-- user就是字符串对象 -->
                            <el-button @click="login('user')">登录</el-button>
                        </el-form-item>
                    </el-form>
                </el-tab-pane>
                <el-tab-pane label="注册" name="first">
                    <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="80px"
                             class="demo-ruleForm">
                        <el-form-item label="账号" prop="username">
                            <el-input v-model.number="ruleForm.username" style="width: 80%;"></el-input>
                        </el-form-item>
                        <el-form-item label="用户名" prop="account" >
                            <el-input type="text" v-model="ruleForm.account" autocomplete="off" style="width: 80%;"></el-input>
                        </el-form-item>
                        <el-form-item label="手机号" prop="telephone">
                            <el-input type="text" v-model="ruleForm.telephone" autocomplete="off" style="width: 80%;"></el-input>
                        </el-form-item>
                        <el-form-item label="密码" prop="password">
                            <el-input type="password" v-model="ruleForm.password" autocomplete="off" style="width: 80%;"></el-input>
                        </el-form-item>
                        <el-form-item label="确认密码" prop="checkPass">
                            <el-input type="password" v-model="ruleForm.checkPass" autocomplete="off" style="width: 80%;"></el-input>
                        </el-form-item>

                        <el-form-item>
                            <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
                            <el-button @click="resetForm('ruleForm')">重置</el-button>
                        </el-form-item>
                    </el-form>
                </el-tab-pane>
            </el-tabs>
        </div>
    </main>
</div>
</body>
<script>
    new Vue({
        el: "#app",
        data() {
            var checkAge = (rule, value, callback) => {
                if (!value) {
                    return callback(new Error('年龄不能为空'));
                }
                setTimeout(() => {
                    if (!Number.isInteger(value)) {
                        callback(new Error('请输入数字值'));
                    } else {
                        if (value < 18) {
                            callback(new Error('必须年满18岁'));
                        } else {
                            callback();
                        }
                    }
                }, 1000);
            };
            var validateAcc = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入账号'));
                } else {
                    if (this.ruleForm.account !== '') {
                        this.$refs.ruleForm.validateField('account');
                    }
                    callback();
                }
            };
            var validatePass = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入密码'));
                } else {
                    if (this.ruleForm.checkPass !== '') {
                        this.$refs.ruleForm.validateField('checkPass');
                    }
                    callback();
                }
            };
            var validatePass2 = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请再次输入密码'));
                } else if (value !== this.ruleForm.password) {
                    callback(new Error('两次输入密码不一致!'));
                } else {
                    callback();
                }
            };
            return {
                activeName: 'second',
                ruleForm: {
                    username: '',
                    account:'',
                    telephone:'',
                    password: '',
                    checkPass: ''

                },
                rules: {
                    account: [{
                        validator: validateAcc,
                        trigger: 'blur'
                    }],
                    password: [{
                        validator: validatePass,
                        trigger: 'blur'
                    }],
                    checkPass: [{
                        validator: validatePass2,
                        trigger: 'blur'
                    }],
                    age: [{
                        validator: checkAge,
                        trigger: 'blur'
                    }],

                },
                user: {
                    username: "",
                    password: ""
                },
                rules: {
                    username: [{
                        required: true,
                        message: '账号不能为空',
                        trigger: 'blur' //失去焦点，trigger就会被触发从而进行验证
                    },
                        {
                            min: 2,
                            max: 5,
                            message: '长度在 2 到 5 个字符',
                            trigger: 'blur'
                        }
                    ],
                    password: [{
                        required: true,
                        message: '密码不能为空',
                        trigger: 'blur' //失去焦点，trigger就会被触发从而进行验证
                    },
                        {
                            min: 3,
                            max: 10,
                            message: '长度在 3 到 10 个字符',
                            trigger: 'blur'
                        }
                    ]

                }
            };
        },
        methods: {
            handleClick(tab, event) {
                console.log(tab, event);
            },
            submitForm: function(ruleForm) {
                // this.$refs[user] 获取user对象的规则验证
                // valid验证的结果
                this.$refs[ruleForm].validate((valid) => {
                    if (valid) {
                        var username = this.ruleForm.username;
                        var account = this.ruleForm.account;
                        var telephone = this.ruleForm.telephone;
                        var password = this.ruleForm.password;

                        // get代表用明文请求，post密文请求  。then后端返回的结果
                        // axios.get(路径和参数).then(function(res){})
                        //回调函数：res是后端返回的结果
                        axios.get("join?username=" + username +"&name="+account+"&phone="+telephone+ "&password=" + password).then(function(res) {
                            if (res.data.status) {
                                //   成功后跳转到主页
                                alert("注册成功");
                                location.href = "index.jsp"
                            } else {
                                alert("注册失败");
                            }
                        })
                    } else {
                        alert("请按照规则填写账号和密码")
                    }
                });
            },
            resetForm(formName) {
                this.$refs[formName].resetFields();
            },
            login: function(user) {
                // this.$refs[user] 获取user对象的规则验证
                // valid验证的结果
                this.$refs[user].validate((valid) => {
                    if (valid) {
                        var username = this.user.username;
                        var password = this.user.password;
                        // get代表用明文请求，post密文请求  。then后端返回的结果
                        // axios.get(路径和参数).then(function(res){})
                        //回调函数：res是后端返回的结果
                        axios.get("login?username=" + username + "&password=" + password).then(function(res) {
                            if (res.data.status) {
                                //   成功后跳转到主页
                                if(res.data.op){
                                    location.href = "opindex.jsp"
                                }else {
                                    location.href = "index.jsp"
                                }
                            } else {
                                alert(res.data.message)
                            }
                        })
                    } else {
                        alert("请按照规则填写账号和密码")
                    }
                });
            }
        },

        mounted() {

        }
    })
</script>
</html>