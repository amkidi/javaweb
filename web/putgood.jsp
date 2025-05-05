<%--
  Created by IntelliJ IDEA.
  User: 黑羽快斗
  Date: 2024/7/7
  Time: 18:26
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
<body>
<div id="app">
    <main >
        <el-tabs v-model="activeName" @tab-click="handleClick" style="width:40%;margin:auto;margin-top: 100px;margin-left: 20%">
            <el-tab-pane label="" name="first">

            </el-tab-pane>
            <el-tab-pane label="寄件" name="second">
                <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px"
                         class="demo-ruleForm">
                    <el-form-item label="收件人" prop="getter">
                        <el-input v-model.number="ruleForm.getter"></el-input>
                    </el-form-item>
                    <el-form-item label="寄件地址" prop="fromd">
                        <el-input type="text" v-model="ruleForm.fromd" autocomplete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="收货地址" prop="tod">
                        <el-input type="text" v-model="ruleForm.tod" autocomplete="off"></el-input>
                    </el-form-item>

                    <el-form-item>
                        <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
                        <el-button @click="resetForm('ruleForm')">重置</el-button>
                    </el-form-item>
                </el-form>
            </el-tab-pane>
        </el-tabs>
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
            return {
                activeName: 'second',
                ruleForm: {
                    getter: '',
                    fromd:'',
                    tod: ''
                },
                rules: {
                    pass: [{
                        validator: validatePass,
                        trigger: 'blur'
                    }],
                    checkPass: [{
                        validator: validatePass,
                        trigger: 'blur'
                    }],
                    age: [{
                        validator: checkAge,
                        trigger: 'blur'
                    }],

                },
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
                        var getter = this.ruleForm.getter;
                        var fromd = this.ruleForm.fromd;
                        var tod = this.ruleForm.tod;

                        // get代表用明文请求，post密文请求  。then后端返回的结果
                        // axios.get(路径和参数).then(function(res){})
                        //回调函数：res是后端返回的结果
                        axios.get("courieradd?getter=" + getter +"&putter="+"${name}"+"&fromd="+fromd+ "&tod=" + tod).then(function(res) {
                            if (res.data.status) {
                                //   成功后跳转到主页
                                alert("寄件成功！")
                            } else {
                                alert(res.data.message)
                            }
                        })
                    } else {
                        alert("请按照规则填写订单信息")
                    }
                });
            },
            resetForm(formName) {
                this.$refs[formName].resetFields();
            },
        },

        mounted() {

        }
    })
</script>
</html>
