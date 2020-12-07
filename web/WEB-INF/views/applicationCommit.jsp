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
    <link rel="stylesheet" href="${PATH}/static/layui/dist/css/layui.css">
    <link rel="stylesheet" href="${PATH}/static/layer/mobile/need/layer.css">


    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- daterange picker -->
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/daterangepicker/daterangepicker.css">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
    <!-- Tempusdominus Bbootstrap 4 -->
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
    <!-- Bootstrap4 Duallistbox -->
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
    <link rel="stylesheet" href="${PATH}/static/layer/theme/default/layer.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <!-- 主题样式 -->
    <link rel="stylesheet" href="${PATH}/static/adminlte/dist/css/adminlte.min.css">
    <link rel="stylesheet" href="${PATH}/static/layui/dist/css/layui.css">

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
                    <label class="layui-form-label"></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <div class="col-sm-6">
                        <h1>填写申请理由</h1>
                    </div>

                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- 主体内容 -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <!-- left column -->
                    <div class="col-md-12">
                        <!-- 竖排表单 -->
                    </div>
                    <!--/.col (left) -->
                </div>
                <!-- /.row -->



                <form id="applicationForm" class="layui-form">
                       <div class="layui-form-item layui-form-text">
                           <label class="layui-form-label"></label>
                           <div class="layui-input-block">
                               <textarea  name="applicationReason" rows="20" placeholder="在此处填写申请理由" class="layui-textarea"></textarea>
                           </div>
                       </div>
                </form>
                <div class="layui-form-item">
                    <label class="layui-form-label"></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button class="layui-btn" type="button" id="applicationCommit">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
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
<script src="${PATH}/static/layui/dist/layui.js"></script>
<script src="${PATH}/static/layer/layer.js"></script>
<script src="${PATH}/static/adminlte/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${PATH}/static/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables -->
<script src="${PATH}/static/adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${PATH}/static/adminlte/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="${PATH}/static/adminlte/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="${PATH}/static/adminlte/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<!-- AdminLTE App -->
<script src="${PATH}/static/adminlte/dist/js/adminlte.min.js"></script>
<!-- 用于演示 AdminLTE  -->
<script src="${PATH}/static/adminlte/dist/js/demo.js"></script>




<script src="${PATH}/static/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Select2 -->
<script src="${PATH}/static/adminlte/plugins/select2/js/select2.full.min.js"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="${PATH}/static/adminlte/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
<!-- InputMask -->
<script src="${PATH}/static/adminlte/plugins/moment/moment.min.js"></script><script src="${PATH}/static/adminlte/plugins/moment/locale/zh-cn.js"></script>
<script src="${PATH}/static/adminlte/plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
<!-- date-range-picker -->
<script src="${PATH}/static/adminlte/plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap color picker -->
<script src="${PATH}/static/adminlte/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="${PATH}/static/adminlte/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Bootstrap 开关 -->
<script src="${PATH}/static/adminlte/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<script src="${PATH}/static/layui/dist/layui.js"></script>
<script src="${PATH}/static/layer/layer.js"></script>




</body>
</html>
<script>
    $(document).ready(function () {
        $('.textarea').summernote({lang: 'zh-CN'})
        bsCustomFileInput.init();
    });

    $(function () {
        $("#applicationCommit").click(function () {
            $.ajax({
                type:"post",
                url:"${PATH}/application/insert",
                data:$("#applicationForm").serialize(),
                dataType:"json",
                success:function (res) {
                    console.info(res)
                   if(res.code === 500){
                       layer.msg(res.data,{icon:4,time:1500},function () {
                           return false;
                       })
                   }else {
                       if(res.data){
                           layer.msg("您在本批次已经提交过一次申请,情勿重复提交",{icon:4,time:1500},function () {
                               return false;
                           })
                       }else {
                           layer.msg("申请成功!",{icon:4,time:1500},function () {
                               window.location = "${PATH}/application/listBySn";
                           })

                       }
                   }
                }
            })
        })
    })
</script>
