
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 3 | 登录</title>
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
    <link href="${PATH}/static/adminlte/dist/css/google.css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="${PATH}/static/adminlte/index2.html"><b>同学你好&nbsp;</b>欢迎登录</a>
    </div>
    <!-- /.login-logo -->
    <div class="card">
        <div class="card-body login-card-body">
            <p class="login-box-msg">帐户登录</p>

            <form action="${PATH}/user/login" method="get">
                <span style="color: red;font-size: 13px" id="loginMsg">${msg}</span>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" name="sn" id="sn" aria-describedby="inputSuccess2Status" placeholder="学号/工号"/>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas  fa-user-md"></span>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" name="name" id="name" aria-describedby="inputSuccess2Status" placeholder="学生姓名"/>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas  fa-user-md"></span>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <input type="password" class="form-control" name="password" id="password" placeholder="密码">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-8">
                        <div class="icheck-primary">
                            <input type="checkbox" id="remember">
                            <label for="remember">
                                记住密码
                            </label>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-4">
                        <button type="submit" class="btn btn-primary btn-block" id="login">登录</button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>

            <div class="social-auth-links text-center mb-3">
                <p>- 或 -</p>
                <a href="#" class="btn btn-block btn-primary">
                    <i class="fab fa-qq mr-2"></i> 通过 QQ 登录
                </a>
                <a href="#" class="btn btn-block btn-danger">
                    <i class="fab fa-weixin mr-2"></i> 通过 WeChat 登录
                </a>
            </div>
            <!-- /.social-auth-links -->

            <p class="mb-1">
                <a href="${PATH}/user/toRetrievePassword">忘记密码?</a>
            </p>
            <p class="mb-0">
                <a href="${PATH}/user/toRegist" class="text-center">注册新账号</a>
            </p>
        </div>
        <!-- /.login-card-body -->
    </div>
</div>
<!-- /.login-box -->

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
        $("#remember").click(function () {
            $("#sn").val(${loginUser.sn})
            $("#name").val(${loginUser.name})
            $("#password").val(${loginUser.password})
        })
    })
</script>

