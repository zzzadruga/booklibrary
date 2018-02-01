<%@ page import="ru.zzzadruga.model.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="ru.zzzadruga.controller.BookController" %><%--
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
<div class="datagrid">
    <table>
        <tr>
            <th>Book ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Author</th>
            <th>ISBN</th>
            <th>Print year</th>
            <th>Read already</th>
        </tr>
        <c:forEach var="book" items="${bookslist}">
            <tr>
                <td>${book.id}</td>
                <td>${book.title}</td>
                <td>${book.description}</td>
                <td>${book.author}</td>
                <td>${book.isbn}</td>
                <td>${book.printYear}</td>
                <td>${book.readAlready}</td>
            </tr>

        </c:forEach>
    </table>
</div>
</body>
</html>
