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
    <!-- 离线 Google 字体: Source Sans Pro -->
</head>
<body class="hold-transition sidebar-mini">

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
                    <h1>我的申请信息</h1>
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
                            <form class="form-horizontal" action="${PATH}/batch/list" method="get">
                                <input type="hidden" name="pageNum" value="1"/>
                                <input type="hidden" name="pageSize" value="10"/>
                                <div class="row">
                                    <div class="layui-form-item">
                                        <div class="layui-input-inline">
                                            <div class="layui-unselect layui-form-select">
                                                <div class="layui-select-title">
                                                    <input type="text"  id="batchName" name="name" placeholder="批次名称" class="layui-input layui-unselect">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="layui-input-inline">
                                            <div class="layui-unselect layui-form-select">
                                                <div class="layui-select-title">
                                                    <select class="layui-input layui-unselect" id="difLevel" name="difficultyLevel">
                                                        <%--&lt;%&ndash;<option value="">所有</option>
                                                        <option value="TSKN">特殊困难</option>
                                                        <option value="YBKN">一般困难</option>
                                                        <option value="BKN">不困难</option>&ndash;%&gt;--%>
                                                    </select>
                                                    <i class="layui-edge"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="layui-input-inline">
                                            <div class="layui-unselect layui-form-select">
                                                <div class="layui-select-title">
                                                    <select class="layui-input layui-unselect" name="active" id="activeStatus">
                                                        <%--<option value="">所有</option>
                                                        <option value="1">已激活</option>
                                                        <option value="0">已结束</option>--%>
                                                    </select>
                                                    <i class="layui-edge"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="layui-input-inline" style="width: 60px">
                                            <div class="layui-unselect layui-form-select">
                                                <div class="layui-select-title">
                                                    <button type="submit" class="fab  btn btn-outline-primary" id="query">查询</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div class="col-2">
                                        <input type="text" id="batchName" name="name" class="form-control" placeholder="批次名称">
                                    </div>
                                    <div class="col-2">
                                        <select class="form-control" id="difLevel" name="difficultyLevel">
                                            &lt;%&ndash;<option value="">所有</option>
                                            <option value="TSKN">特殊困难</option>
                                            <option value="YBKN">一般困难</option>
                                            <option value="BKN">不困难</option>&ndash;%&gt;
                                        </select>
                                    </div>
                                    <div class="col-2">
                                        <select class="form-control" name="active" id="activeStatus">
                                            <option value="">所有</option>
                                            <option value="1">已激活</option>
                                            <option value="0">未激活</option>
                                        </select>
                                    </div>
                                    <div class="col-0.3">
                                        <button type="submit" class="fab  btn btn-outline-primary" id="query">查询</button>
                                    </div>--%>
                                    <div class="col-3">
                                        <button type="button" class="fab  btn btn-outline-dark" id="reset">重置</button>&nbsp;&nbsp;&nbsp;
                                        <button type="button" class="fab  btn btn-outline-success" id="createBatch">新建批次</button>&nbsp;&nbsp;&nbsp;
                                        <button type="button" class="fab  btn btn-outline-danger" id="deletes">删除选中</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <a href="${PATH}/application/export" class="btn btn-outline-danger">导出Excel</a>
                            <br/><br/>
                            <table id="example2" class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>所属批次</th>
                                    <th>学生姓名</th>
                                    <th>申请困难等级</th>
                                    <th>申请理由</th>
                                    <th>审核意见</th>
                                    <th>审核状态</th>
                                </tr>
                                </thead>
                                <c:if test="${applicationList != null}">
                                    <c:forEach items="${applicationList}" var="app">
                                        <tr>
                                            <td>${app.batch.name}</td>
                                            <td>${app.name}</td>
                                            <td>${app.difValue}</td>
                                            <td>${app.applicationReason}</td>
                                            <td>${app.auditComment}</td>
                                            <td>${app.statusValue}</td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </table>

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
        /*---------------------------------------------------自己写----------------------------------------------------------------------------------------------------------------------------------*/
        /*---------------------------------------------------自己写----------------------------------------------------------------------------------------------------------------------------------*/
        /*---------------------------------------------------自己写----------------------------------------------------------------------------------------------------------------------------------*/
    })
</script>
</body>
</html>

