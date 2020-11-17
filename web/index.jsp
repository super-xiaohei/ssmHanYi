<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/16
  Time: 13:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="PATH" value="${pageContext.request.contextPath}" scope="application"/>

<jsp:forward page="WEB-INF/views/login.jsp"/>
