<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/16
  Time: 18:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 3 | 数据表格</title>
    <!-- 告诉浏览器屏幕自适应 -->
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
    <link rel="stylesheet" href="${PATH}/static/layui/css/layui.css">
    <!-- 离线 Google 字体: Source Sans Pro -->
    <link href="/AdminLTE/AdminLTE-3.x/dist/css/google.css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- 导航栏 -->
    <jsp:include page="/WEB-INF/common/header.jsp"/>
    <!-- /.navbar -->

    <jsp:include page="/WEB-INF/common/sidebar.jsp"/>


    <!-- Content Wrapper. 包含页面内容 -->
    <div class="content-wrapper">
        <!-- 内容标题（页面标题） -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>批次信息</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页</a></li>
                            <li class="breadcrumb-item active">数据表格</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- 主体内容 -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <button class="fab  fa-plus-square btn btn-outline-primary" id="createBatch">新建批次</button>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="example2" class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>批次名称</th>
                                        <th>申请开始时间</th>
                                        <th>申请结束时间</th>
                                        <th>选衣开始时间</th>
                                        <th>选衣结束时间</th>
                                        <th>困难等级</th>
                                        <th>激活状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <c:if test="${batchPageInfo.list != null}">
                                        <c:forEach items="${batchPageInfo.list}" var="batch">
                                            <tr>
                                                <td>${batch.name}</td>
                                                <td><fmt:formatDate value="${batch.applicationStartDate}" type="date"/></td>
                                                <td><fmt:formatDate value="${batch.applicationEndDate}" type="date"/></td>
                                                <td><fmt:formatDate value="${batch.registerStartDate}" type="date"/></td>
                                                <td><fmt:formatDate value="${batch.registerEndDate}" type="date"/></td>
                                                <td>${batch.diffcultyValue}</td>
                                                <td>${batch.active == 0?"未激活":"已激活"}</td>
                                                <td>
                                                    <button class="btn btn-outline-info">修改</button>
                                                    <button class="btn btn-outline-danger">删除</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </table>
                                <div class="card-footer clearfix">
                                    <ul class="pagination pagination-sm m-0 float-right">
                                        <c:if test="${!batchPageInfo.isFirstPage}">
                                            <li class="page-item"><a class="page-link" href="${PATH}/batch/list?pageNum=${batchPageInfo.pageNum - 1}&pageSize=${batchPageInfo.pageSize}">«</a></li>
                                        </c:if>
                                        <c:forEach begin="${batchPageInfo.navigateFirstPage}" end="${batchPageInfo.navigateLastPage}" var="curPageNo">
                                            <c:if test="${batchPageInfo.pageNum == curPageNo}">
                                                <li class="active page-item"><a class="page-link" href="${PATH}/batch/list?pageNum=${curPageNo}&pageSize=${batchPageInfo.pageSize}">${curPageNo}</a></li>
                                            </c:if>

                                            <c:if test="${batchPageInfo.pageNum != curPageNo}">
                                                <li class="page-item"><a class="page-link" href="${PATH}/batch/list?pageNum=${curPageNo}&pageSize=${batchPageInfo.pageSize}">${curPageNo}</a></li>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${!batchPageInfo.isLastPage}">
                                            <li class="page-item"><a class="page-link" href="${PATH}/batch/list?pageNum=${batchPageInfo.pageNum + 1}&pageSize=${batchPageInfo.pageSize}">»</a></li>
                                        </c:if>

                                    </ul>
                                    <span>共 ${batchPageInfo.total} 条</span>
                                    <span>第 ${batchPageInfo.pageNum} 页</span>
                                    <span>共 ${batchPageInfo.pages} 页</span>&nbsp;&nbsp;&nbsp;
                                    <span>选择每页要显示的数据</span>&nbsp;
                                        <select name="pageSize" id="pageSize" style="width: 50px;">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="4">4</option>
                                        </select>&nbsp;&nbsp;&nbsp;
                                    <span>跳转到<input style="width: 50px;" id="pageNum"/>页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id="jump" class="btn btn-outline-success btn-xs">跳转</button></span>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <div class="modal fade" id="newBatch">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title ">新建批次</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <!--添加批次的模态框-->
                    <div class="modal-body">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">输入相关信息</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form id="batchForm" role="form">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label >批次名称</label>
                                        <input type="text" class="form-control" id="name" name="name" placeholder="批次名称 格式:例 1998-1999">
                                    </div>
                                    <div class="form-group">
                                        <div class="form-group">
                                            <label>申请开始时间</label>
                                            <div class="input-group date" id="reservationdate1" data-target-input="nearest">
                                                <input type="text" name="applicationStartDate" id="applicationStartDate" class="form-control datetimepicker-input" name="" data-target="#reservationdate1" placeholder="申请开始时间">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label >申请结束时间</label>
                                        <div class="input-group date" id="reservationdate2" data-target-input="nearest">
                                            <input type="text" name="applicationEndDate" id="applicationEndDate" class="form-control datetimepicker-input" data-target="#reservationdate2" placeholder="申请结束时间">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label >选衣开始时间</label>
                                        <div class="input-group date" id="reservationdate3" data-target-input="nearest">
                                            <input type="text" name="registerStartDate" id="registerStartDate" class="form-control datetimepicker-input" data-target="#reservationdate3" placeholder="选衣开始时间">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label >选衣结束时间</label>
                                        <div class="input-group date" id="reservationdate4" data-target-input="nearest">
                                            <input type="text" name="registerEndDate" id="registerEndDate" class="form-control datetimepicker-input" data-target="#reservationdate4" placeholder="选衣结束时间">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label >困难等级</label>
                                        <div class="col-sm-6">
                                            <!-- radio -->
                                            <div class="form-group clearfix">
                                                <div class="icheck-primary d-inline">
                                                    <input type="radio" id="radioPrimary1" value="BKN" name="difficultyLevel" checked="">
                                                    <label for="radioPrimary1">不困难
                                                    </label>
                                                </div>
                                                <div class="icheck-primary d-inline">
                                                    <input type="radio" id="radioPrimary2" value="YBKN" name="difficultyLevel">
                                                    <label for="radioPrimary2">一般困难
                                                    </label>
                                                </div>
                                                <div class="icheck-primary d-inline">
                                                    <input type="radio" id="radioPrimary3" value="TSKN" name="difficultyLevel">
                                                    <label for="radioPrimary3">特殊困难
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <!-- /.card-body -->
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="saveBatch">保存修改</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
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
<script src="${PATH}/static/layui/layui.js"></script>
<script src="${PATH}/static/layer/layer.js"></script>
<!-- 页面脚本 -->
<script>
    $(function () {
        $("#example1").DataTable({"language": {"url": "/AdminLTE/AdminLTE-3.x/plugins/datatables/Chinese.json"},"language": {"url": "/AdminLTE/AdminLTE-3.x/plugins/datatables/Chinese.json"},
            "responsive": true,
            "autoWidth": false,
        });
        $('.select2').select2()

        //初始化 Select2 元素
        $('.select2bs4').select2({
            theme: 'bootstrap4'
        })

        // 日期格式 dd/mm/yyyy
        $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
        // 日期格式2 mm/dd/yyyy
        $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
        // 欧元
        $('[data-mask]').inputmask()

        // 日期范围选择器
        $('#reservationdate1').datetimepicker({
            format: 'YYYY-MM-DD'
        });
        $('#reservationdate2').datetimepicker({
            format: 'YYYY-MM-DD'
        });
        $('#reservationdate3').datetimepicker({
            format: 'YYYY-MM-DD'
        });
        $('#reservationdate4').datetimepicker({
            format: 'YYYY-MM-DD'
        });
        // 日期范围选择器
        $('#reservation').daterangepicker()
        // 日期范围选择器 with time picker
        $('#reservationtime').daterangepicker({locale:{applyLabel: '确定',cancelLabel: '取消',customRangeLabel: '自定义范围',},locale:{applyLabel: '确定',cancelLabel: '取消',customRangeLabel: '自定义范围',},
            timePicker: true,
            timePickerIncrement: 30,
            locale: {
                format: 'MM/DD/YYYY hh:mm A'
            }
        })
        //Date range as a button
        $('#daterange-btn').daterangepicker(
            {
                ranges   : {
                    '今天'       : [moment(), moment()],
                    '昨天'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    '最近7天' : [moment().subtract(6, 'days'), moment()],
                    '最近30天': [moment().subtract(29, 'days'), moment()],
                    '本月'  : [moment().startOf('month'), moment().endOf('month')],
                    '上月'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                },
                startDate: moment().subtract(29, 'days'),
                endDate  : moment()
            },
            function (start, end) {
                $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
            }
        )

        //Timepicker
        $('#timepicker').datetimepicker({
            format: 'LT'
        })
        /*---------------------------------------------------自己写---------------------------------------------------------------------------------------------------------------*/
        $("#createBatch").click(function () {
            //显示新建批次的模态捐框之前先清空表单,jQuery没有清空表单的功能，转化为dom对象（js）对表单进行清空
            $("#batchForm")[0].reset();
            $("#newBatch").modal("show");
        });

        $("#saveBatch").click(function () {
            $.ajax({
                type:"get",
                url:"${PATH}/batch/getActiveBatch",
                dataType:"json",
                success:function (batch) {
                    if(batch.data != null){
                        layer.msg("存在已经激活的批次,无法在进行添加",{icon:0,time:1500},function () {

                        })
                    }else{
                        var name = $("#name").val();
                        $.ajax({
                            type:"get",
                            url:"${PATH}/batch/save",
                            data:$("#batchForm").serialize(),
                            dataType:"json",
                            success:function (res) {
                                if (res.code == 200) {
                                    layer.msg("添加批次成功", {icon: 6, time: 1500}, function () {
                                        $("#newBatch").modal("hide");
                                        //刷新页面
                                        window.location = "${PATH}/batch/list";
                                    })
                                }
                            }
                        })
                    }
                }
            })
        })
        layui.use('laydate', function(){
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#applicationStartDate' //指定元素
            });
            laydate.render({
                elem: '#applicationEndDate' //指定元素
            });
            laydate.render({
                elem: '#registerStartDate' //指定元素
            });
            laydate.render({
                elem: '#registerEndDate' //指定元素
            });

        });
        $("#pageSize").val("${batchPageInfo.pageSize}")
        $("#pageSize").change(function () {
            window.location = "${PATH}/batch/list?pageNum=1&pageSize=" + $(this).val();
        })

        $("#pageNum").val("${batchPageInfo.pageNum}");
        $("#jump").click(function () {
            var pageNum = $("#pageNum").val();
            window.location = "${PATH}/batch/list?pageNum=" + pageNum  + "&pageSize=" + ${batchPageInfo.pageSize};

        })
    });
</script>
</body>
</html>
