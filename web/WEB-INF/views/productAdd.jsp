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
                        <h1>添加衣服相关信息</h1>
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
                    <div class="col-md-12">
                        <!-- 竖排表单 -->
                      <%--  <div class="card card-info">
                            <div class="card-header">
                                <h3 class="card-title">竖排表单</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form enctype="multipart/form-data" class="form-horizontal" action="${PATH}/product/insert" method="post" >
                                <div class="card-body">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">批次</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" id="batch1" name="batchId1">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label  class="col-sm-2 col-form-label">款式</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="name1" class="form-control" placeholder="款式">
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
                                            <div id="sku1">
                                            </div>
                                            <button type="button" id="addSku1" class="btn btn-default">添加</button>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label  class="col-sm-2 col-form-label">图片</label>
                                        <div class="col-sm-10">
                                            <div id="img1">
                                                &lt;%&ndash;<input type="file" name="multipartFile" class="form-control">&ndash;%&gt;
                                            </div>

                                            <button type="button" id="addImg1" class="btn btn-default">添加</button>
                                        </div>
                                    </div>
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
                        </div>--%>
                        <!-- /.card -->

                    </div>
                    <!--/.col (left) -->
                </div>
                <!-- /.row -->





                <form class="layui-form" enctype="multipart/form-data" action="${PATH}/product/insert" method="post">
                    <input type="hidden" name="pageNum" value="1"/>
                    <input type="hidden" name="pageSize" value="10"/>
                    <div class="layui-form-item">
                        <label class="layui-form-label">款式批次</label>
                        <div class="layui-input-block">
                            <select class="layui-input layui-unselect" id="batch" name="batchId" >
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">款式名称</label>
                        <div class="layui-input-block">
                            <input type="text" name="name" required lay-verify="required" placeholder="款式名称" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">款式性别</label>
                        <div class="layui-input-block">
                            <input type="radio" value="M" name="gender" title="男款">
                            <input type="radio" value="f" name="gender" title="女款" checked>
                            <input type="radio" value="MF" name="gender" title="男女皆宜">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">款式编码</label>
                        <div class="layui-input-block">
                            <input type="text" name="productNumber" required lay-verify="required" placeholder="款式编码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">规格</label>
                        <div class="layui-input-block" id="sku">
                            <button type="button" id="addSkuName" class="layui-btn">
                                <i class="layui-icon">&#xe608;</i> 添加
                            </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">图片</label>
                        <div class="layui-input-block">
                            <div class="layui-upload">
                                <button type="button" class="layui-btn" id="addImg">多图片上传</button>
                                <%--<textarea name="description" class="textarea" placeholder="在此处添加商品描述" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid rgb(221, 221, 221); padding: 10px; display: none;"></textarea>
                            --%><blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">预览图：
                                    <div class="layui-upload-list" id="img" name='multipartFile'></div>
                                </blockquote>
                               </div>
                        </div>
                    </div>

                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">描述</label>
                        <div class="layui-input-block">
                            <%--<textarea name="description" placeholder="在此处添加商品描述" class="layui-textarea"></textarea>--%>
                                <textarea name="description" class="textarea" placeholder="在此处添加商品描述" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid rgb(221, 221, 221); padding: 10px; display: none;"></textarea>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" type="submit" id="commit">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>






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




<script type="text/javascript">
    $(document).ready(function () {
        $('.textarea').summernote({lang: 'zh-CN'})
        bsCustomFileInput.init();
    });
</script>
</body>
</html>
<script>

   /* <input type='text' name='skuName'>*/
   $("#batch").click(function () {
       alert(111);
   })

    $(function () {
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

        var i = 0;
        $("#addSkuName").click(function () {

            $("#sku").append($("<p class='custom-control-inline lay-allowClose='true'><input type='text' name='sku["+i+"].skuName' required lay-verify='required' placeholder='请输入规格' class='layui-input' style='width:100px;height: 39.3px'><i class='deleteSku layui-icon layui-unselect layui-tab-close'>ဆ</i><input type='text' name='sku["+i+"].skuStock' placeholder='款式库存' style='width:100px;height: 39.3px' class='layui-input'/>&nbsp;&nbsp;<input type='text' name='sku["+i+"].skuTotal' placeholder='款式总量' style='width:100px;height: 39.3px' class='layui-input'/></p>"))
            i++;
            $(".deleteSku").click(function () {
                $(this).parent().remove()
            })
        })

        $("#addImg").click(function () {
            $("#img").append($("<p><input type='file' name='multipartFile' class='form-control' style='width: 200px'/><button type='button' class='deleteImg'>删除</button></p>"))
            $(".deleteImg").click(function () {
                $(this).parent().remove()
            })
        })
       /* var length = $("input[name='multipartFile']").length;
        console.info(length)
        if(length >= 3){
            layer.msg("最多只能添加三张图片")
        }*/




        //单选框的一些layer我也不知道的什么东西，反正没有这个输入框和单选框就出不来
        layui.use('form', function(){
            var form = layui.form;

            //监听提交
            form.on('submit(formDemo)', function(data){
                layer.msg(JSON.stringify(data.field));
                return false;
            });
        });


    })
</script>
