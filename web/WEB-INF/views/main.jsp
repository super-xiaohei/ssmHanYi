<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/16
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 3 | 日历</title>
    <!-- 告诉浏览器屏幕自适应 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- fullCalendar -->
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/fullcalendar/main.min.css">
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/fullcalendar-daygrid/main.min.css">
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/fullcalendar-timegrid/main.min.css">
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/fullcalendar-bootstrap/main.min.css">
    <!-- 主题样式 -->
    <link rel="stylesheet" href="${PATH}/static/adminlte/dist/css/adminlte.min.css">
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
                        <h1>日历</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页</a></li>
                            <li class="breadcrumb-item active">日历</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- 主体内容 -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <div class="sticky-top mb-3">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">可拖放事件</h4>
                                </div>
                                <div class="card-body">
                                    <!-- 事件 -->
                                    <div id="external-events">
                                        <div class="external-event bg-success">午餐</div>
                                        <div class="external-event bg-warning">回家</div>
                                        <div class="external-event bg-info">做作业</div>
                                        <div class="external-event bg-primary">UI 设计</div>
                                        <div class="external-event bg-danger">睡觉</div>
                                        <div class="checkbox">
                                            <label for="drop-remove">
                                                <input type="checkbox" id="drop-remove">
                                                移除后删除
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">创建事件</h3>
                                </div>
                                <div class="card-body">
                                    <div class="btn-group" style="width: 100%; margin-bottom: 10px;">
                                        <!--<button type="button" id="color-chooser-btn" class="btn btn-info btn-block dropdown-toggle" data-toggle="dropdown">Color <span class="caret"></span></button>-->
                                        <ul class="fc-color-picker" id="color-chooser">
                                            <li><a class="text-primary" href="#"><i class="fas fa-square"></i></a></li>
                                            <li><a class="text-warning" href="#"><i class="fas fa-square"></i></a></li>
                                            <li><a class="text-success" href="#"><i class="fas fa-square"></i></a></li>
                                            <li><a class="text-danger" href="#"><i class="fas fa-square"></i></a></li>
                                            <li><a class="text-muted" href="#"><i class="fas fa-square"></i></a></li>
                                        </ul>
                                    </div>
                                    <!-- /btn-group -->
                                    <div class="input-group">
                                        <input id="new-event" type="text" class="form-control" placeholder="事件标题">

                                        <div class="input-group-append">
                                            <button id="add-new-event" type="button" class="btn btn-primary">添加</button>
                                        </div>
                                        <!-- /btn-group -->
                                    </div>
                                    <!-- /input-group -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-md-9">
                        <div class="card card-primary">
                            <div class="card-body p-0">
                                <!-- THE CALENDAR -->
                                <div id="calendar"></div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
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
<!-- Bootstrap -->
<script src="${PATH}/static/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- jQuery UI -->
<script src="${PATH}/static/adminlte/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- AdminLTE App -->
<script src="${PATH}/static/adminlte/dist/js/adminlte.min.js"></script>
<!-- 用于演示 AdminLTE  -->
<script src="${PATH}/static/adminlte/dist/js/demo.js"></script>
<!-- fullCalendar 2.2.5 -->
<script src="${PATH}/static/adminlte/plugins/moment/moment.min.js"></script><script src="${PATH}/static/adminlte/plugins/moment/locale/zh-cn.js"></script>
<script src="${PATH}/static/adminlte/plugins/fullcalendar/main.min.js"></script><script src="${PATH}/static/adminlte/plugins/fullcalendar/locales/zh-cn.js"></script>
<script src="${PATH}/static/adminlte/plugins/fullcalendar-daygrid/main.min.js"></script>
<script src="${PATH}/static/adminlte/plugins/fullcalendar-timegrid/main.min.js"></script>
<script src="${PATH}/static/adminlte/plugins/fullcalendar-interaction/main.min.js"></script>
<script src="${PATH}/static/adminlte/plugins/fullcalendar-bootstrap/main.min.js"></script>
<!-- 特定页面脚本 -->
<script>
    $(function () {

        /* 初始化外部事件
         -----------------------------------------------------------------*/
        function ini_events(ele) {
            ele.each(function () {

                // 创建事件对象 (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
                // 它不需要有一个开始或结束
                var eventObject = {
                    title: $.trim($(this).text()) // 使用元素内容作为事件标题
                }

                // 将事件对象存储在 DOM 元素中，以便以后访问它
                $(this).data('eventObject', eventObject)

                // 使用 jQuery UI draggable 插件
                $(this).draggable({
                    zIndex        : 1070,
                    revert        : true, // 将事件返回
                    revertDuration: 0  //  拖动后的原始位置
                })

            })
        }

        ini_events($('#external-events div.external-event'))

        /* 初始化日历
         -----------------------------------------------------------------*/
        // 日历事件的日期（虚拟数据）
        var date = new Date()
        var d    = date.getDate(),
            m    = date.getMonth(),
            y    = date.getFullYear()

        var Calendar = FullCalendar.Calendar;
        var Draggable = FullCalendarInteraction.Draggable;

        var containerEl = document.getElementById('external-events');
        var checkbox = document.getElementById('drop-remove');
        var calendarEl = document.getElementById('calendar');

        // 初始化外部事件
        // -----------------------------------------------------------------

        new Draggable(containerEl, {
            itemSelector: '.external-event',
            eventData: function(eventEl) {
                console.log(eventEl);
                return {
                    title: eventEl.innerText,
                    backgroundColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
                    borderColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
                    textColor: window.getComputedStyle( eventEl ,null).getPropertyValue('color'),
                };
            }
        });

        var calendar = new Calendar(calendarEl, {locale:'zh-cn',locale:'zh-cn',
            plugins: [ 'bootstrap', 'interaction', 'dayGrid', 'timeGrid' ],
            header    : {
                left  : 'prev,next today',
                center: 'title',
                right : 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            'themeSystem': 'bootstrap',
            // 随机默认事件
            events    : [
                {
                    title          : '全天的活动',
                    start          : new Date(y, m, 1),
                    backgroundColor: '#f56954', //red
                    borderColor    : '#f56954', //red
                    allDay         : true
                },
                {
                    title          : '耗时的活动',
                    start          : new Date(y, m, d - 5),
                    end            : new Date(y, m, d - 2),
                    backgroundColor: '#f39c12', // 黄色
                    borderColor    : '#f39c12' // 黄色
                },
                {
                    title          : '会议',
                    start          : new Date(y, m, d, 10, 30),
                    allDay         : false,
                    backgroundColor: '#0073b7', // 蓝色
                    borderColor    : '#0073b7' // 蓝色
                },
                {
                    title          : '午餐',
                    start          : new Date(y, m, d, 12, 0),
                    end            : new Date(y, m, d, 14, 0),
                    allDay         : false,
                    backgroundColor: '#00c0ef', // 信息（浅绿色）
                    borderColor    : '#00c0ef' // 信息（浅绿色）
                },
                {
                    title          : '生日派对',
                    start          : new Date(y, m, d + 1, 19, 0),
                    end            : new Date(y, m, d + 1, 22, 30),
                    allDay         : false,
                    backgroundColor: '#00a65a', // 完成（绿色）
                    borderColor    : '#00a65a' // 完成（绿色）
                },
                {
                    title          : '点击谷歌',
                    start          : new Date(y, m, 28),
                    end            : new Date(y, m, 29),
                    url            : 'http://google.com/',
                    backgroundColor: '#3c8dbc', // 重要（浅蓝色）
                    borderColor    : '#3c8dbc' // 重要（浅蓝色）
                }
            ],
            editable  : true,
            droppable : true, // 这允许将东西为拖放到日历上！
            drop      : function(info) {
                // 是否选中了“移除后删除”复选框？
                if (checkbox.checked) {
                    // 如果是，从“可拖动事件”列表中删除该元素
                    info.draggedEl.parentNode.removeChild(info.draggedEl);
                }
            }
        });

        calendar.render();
        // $('#calendar').fullCalendar()

        /* 添加事件 */
        var currColor = '#3c8dbc' // 默认为红色
        // 颜色选择器按钮
        var colorChooser = $('#color-chooser-btn')
        $('#color-chooser > li > a').click(function (e) {
            e.preventDefault()
            // 保存颜色
            currColor = $(this).css('color')
            // 为按钮添加颜色
            $('#add-new-event').css({
                'background-color': currColor,
                'border-color'    : currColor
            })
        })
        $('#add-new-event').click(function (e) {
            e.preventDefault()
            // 获取值并确保它不为 null
            var val = $('#new-event').val()
            if (val.length == 0) {
                return
            }

            // 创建事件
            var event = $('<div />')
            event.css({
                'background-color': currColor,
                'border-color'    : currColor,
                'color'           : '#fff'
            }).addClass('external-event')
            event.html(val)
            $('#external-events').prepend(event)

            // 添加可拖动功能
            ini_events(event)

            // 移除事件框中的内容
            $('#new-event').val('')
        })
    })
</script>
</body>
</html>

