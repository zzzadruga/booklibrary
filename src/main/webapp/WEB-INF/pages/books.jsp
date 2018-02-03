<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>Книжная полка</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
</head>
<body>
<div id="header">
    <div class="top">
        <div id="logo">
            <span class="image avatar48"><img src="${pageContext.request.contextPath}/resources/images/avatar.png" alt="" /></span>
        </div>
        <nav id="nav">
            <ul>
                <li><a href="/books/list" id="main-link" class="skel-layers-ignoreHref"><span class="icon fa-star">Главная</span></a></li>
                <li><a href="#list" id="book-list-link" class="skel-layers-ignoreHref"><span class="icon fa-book">Книги</span></a></li>
                <c:if test="${empty bookModel.author}">
                    <li><a href="#add" id="add-book-link" class="skel-layers-ignoreHref"><span class="icon fa-plus-square">Добавить</span></a></li>
                </c:if>
                <c:if test="${!empty bookModel.author}">
                    <li><a href="#add" id="add-book-link" class="skel-layers-ignoreHref"><span class="icon fa-edit">Редактировать</span></a></li>
                </c:if>
            </ul>
        </nav>
    </div>
</div>
<div id="main">
    <section class="one dark cover">
        <div class="container">
            <header>
                <h2>CRUD</h2>
            </header>
            <p>У вас есть всего 1 таблица book. В ней хранится список книг (например, на книжной полке). Книги на полку можно добавлять (create), брать посмотреть (read), заменять на новый выпуск (update), убирать (delete).</p>
        </div>
    </section>
    <section id="list" class="three">
        <div class="container">
            <header>
                <h2>Список книг</h2>
            </header>
            <table>
                <tr>
                    <th>Название</th>
                    <th>Краткое описание</th>
                    <th>Автор</th>
                    <th>ISBN</th>
                    <th>Дата печати</th>
                    <th>Функции</th>
                </tr>
                <c:forEach var="book" items="${bookslist}">
                    <tr>
                        <td>${book.title}</td>
                        <td>${book.description}</td>
                        <td>${book.author}</td>
                        <td>${book.isbn}</td>
                        <td>${book.printYear}</td>
                        <td>
                            <c:if test="${book.readAlready}">
                                <span class="icon fa-check-square"/>
                            </c:if>
                            <c:if test="${not book.readAlready}">
                                <a href="/books/read/${book.id}"  class="skel-layers-ignoreHref"><span class="icon fa-square-o"/></a>
                            </c:if>
                            <a href="<c:url value='/books/remove/${book.id}' />"><span class="icon fa-trash"/></a>
                            <a href="<c:url value='/books/edit/${book.id}#add' />"><span class="icon fa-edit"/></a>
                        </td>

                    </tr>
                </c:forEach>
            </table>
        </div>
    </section>

    <section id="add" class="four">
        <div class="container">
            <header>
                <c:if test="${empty bookModel.author}">
                    <h2>Добавление книги</h2>
                </c:if>
                <c:if test="${!empty bookModel.author}">
                    <h2>Обновление книги</h2>
                </c:if>
            </header>
            <form:form modelAttribute="bookModel" method="post" action="/books/addBook"  accept-charset="utf-8">
                <div class="row">
                    <form:input path="id" placeholder="ID" type="hidden" maxlength="100"/>
                    <div class="12u 12u"><form:input path="title" placeholder="Название" type="text" maxlength="100"/></div><br>
                    <c:if test="${empty bookModel.author}">
                        <div class="4u 12u"><form:input path="author" placeholder="Автор" type="text" maxlength="100"/></div>
                    </c:if>
                    <c:if test="${!empty bookModel.author}">
                        <div class="4u 12u"><form:input readonly="true" path="author" placeholder="Автор" type="text"/></div>
                    </c:if>
                    <div class="4u 12u"><form:input path="isbn" placeholder="ISBN" type="text" maxlength="20"/></div>
                    <div class="4u 12u"><form:input path="printYear" placeholder="Год издания" type="text" pattern="\d*" maxlength="4"/></div><br>
                    <div class="12u 12u"><form:textarea path="description" placeholder="Описание" type="text" maxlength="255"></form:textarea></div><br>
                    <c:if test="${empty bookModel.author}">
                        <div class="12u"><button>Добавить</button></div>
                    </c:if>
                    <c:if test="${!empty bookModel.author}">
                        <div class="12u"><button>Обновить</button></div>
                    </c:if>
                </div>
            </form:form>
        </div>
    </section>
</div>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.scrolly.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.scrollzer.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/skel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>