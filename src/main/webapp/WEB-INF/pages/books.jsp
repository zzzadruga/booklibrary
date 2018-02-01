<%--
  Created by IntelliJ IDEA.
  User: Nikolai
  Date: 01.02.2018
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books list</title>
</head>
<body>

<h2>List of available products</h2>

<!-- div for apply styling to table  -->
<div class="datagrid">
    <table>
        <tr>
            <th>Product ID</th>
            <th>Product Title</th>
        </tr>

        <!-- loop over and print our customers -->
        <c:forEach var="book" items="${books}">

            <tr>
                <td>${book.id}</td>
                <td>${book.title}</td>
            </tr>

        </c:forEach>
    </table>
</div>
</body>
</html>
