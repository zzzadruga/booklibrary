<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <li><a href="#main" id="main-link" class="skel-layers-ignoreHref"><span class="icon fa-star">Главная</span></a></li>
                <li><a href="#list" id="book-list-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Книги</span></a></li>
                <li><a href="#add" id="add-book-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Добавить</span></a></li>
                <li><a href="#edit" id="edit-book-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Редактировать</span></a></li>
            </ul>
        </nav>
    </div>
</div>
<div id="main">
    <section id="list" class="one dark cover">
        <div class="container">
            <header>
                <h2>CRUD</h2>
            </header>
            <p>У вас есть всего 1 таблица book. В ней хранится список книг (например, на книжной полке). Книги на полку можно добавлять (create), брать посмотреть (read), заменять на новый выпуск (update), убирать (delete).</p>
        </div>
    </section>
    <section id="bookslist" class="three">
        <div class="container">
            <header>
                <h2>Список книг</h2>
            </header>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Название</th>
                    <th>Краткое описание</th>
                    <th>Автор</th>
                    <th>ISBN</th>
                    <th>Дата печати</th>
                    <th>Прочтена?</th>
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
    </section>

    <section id="add" class="four">
        <div class="container">
            <header>
                <h2>Добавление</h2>
            </header>
            <br>
            <form:form modelAttribute="bookModel" method="post" action="/books/addBook">
                <div class="row">
                    <div class="6u 12u">
                        <form:select name="id" path="id">
                            <c:forEach var="book" items="${bookslist}">
                                <form:option value="${book.id}">${book.title}</form:option>
                            </c:forEach>
                        </form:select>
                    </div>
                    <div class="6u 12u"><form:input path="title" placeholder="Название" type="text"/></div><br>
                    <div class="6u 12u"><form:input path="author" placeholder="Автор" type="text"/></div><br>
                    <div class="6u 12u"><form:input path="isbn" placeholder="ISBN" type="text"/></div><br>
                    <div class="6u 12u"><form:input path="printYear" placeholder="Год издания" type="text"/></div><br>
                    <div class="6u 12u"><form:input path="readAlready" placeholder="Прочтена?" type="text"/></div><br>
                    <div class="12u 12u"><form:textarea path="description" placeholder="Описание" type="text"></form:textarea></div><br>
                    <div class="12u"><button>Добавить</button></div>
                </div>
            </form:form>
        </div>
    </section>
    <%--<section id="edit" class="four">
        <div class="container">
            <header>
                <h2>Редактирование</h2>
            </header>
            <div class="add-value">Выберите книгу из левого списка для редактирования</div>
            <br>
            <form modelAttribute="bookModel" method="post" action="/books/addBook">
                <div class="row">
                    <div class="6u 12u">
                        <select name="title">
                            <c:forEach var="book" items="${bookslist}">
                                <option value="${book.id}">${book.title}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="6u 12u"><form:input path="title" placeholder="Новое название" type="text"/></div><br>
                    <div class="6u 12u"><form:input path="isbn" placeholder="ISBN" type="text"/></div><br>
                    <div class="6u 12u"><form:input path="printYear" placeholder="Год издания" type="text"/></div><br>
                    <div class="12u 12u"><form:textarea path="description" placeholder="Описание" type="text"></form:textarea></div><br>
                    <div class="12u"><button>Обновить</button></div>
                </div>
            </form>
        </div>
    </section>--%>
</div>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.scrolly.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.scrollzer.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/skel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>