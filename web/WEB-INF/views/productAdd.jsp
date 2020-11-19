<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 3 | 通用表单</title>
    <!-- 告诉浏览器屏幕自适应 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- summernote -->
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/summernote/summernote-bs4.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- 主题样式 -->
    <link rel="stylesheet" href="${PATH}/static/adminlte/dist/css/adminlte.min.css">
    <!-- 离线 Google 字体: Source Sans Pro -->
    <link href="/AdminLTE/AdminLTE-3.x/dist/css/google.css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <jsp:include page="/WEB-INF/common/header.jsp"/>
    <jsp:include page="/WEB-INF/common/sidebar.jsp"/>

    <!-- Content Wrapper. 包含页面内容 -->
    <div class="content-wrapper">
        <!-- 内容标题（页面标题） -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>通用表单</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页</a></li>
                            <li class="breadcrumb-item active">通用表单</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- 主体内容 -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <!-- left column -->
                    <div class="col-md-6">
                        <!-- 竖排表单 -->
                        <div class="card card-info">
                            <div class="card-header">
                                <h3 class="card-title">竖排表单</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form enctype="application/x-www-form-urlencoded" class="form-horizontal" action="${PATH}/product/insert" method="post">
                                <div class="card-body">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">批次</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" id="batch" name="batchId">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label  class="col-sm-2 col-form-label">款式</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="name" class="form-control" placeholder="款式">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label  class="col-sm-2 col-form-label">性别</label>
                                        <div class="col-sm-10">
                                            <div class="form-group clearfix">
                                                <div class="icheck-primary d-inline">
                                                    <input type="radio" id="radioPrimary1" value="M"
                                                           name="gender" checked="">
                                                    <label for="radioPrimary1">男款
                                                    </label>
                                                </div>
                                                <div class="icheck-primary d-inline">
                                                    <input type="radio" id="radioPrimary2" value="F"
                                                           name="gender">
                                                    <label for="radioPrimary2">
                                                        女款
                                                    </label>
                                                </div>
                                                <div class="icheck-primary d-inline">
                                                    <input type="radio" id="radioPrimary3" value="MF"
                                                           name="gender">
                                                    <label for="radioPrimary3">
                                                        男女款
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label  class="col-sm-2 col-form-label">编码</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="productNumber" class="form-control" placeholder="编码">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label  class="col-sm-2 col-form-label">规格</label>
                                        <div class="col-sm-10">
                                            <div id="sku">
                                            </div>
                                            <button type="button" id="addSku" class="btn btn-default">添加</button>
                                        </div>
                                    </div>
                                    <%--<div class="form-group row">--%>
                                        <%--<label  class="col-sm-2 col-form-label">图片</label>--%>
                                        <%--<div class="col-sm-10">--%>
                                            <%--<input type="file" class="form-control">--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">尺码表</label>
                                        <div class="col-sm-10">
                                            <div class="card-body pad">
                                                <div class="mb-3">
                                                    <textarea name="description" class="textarea" placeholder="在这里填写内容"
                                                              style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid rgb(221, 221, 221); padding: 10px; display: none;"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="offset-sm-2 col-sm-10">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="exampleCheck2">
                                                <label class="form-check-label" for="exampleCheck2">记住我</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                                <div class="card-footer">
                                    <button type="submit" class="btn btn-success float-right">保存</button>
                                </div>
                                <!-- /.card-footer -->
                            </form>
                        </div>
                        <!-- /.card -->

                    </div>
                    <!--/.col (left) -->
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <jsp:include page="/WEB-INF/common/footer.jsp"/>
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- 控制侧边栏内容在这里 -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="${PATH}/static/adminlte/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${PATH}/static/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- bs-custom-file-input -->
<script src="${PATH}/static/adminlte/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<!-- AdminLTE App -->
<script src="${PATH}/static/adminlte/dist/js/adminlte.min.js"></script>
<!-- 用于演示 AdminLTE  -->
<script src="${PATH}/static/adminlte/dist/js/demo.js"></script>
<!-- Summernote -->
<script src="${PATH}/static/adminlte/plugins/summernote/summernote-bs4.min.js"></script>
<script src="${PATH}/static/adminlte/plugins/summernote/lang/summernote-zh-CN.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('.textarea').summernote({lang: 'zh-CN'})
        bsCustomFileInput.init();
    });
</script>
</body>
</html>
<script>
    $(function () {
        $("#addSku").click(function () {
            $("#sku").append($("<p><input type='text'> <button type='button' class='deleteSku'>删除</button></p>"))
            $(".deleteSku").click(function () {
                $(this).parent().remove()
            })
        })
        $.ajax({
            type: "get",
            url: "${PATH}/batch/listByAjax",
            dataType: "json",
            success: function (res) {
                $(res.data).each(function (i, index) {
                    $("#batch").append($("<option value='"+index.id+"'>"+index.name+"</option>"))
                })
            }
        })
    })
</script>
