<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Users List</title>
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
<a href="../../index.jsp">Back to main menu</a>
<br/>
<br/>
<table>
    <tr>
        <td align="=left">
            <h3>Add/Edit a User</h3>
            <c:url var="addAction" value="/users/add"/>
            <form:form action="${addAction}" commandName="user">
                <table>
                    <c:if test="${!empty user.name}">
                        <tr>
                            <td>
                                <form:label path="id">
                                    <spring:message text="ID"/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="id" readonly="true" size="8" disabled="true"/>
                                <form:hidden path="id"/>
                            </td>
                        </tr>
                    </c:if>
                    <tr>
                        <td>
                            <form:label path="name">
                                <spring:message text="NAME"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="name"/>
                        </td>
                        <td align="left"><form:errors path="name" cssClass="error"/></td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="age">
                                <spring:message text="AGE"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="age"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="admin">
                                <spring:message text="IS_ADMIN"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="admin"/>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <c:if test="${!empty user.name}">
                                <input type="submit"
                                       value="<spring:message text="Update User"/>"/>
                            </c:if>
                            <c:if test="${empty user.name}">
                                <input type="submit"
                                       value="<spring:message text="Add User"/>"/>
                            </c:if>
                        </td>
                    </tr>
                </table>
            </form:form>
        </td>
        <td rowspan="2" align="center">
            <c:if test="${!empty users}">
                <h1>Users List</h1>
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
                    <tr>
                        <c:if test="${listOfAllUsers.size() > -1}">
                            <c:forEach begin="1" end="${countOfPages}" var="val">
                                <c:url var="pageURL" value="usersPage?numpage=${val}"/>
                                <a href="${pageURL}">${val}</a>-.
                            </c:forEach>
                        </c:if>
                    </tr>

                </table>
            </c:if>
        </td>
    </tr>
    <tr>
        <td align="left">
            <h3>Filter users</h3>
            <c:url var="filterAction" value="/users/filter"/>
            <form:form action="${filterAction}" commandName="user">
                <table>
                    <tr>
                        <td>
                            <form:label path="name">
                                <spring:message text="NAME"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="name"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit"
                                   value="<spring:message text="Filter User"/>"/>

                        </td>
                    </tr>
                </table>
            </form:form>
        </td>
    </tr>
</table>
</body>
</html>
