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
    <link rel="stylesheet" href="${PATH}/static/layui/dist/css/layui.css">
    <!-- 离线 Google 字体: Source Sans Pro -->
    <%--<link href="/AdminLTE/AdminLTE-3.x/dist/css/google.css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">--%>
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
                                <form class="form-horizontal" action="${PATH}/batch/list" id="queryForm">
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
                                                        <option value="">所有</option>
                                                        <option value="1">已激活</option>
                                                        <option value="0">已结束</option>
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
                           <%-- 分页和数据显示--%>
                            <div class="card-body">
                                <table id="example2" class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th><input type="checkbox" id="checkAll"/>&nbsp;&nbsp;全选</th>
                                        <th>批次名称</th>
                                        <th>申请开始时间</th>
                                        <th>申请结束时间</th>
                                        <th>选衣开始时间</th>
                                        <th>选衣结束时间</th>
                                        <th>困难等级</th>
                                        <th>激活状态</th>
                                        <th>开放年级</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <c:if test="${batchPageInfo.list != null}">
                                        <c:forEach items="${batchPageInfo.list}" var="batch">
                                            <tr>
                                                <td><input type="checkbox" name="checks" class="myCheck" id="${batch.id}"/></td>
                                                <td>${batch.name}</td>
                                                <td><fmt:formatDate value="${batch.applicationStartDate}" type="date"/></td>
                                                <td><fmt:formatDate value="${batch.applicationEndDate}" type="date"/></td>
                                                <td><fmt:formatDate value="${batch.registerStartDate}" type="date"/></td>
                                                <td><fmt:formatDate value="${batch.registerEndDate}" type="date"/></td>
                                                <td id="difValue">${batch.diffcultyValue}</td>
                                                <td id="activeStatus1">${batch.active == 0?"已结束":"已激活"}</td>
                                                <td>
                                                    <button id="${batch.id}" class="btn btn-outline-dark selectGrade">查看年级</button>
                                                </td>
                                                <td>
                                                    <c:if test="${batch.active == 1}">
                                                        <button id="${batch.id}" class="btn btn-outline-info update">修改</button>
                                                        <button  id="${batch.id}" class="btn btn-outline-primary end">结束批次</button>
                                                        <button id="${batch.id}" class="btn btn-outline-danger addGrade">添加开放年级</button>
                                                    </c:if>
                                                    <c:if test="${batch.active == 0}">
                                                        <button class="btn btn-outline-info">查看</button>
                                                        <button  id="${batch.id}" class="btn btn-outline-primary disabled">结束批次</button>
                                                        <button id="${batch.id}" class="btn btn-outline-danger disabled">添加开放年级</button>
                                                    </c:if>
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
                                            <option value="1" selected="selected">1</option>
                                            <option value="5">5</option>
                                            <option value="10">10</option>
                                        </select>&nbsp;&nbsp;&nbsp;
                                    <span>前往&nbsp;&nbsp;<input style="width: 50px;" id="pageNum"/>&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id="jump" class="btn btn-outline-success btn-xs" style="font-size: 10px">跳转</button></span>
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
        <%--添加批次的模态框--%>
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
                                        <input type="text" class="form-control" id="name" name="name" placeholder="批次名称 格式:例 1998-1999 学年">
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
        <%--添加开放年级模态框--%>
        <div class="modal fade" id="newGrade">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title ">添加开放年级</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <!--添加开放年级的模态框-->
                    <div class="modal-body">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">添加相关信息</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form id="gradeForm" role="form">
                                <div class="layui-form-item">
                                    <label></label>
                                    <label></label>
                                    <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                    <label></label>
                                    <label >添加开放年级</label>
                                    <div class="layui-input-block" id="grade">
                                        <button type="button" id="addBatchGrade" class="layui-btn">
                                            <i class="layui-icon">&#xe608;</i> 添加年级
                                        </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="saveGrade">保存</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <%--修改批次的模态框--%>
        <div class="modal fade" id="updateBatch">
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
                                <h3 class="card-title">修改相关信息</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form id="batchUpdateForm" role="form">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label >批次名称</label>
                                        <input type="text" class="form-control" id="nameUpdate" name="name" placeholder="批次名称 格式:例 1998-1999 学年">
                                    </div>
                                    <div class="form-group">
                                        <div class="form-group">
                                            <label>申请开始时间</label>
                                            <div class="input-group date" id="reservationdate1Update" data-target-input="nearest">
                                                <input type="text" name="applicationStartDate" id="applicationStartDateUpdate" class="form-control datetimepicker-input" name="" data-target="#reservationdate1" placeholder="申请开始时间">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label >申请结束时间</label>
                                        <div class="input-group date" id="reservationdate2Update" data-target-input="nearest">
                                            <input type="text" name="applicationEndDate" id="applicationEndDateUpdate" class="form-control datetimepicker-input" data-target="#reservationdate2" placeholder="申请结束时间">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label >选衣开始时间</label>
                                        <div class="input-group date" id="reservationdate3Update" data-target-input="nearest">
                                            <input type="text" name="registerStartDate" id="registerStartDateUpdate" class="form-control datetimepicker-input" data-target="#reservationdate3" placeholder="选衣开始时间">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label >选衣结束时间</label>
                                        <div class="input-group date" id="reservationdate4Update" data-target-input="nearest">
                                            <input type="text" name="registerEndDate" id="registerEndDateUpdate" class="form-control datetimepicker-input" data-target="#reservationdate4" placeholder="选衣结束时间">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label >困难等级</label>
                                        <div class="col-sm-6">
                                            <!-- radio -->
                                            <div class="form-group clearfix">
                                                <div class="icheck-primary d-inline">
                                                    <input type="radio" id="radioPrimary1Update" value="BKN" name="difficultyLevel" checked="">
                                                    <label for="radioPrimary1Update">不困难
                                                    </label>
                                                </div>
                                                <div class="icheck-primary d-inline">
                                                    <input type="radio" id="radioPrimary2Update" value="YBKN" name="difficultyLevel">
                                                    <label for="radioPrimary2Update">一般困难
                                                    </label>
                                                </div>
                                                <div class="icheck-primary d-inline">
                                                    <input type="radio" id="radioPrimary3Update" value="TSKN" name="difficultyLevel">
                                                    <label for="radioPrimary3Update">特殊困难
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
                        <button type="button" class="btn btn-primary" id="saveBatchUpdate">保存修改</button>
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
<script src="${PATH}/static/adminlte/plugins/moment/moment.min.js"></script>
<script src="${PATH}/static/adminlte/plugins/moment/locale/zh-cn.js"></script>
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



        //创建新的批次
        $("#createBatch").click(function () {
            //显示新建批次的模态框之前先清空表单,jQuery没有清空表单的功能，转化为dom对象（js）对表单进行清空
            $("#batchForm")[0].reset();
            $("#newBatch").modal("show");
        });

        //保存批次
        $("#saveBatch").click(function () {
            $.ajax({
                type:"get",
                url:"${PATH}/batch/getActiveBatch",
                dataType:"json",
                success:function (batch) {
                    console.info(batch)
                    if(batch.data != null){
                        layer.msg("存在已经激活的批次,无法再进行添加",{icon:0,time:1500},function () {

                        })
                    }else{
                        var name = $("#name").val();
                        $.ajax({
                            type:"post",
                            url:"${PATH}/batch/save",
                            data:$("#batchForm").serialize(),
                            dataType:"json",
                            success:function (res) {
                                console.info(res)
                                if (res.code == 200) {
                                    layer.msg("添加批次成功", {icon: 6,time: 1500}, function () {
                                        $("#newBatch").modal("hide");
                                        //刷新页面
                                        window.location = "${PATH}/batch/list?pageNum=1&pageSize=10";
                                    })
                                }
                            }
                        })
                    }
                }
            })
        })

        //layui的日期控制
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
        //跳转到多少页
        $("#jump").click(function () {
            var pageNum = $("#pageNum").val();
            window.location = "${PATH}/batch/list?pageNum=" + pageNum  + "&pageSize=" + ${batchPageInfo.pageSize};

        })

        //获取相关信息
        $.ajax({
                type:"get",
                url:"${PATH}/dictionary/getDictionary",
                data:{type:"DIFFICULTY"},
                dataType:"json",
                success:function (res) {
                    $("#difLevel").append($("<option value=''>" + "所有" + "</option>"));
                    $(res.data).each(function (i,index) {
                        if(difData==index.itemValue){
                            $("#difLevel").append($("<option value='" + index.itemValue + "' selected>"+ index.itemName + "</option>"))
                        }else {
                            $("#difLevel").append($("<option value='" + index.itemValue + "'>"+ index.itemName + "</option>"))
                        }
                        //console.info(index.itemName);

                    })
                }
            })


        //重置输入框和下拉框
        $("#reset").click(function () {
            $("#batchName").val("");
            $("#difLevel").val("");
            $("#activeStatus").val("");
        })

        //修改批次(未完成)
        $(".update").click(function () {
            //打开修改批次模态框之前填入相关数据
            var batchId = $(this).attr("id");
            //console.info(batchId);
            $.ajax({
                type:"get",
                url:"${PATH}/batch/selectBatchById?id=" + batchId,
                dataType:"json",
                success:function (res) {
                    //console,info(res);
                    $("#nameUpdate").val(res.data.name)
                    $("#applicationStartDateUpdate").val(res.data.applicationStartDate)
                    $("#applicationEndDateUpdate").val(res.data.applicationEndDate)
                    $("#registerStartDateUpdate").val(res.data.registerStartDate)
                    $("#registerEndDateUpdate").val(res.data.registerEndDate)
                }
            })
            $("#updateBatch").modal("show");
        })



        //结束批次
        $(".end").click(function () {
            var id = $(this).attr("id");
            console.info(id);
            layer.confirm("确定结束该批次吗?",{icon:3,title:"提示"},function(index) {
                $.ajax({
                    type:"get",
                    url:"${PATH}/batch/end?id=" + id,
                    dataType:"json",
                    success:function (res) {
                        window.location = "${PATH}/batch/list?pageNum=1&pageSize=10"
                    }
                })
                layer.close(index);
            },function (index) {

                    layer.close(index);
            });
            return false;
        })


        //选中所有
        $("#checkAll").click(function () {
            var flag = $(this).prop("checked");
            $(".myCheck").prop("checked",flag);
        })

        //判断选中的个数是否和总的个数一致，一致的话全选按钮就全部选上，否则不选
        $("input[name='checks']").click(function () {
            var length = $("input[name='checks']").length;
            console.info(length)
            var len = 0;
            $("input[name='checks']").each(function (i, index) {
                if($(index).prop("checked")){
                    len++;
                }
            })
            if(len === length){
                $("#checkAll").prop("checked",true)
            }else {
                $("#checkAll").prop("checked",false)
            }
        })

        //删除选中
       $("#deletes").click(function () {
            var idList = [];
           $(".myCheck").each(function (i, index) {
               if($(index).prop("checked")){
                   idList.push($(index).attr("id"))
               }
           })
           if(idList.length == 0){
                layer.msg("请至少选择一条数据",{icon:0,time:1500},function () {
                })
               return false;
            }
           console.info(idList);
           layer.confirm("确定要删除选中的批次吗?",{icon:3,title:"提示"},function (index) {
               $.ajax({
                   type:"get",
                   url:"${PATH}/batch/deletes",
                   data:{ids:idList},
                   dataType:"json",
                   success:function (res) {
                       if(res.code == 200){
                           layer.msg("删除成功",{icon:6,time:1500},function () {
                               window.location = "${PATH}/batch/list?pageNum=1&pageSize=10";
                           })
                       }
                   }
               })
               layer.close(index)
           },function (index) {
               layer.close(index)
           });

        })

        //添加开放年级
        $(".addGrade").click(function (res) {
            //console.info($(this).attr("id"))
            var batchId = $(this).attr("id");
            $("#gradeForm")[0].reset();
            $("#newGrade").modal("show");
        })
        //点击按钮添加年级的输入框
        $("#addBatchGrade").click(function () {
            $("#grade").append($("<p class='custom-control-inline lay-allowClose='true'><input type='text' id='grade' name='grades' required lay-verify='required' placeholder='请输入年级' class='layui-input' style='width:100px;height: 39.3px'><i class='deleteGrade layui-icon layui-unselect layui-tab-close'>ဆ</i></p>"))
            $(".deleteGrade").click(function () {
                $(this).parent().remove()
            })
        })
        //添加年级
       $("#saveGrade").click(function () {
           $.ajax({
               type:"get",
               url:"${PATH}/batch/addGrade",
               data:$("#gradeForm").serialize(),
               dataType:"json",
               success:function (res) {
                   if(res.data){
                       layer.msg("添加年级成功",{icon:1,time:1500},function (res) {
                           $("#newGrade").modal("hide");
                           window.location = "${PATH}/batch/list?pageNum=1&pageSize=10";
                       })
                   }
               }
           })
       })
        //查看年级
        $(".selectGrade").click(function () {

        })
    })
</script>
</body>
</html>

