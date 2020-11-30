<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 主侧边栏容器 -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- 品牌 Logo -->
    <a href="${PATH}/static/adminlte/index3.html" class="brand-link">
        <img src="${PATH}/static/adminlte/dist/img/photo2.png"
             alt="AdminLTE Logo"
             class="brand-image img-circle elevation-3"
             style="opacity: .9">
        <span class="brand-text font-weight-light">寒衣申请</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- 侧边栏用户面板（可选） -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="${PATH}/static/adminlte/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="用户头像">
            </div>
            <div class="info">
                <a href="#" class="d-block"><b>你好</b>---
                    <c:if test="${sessionScope.loginUser != null && sessionScope.loginUser.roleId == 2}">
                        ${loginUser.name} 校长
                    </c:if>
                    <c:if test="${sessionScope.loginUser != null && sessionScope.loginUser.roleId == 1}">
                        ${loginUser.name} 同学
                    </c:if>
                    <c:if test="${sessionScope.loginUser != null && sessionScope.loginUser.roleId == 3}">
                        ${loginUser.name} 院长
                    </c:if>
                    <c:if test="${sessionScope.loginUser != null && sessionScope.loginUser.roleId == 4}">
                        ${loginUser.name} 辅导员
                    </c:if>

                </a>
            </div>
        </div>

        <!-- 侧边栏菜单 -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- 使用 .nav-icon 类添加图标，
                     或使用 font-awesome 或其他任何图标字体库 -->
                <%--学生用户--%>
                <c:if test="${sessionScope.loginUser != null && sessionScope.loginUser.roleId == 1}">
                    <li class="nav-item">
                        <a href="${PATH}/product/listBySn?pageNum=1&pageSize=8" class="nav-link">
                            <input type="hidden" name="pageNum" value="1"/>
                            <input type="hidden" name="pageSize" value="8"/>
                            <i class="fas fa-circle nav-icon"></i>
                            <p>寒衣查看</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${PATH}/application/toApplicationCommit" class="nav-link">
                            <i class="fas fa-circle nav-icon"></i>
                            <p>提交申请</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${PATH}/application/listBySn" class="nav-link">
                            <i class="fas fa-circle nav-icon"></i>
                            <p>我的申请</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${PATH}/logout/toLogout" class="nav-link">
                            <i class="nav-icon far fa-circle text-danger"></i>
                            <p class="text">退出登录</p>
                        </a>
                    </li>
                </c:if>
                <%--辅导员用户--%>
                <c:if test="${sessionScope.loginUser != null && sessionScope.loginUser.roleId == 4}">
                    <li class="nav-item">
                        <a href="${PATH}/application/listBySn" class="nav-link">
                            <i class="fas fa-circle nav-icon"></i>
                            <p>申请管理</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${PATH}/application/waitAudit" class="nav-link">
                            <i class="fas fa-circle nav-icon"></i>
                            <p>待我审核</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${PATH}/application/" class="nav-link">
                            <i class="fas fa-circle nav-icon"></i>
                            <p>申请统计</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${PATH}/logout/toLogout" class="nav-link">
                            <i class="nav-icon far fa-circle text-danger"></i>
                            <p class="text">退出登录</p>
                        </a>
                    </li>
                </c:if>
                <%--学院用户--%>
                <c:if test="${sessionScope.loginUser != null && sessionScope.loginUser.roleId == 3  }">
                    <li class="nav-item">
                        <a href="${PATH}/application/listBySn" class="nav-link">
                            <i class="fas fa-circle nav-icon"></i>
                            <p>申请管理</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${PATH}/application/waitAudit" class="nav-link">
                            <i class="fas fa-circle nav-icon"></i>
                            <p>待我审核</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${PATH}/application/" class="nav-link">
                            <i class="fas fa-circle nav-icon"></i>
                            <p>申请统计</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${PATH}/logout/toLogout" class="nav-link">
                            <i class="nav-icon far fa-circle text-danger"></i>
                            <p class="text">退出登录</p>
                        </a>
                    </li>
                </c:if>
                <%--学校用户--%>
                <c:if test="${sessionScope.loginUser != null && sessionScope.loginUser.roleId == 2}">
                    <li class="nav-item has-treeview">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                款式管理
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${PATH}/product/list?pageNum=1&pageSize=8" class="nav-link">
                                    <input type="hidden" name="pageNum" value="1"/>
                                    <input type="hidden" name="pageSize" value="8"/>
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>寒衣列表</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${PATH}/product/toAdd" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>款式添加</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item has-treeview">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                申请明细
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${PATH}/application/listBySn" class="nav-link">
                                    <i class="fas fa-circle nav-icon"></i>
                                    <p>申请管理</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${PATH}/application/waitAudit" class="nav-link">
                                    <i class="fas fa-circle nav-icon"></i>
                                    <p>待我审核</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${PATH}/application/" class="nav-link">
                                    <i class="fas fa-circle nav-icon"></i>
                                    <p>申请统计</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="${PATH}/batch/list?pageNum=1&pageSize=10" class="nav-link">
                            <i class="fas fa-circle nav-icon"></i>
                            <p>批次设置</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${PATH}/logout/toLogout" class="nav-link">
                            <i class="nav-icon far fa-circle text-danger"></i>
                            <p class="text">退出登录</p>
                        </a>
                    </li>
                </c:if>
            </ul>

        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
