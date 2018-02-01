<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books add</title>
</head>
<body>

<h2>Books add</h2>
<div class="datagrid">
    <spring:form modelAttribute="addBook" method="post" action="/books/check">
        <spring:input path="id"/><br>
        <spring:input path="title"/><br>
        <spring:input path="description"/><br>
        <spring:input path="author"/><br>
        <spring:input path="isbn"/><br>
        <spring:input path="printYear"/><br>
        <spring:input path="readAlready"/><br>
        <spring:button>Add Book</spring:button>
    </spring:form>
</div>
</body>
</html>
