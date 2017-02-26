<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>List of filtered users by name</title>
    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }
    </style>
</head>

<body>
<center>
    <c:if test="${!empty users}">
        <h1>List of filtered users by name</h1>
        <table class="tg">
            <tr>
                <th width="80">ID</th>
                <th width="120">NAME</th>
                <th width="120">AGE</th>
                <th width="120">IS_ADMIN</th>
                <th width="120">DATE</th>
                <th width="60">Edit</th>
                <th width="60">Delete</th>
            </tr>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td><a href="/userdata/${user.id}" target="_blank">${user.name}</a></td>
                    <td>${user.age}</td>
                    <td>${user.admin}</td>
                    <td>${user.date.toGMTString()}</td>
                    <td><a href="<c:url value='/update/${user.id}'/>">Edit</a></td>
                    <td><a href="<c:url value='/delete/${user.id}'/>">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <br>
        <a href="<c:url value="/users"/>" target="_blank">Return to Users List</a>
    </c:if>

    <c:if test="${empty users}">
        <h4>No matches</h4>
        <a href="<c:url value="/users"/>" target="_blank">Return to Users List</a>
    </c:if>
</center>
</body>
</html>
