<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/16
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 3 | 注册页面</title>
    <!-- 告诉浏览器屏幕自适应 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- 主题样式 -->
    <link rel="stylesheet" href="${PATH}/static/adminlte/dist/css/adminlte.min.css">
    <!-- 离线 Google 字体: Source Sans Pro -->
    <link href="/AdminLTE/AdminLTE-3.x/dist/css/google.css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition register-page">
<div class="register-box">
    <div class="register-logo">
        <a href="${PATH}/static/adminlte/index2.html"><b>同学你好</b>请注册</a>
    </div>

    <div class="card">
        <div class="card-body register-card-body">
            <p class="login-box-msg">注册新账号</p>

            <form id="userInfo">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="学号/工号">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-user"></span>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="姓名">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <input type="password" class="form-control" placeholder="角色标识">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fab fa-folder-open"></span>
                        </div>
                    </div>
                    <span style="color: red;font-size: 12px"><b>注意:</b>"1"表示学生,"2"表示辅导员,"3"表示学院管理员,"4",表示学校管理员,请注意区分,随后管理员会进行审核</span>
                </div>
                <div class="input-group mb-3">
                    <input type="password" class="form-control" placeholder="性别">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas  fa-genderless"></span>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <input type="password" class="form-control" placeholder="密码">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <input type="password" class="form-control" placeholder="再次输入密码">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-8">
                        <div class="icheck-primary">
                            <input type="checkbox" id="agreeTerms" name="terms" value="同意">
                            <label for="agreeTerms">
                                我同意这些<a href="#">条款</a>
                            </label>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-4">
                        <button type="button" class="btn btn-primary btn-block" id="regist">注册</button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>

            <div class="social-auth-links text-center">
                <p>- 或 -</p>
                <a href="#" class="btn btn-block btn-primary">
                    <i class="fab fa-qq mr-2"></i>
                    使用 QQ 注册
                </a>
                <a href="#" class="btn btn-block btn-danger">
                    <i class="fab fa-weixin mr-2"></i>
                    使用 WeChat 注册
                </a>
            </div>

            <a href="${PATH}/WEB-INF/views/login.jsp" class="text-center">我已经有账号了</a>
        </div>
        <!-- /.form-box -->
    </div><!-- /.card -->
</div>
<!-- /.register-box -->

<!-- jQuery -->
<script src="${PATH}/static/adminlte/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${PATH}/static/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${PATH}/static/adminlte/dist/js/adminlte.min.js"></script>
</body>
</html>

<script>
    $(function () {
        $("#regist").click(function () {
            $.ajax({
                type:"get",
                url:"${PATH}/user/regist",
                data:$("#userInfo").serialize(),
                success:function () {
                    layer.msg()
                }
            })
        })
    })
</script>
