<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>衣服列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/fontawesome-free/css/all.min.css">
    <!-- summernote -->
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/summernote/summernote-bs4.css">
    <!-- Font Awesome -->
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
    <link rel="stylesheet" href="${PATH}/static/layer/theme/layer.css">
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
    <link rel="stylesheet" href="${PATH}/static/layer/theme/default/layer.css">
    <!-- 离线 Google 字体: Source Sans Pro -->
    <%--<link href="/AdminLTE/AdminLTE-3.x/dist/css/google.css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">--%>


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
                    <c:forEach items="${productList}" var="pro">
                        <div class="col-lg-2" style="margin: 5px">
                            <div class="card" style="padding: -10px">
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <c:forEach items="${pro.images}" var="img" varStatus="status">
                                                <c:if test="${status.index == 0}">
                                                    <div class="carousel-item active">
                                                        <img style="height: 150px;width: auto" class="d-block w-100" src="${PATH}/static/imgs/${img.path}" alt="第一张幻灯片">
                                                    </div>
                                                </c:if>
                                                <c:if test="${status.index != 0}">
                                                    <div class="carousel-item">
                                                        <img style="height: 150px;width: auto" class="d-block w-100" src="${PATH}/static/imgs/${img.path}" alt="第一张幻灯片">
                                                    </div>
                                                </c:if>
                                            </c:forEach>

                                                <%--<div class="carousel-item active">--%>
                                                <%--<img class="d-block w-100" src="${PATH}/static/img/1185dbee-4560-4c47-908b-154d21c2a431timg1.jpg" alt="第二张幻灯片">--%>
                                                <%--</div>--%>
                                        </div>
                                            <%--<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">--%>
                                            <%--<span class="carousel-control-prev-icon" aria-hidden="true"></span>--%>
                                            <%--<span class="sr-only">上一张</span>--%>
                                            <%--</a>--%>
                                            <%--<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">--%>
                                            <%--<span class="carousel-control-next-icon" aria-hidden="true"></span>--%>
                                            <%--<span class="sr-only">下一张</span>--%>
                                            <%--</a>--%>
                                        <p>款式名: ${pro.name} </p>
                                        <p>编码: ${pro.productNumber} </p>
                                        <button id="${pro.id}" class="btn btn-outline-success select" style="margin-top: 10px">查看</button>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <%--查看商品款式信息的模态框--%>
                <div class="modal fade" id="productMsg">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title ">新建批次</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <!--查看款式信息的模态框-->
                            <div class="modal-body">
                                <div class="card card-primary">
                                    <div class="card-header">
                                        <h3 class="card-title">输入相关信息</h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <!-- form start -->
                                    <form id="form" class="layui-form" enctype="multipart/form-data">

                                        <input type="hidden" id="proId" name=""/>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">批次</label>
                                            <div class="layui-input-block">
                                                <%--<select class="layui-input layui-unselect" id="batch" name="batchId" >
                                                </select>--%>
                                                    <input type="text" id="batchName" name="batchName" readonly required lay-verify="required" placeholder="款式" autocomplete="off" class="layui-input">
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">款式</label>
                                            <div class="layui-input-block">
                                                <input type="text" id="name" name="name" readonly required lay-verify="required" placeholder="款式" autocomplete="off" class="layui-input">
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">性别</label>
                                            <div class="layui-input-block">
                                                <input readonly  id="gender" name="gender">
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">编码</label>
                                            <div class="layui-input-block">
                                                <input type="text" id="productNumber" readonly name="productNumber" required lay-verify="required" placeholder="编码" autocomplete="off" class="layui-input">
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">规格</label>
                                            <div class="layui-input-block">
                                                <%--<button type="button" id="addSku" class="layui-btn">
                                                    <i class="layui-icon">&#xe608;</i> 添加
                                                </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                                                    <select lay-ignore id="skus">
                                                    </select>
                                            </div>
                                        </div>

                                        <div class="layui-form-item">
                                            <label class="layui-form-label">图片</label>
                                            <div class="layui-input-block">
                                                <div class="layui-upload">
                                                    <%--<textarea name="description" class="textarea" placeholder="在此处添加商品描述" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid rgb(221, 221, 221); padding: 10px; display: none;"></textarea>
                                                --%>预览图：<blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;" id="imgs">
                                                    <div class="layui-upload-list" id="img" name='multipartFile'></div>
                                                </blockquote>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="layui-form-item layui-form-text">
                                            <label class="layui-form-label">描述</label>
                                            <div class="layui-input-block" id="description">
                                                <%--<textarea name="description" placeholder="在此处添加商品描述" class="layui-textarea"></textarea>--%>
                                                <textarea name="description" class="textarea"  style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid rgb(221, 221, 221); padding: 10px; display: none;"></textarea>
                                            </div>
                                        </div>

                                       <%-- <div class="layui-form-item">
                                            <div class="layui-input-block">
                                                <button class="layui-btn" type="submit" id="commit">立即提交</button>
                                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                            </div>
                                        </div>--%>
                                        <div class="modal-footer justify-content-between">
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
                                            <button type="button" id="choosePro" class="btn btn-success float-right">选衣</button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <%--修改商品款式信息的模态框--%>
                <div class="modal fade" id="productUpdate">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title ">新建批次</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <!--修改款式信息的模态框-->
                            <div class="modal-body">
                                <div class="card card-primary">
                                    <div class="card-header">
                                        <h3 class="card-title">输入相关信息</h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <!-- form start -->
                                    <form id="updateForm" class="layui-form" enctype="multipart/form-data" action="${PATH}/product/update" method="post">
                                        <input type="hidden" name="id" id="proId2"/>
                                        <input type="hidden" name="pageNum" value="1"/>
                                        <input type="hidden" name="pageSize" value="10"/>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">批次</label>
                                            <div class="layui-input-block">
                                                <select class="layui-input layui-unselect" id="batch" name="batchId" >
                                                </select>
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">款式</label>
                                            <div class="layui-input-block">
                                                <input type="text" id="nameUpdate" name="name"  required lay-verify="required" placeholder="款式" autocomplete="off" class="layui-input">
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">性别</label>
                                            <div class="layui-input-block">
                                                <input type="radio" value="M" name="gender" title="男款">
                                                <input type="radio" value="F" name="gender" title="女款">
                                                <input type="radio" value="MF" name="gender" title="男女皆宜">
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">编码</label>
                                            <div class="layui-input-block">
                                                <input type="text" id="productNumberUpdate"  name="productNumber" required lay-verify="required" placeholder="编码" autocomplete="off" class="layui-input">
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">规格</label>
                                            <button type="button" id="addSkuUpdate" class="layui-btn">
                                                <i class="layui-icon">&#xe608;</i> 添加
                                            </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <div class="layui-input-block" id="skusUpdate">

                                               <div class="layui-input-block">

                                               </div>
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">图片</label>
                                            <div class="layui-input-block">
                                                <div class="layui-upload">
                                                    <button type="button" class="layui-btn" id="addImgUpdate">图片上传</button>
                                                    <%--<textarea name="description" class="textarea" placeholder="在此处添加商品描述" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid rgb(221, 221, 221); padding: 10px; display: none;"></textarea>
                                                --%>预览图：<blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;" id="imgsUpdate">
                                                    <div class="layui-upload-list" id="imgUpdate" name='multipartFile'></div>
                                                </blockquote>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="layui-form-item layui-form-text">
                                            <label class="layui-form-label">描述</label>
                                            <div class="layui-input-block" id="descriptionUpdate">
                                                <%--<textarea name="description" placeholder="在此处添加商品描述" class="layui-textarea"></textarea>--%>
                                                <textarea name="description" class="textarea"  style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid rgb(221, 221, 221); padding: 10px; display: none;"></textarea>
                                            </div>
                                        </div>

                                         <div class="layui-form-item">
                                             <div class="layui-input-block">
                                                 <button class="layui-btn" type="submit" id="commit">立即提交</button>
                                             </div>
                                         </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
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
</body>
</html>
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
<script src="${PATH}/static/adminlte/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<script src="${PATH}/static/layui/dist/layui.js"></script>

<script src="${PATH}/static/layer/layer.js"></script>

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
<script>
    $(function () {
        $(document).ready(function () {
            $('.textarea').summernote({lang: 'zh-CN',code:''})
            bsCustomFileInput.init();
        });


        $(".select").click(function () {
            var id = $(this).attr("id");
            $.get("${PATH}/product/selectById?id=" + id,function (res) {
                //console.info(res)
                //打开模态框之前获取相关信息
                $("#proId").val(res.data.id);
                $("#batchName").val(res.data.batch.name);
                $("#name").val(res.data.name);
                $("#gender").val(res.data.sexValue)
                $("#productNumber").val(res.data.productNumber);
                $("#skus").empty();
                $("#skus").append($("<option value=''>"+""+"</option>"))
                $(res.data.skus).each(function (i,index) {
                    $("#skus").append($("<option class='skuA' value='"+index.id+"' name='sku'>"+index.name+"</option>"))
                })
                $("#imgs").empty()
                $(res.data.images).each(function (i,index) {
                    $("#imgs").append($("<img src='${PATH}/static/imgs/" + index.path + "'/>"))
                })
                $("#description").html(res.data.description);
               $("#productMsg").modal("show");
            },"json")
        })

        $.ajax({
            type: "get",
            url: "${PATH}/batch/listByAjax",
            dataType: "json",
            success: function (result) {
                $(result.data).each(function (i, index) {
                    $("#batch").append($("<option value='"+index.id+"'>"+index.name+"</option>"))
                })
               /* $("#batch").val(res.data.batchId)*/
            }
        })

        $("#addSkuUpdate").click(function () {
            $("#skusUpdate").append($("<p class='custom-control-inline lay-allowClose='true'><input type='text' name='skuName' required lay-verify='required' placeholder='请输入规格' class='layui-input' style='width:100px;height: 39.3px'><i class='deleteSku layui-icon layui-unselect layui-tab-close'>ဆ</i></p>"))
            $(".deleteSku").click(function () {
                $(this).parent().remove()
            })
        })
        $("#addImgUpdate").click(function () {
            $("#imgsUpdate").append($("<p><input type='file' name='multipartFile' class='form-control' style='width: 200px'/><button type='button' class='deleteImg btn btn-outline-dark'>删除</button></p>"))
            $(".deleteImg").click(function () {
                $(this).parent().remove()
            })
        })

        $("#choosePro").click(function () {
            var proId2 = $("#proId").val();
            console.info(proId2);
            var skuId = "";
            $(".skuA").each(function (i, index) {
               if($(index).prop("selected")){
                   skuId = $(index).val();
                   console.info(skuId)
               }
            })
            if(skuId === ""){
                layer.msg("请务必要选择款式尺码哦!",{icon:3,time:1500},function () {
                    return false;
                })
                return false;
            }
            $.ajax({
                type:"post",
                url:"${PATH}/application/updateApp",
                data:{skuId:skuId,productId:proId2},
                dataType:"json",
                success:function (res) {
                    if(res.data){
                        layer.msg("选衣成功哦!",{icon:6,time:1500},function () {
                            $("#productMsg").modal("hide");
                        })
                    }
                }
            })
        })

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
