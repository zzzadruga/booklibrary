<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<c:url var="firstUrl" value="/books/list?p=1#list" />
<c:url var="lastUrl" value="/books/list?p=${totalPages}#list" />
<c:url var="prevUrl" value="/books/list?p=${currentIndex - 1}#list" />
<c:url var="nextUrl" value="/books/list?p=${currentIndex + 1}#list" />
<!DOCTYPE HTML>
<html>
<head>
    <title>Книжная полка</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
    <link href="data:image/x-icon;base64,AAABAAEAEBAAAAEACABoBQAAFgAAACgAAAAQAAAAIAAAAAEACAAAAAAAAAEAAAAAAAAAAAAAAAEAAAAAAAAAAAAAWX29AFF1lABwqs4AJiDJAD1OVwAoKMYAZHeIAGh9fwBsfX8AU2uAAC4u2AACAwEAf7nXAIObogAGBAQAY3B0ACg0OAA2NdsAhb7dAHiOhQAJBhMAAw0fACAhJACUwNEALVJ/AFBkdQCOwuAAiqi3ACUmKgAvPVMAfLXVACQnNgBvhIMALzXKAH641QBspMcASk7VAEZZcAA1N9AAdYiPABs1aQAwOTYAk8XYAFZsagB8mJsAIiouAHq41gApQ10AgrDQAHu41gCKjpgAXIurADI11ABwpsUAhLzZADxNTgA4N9oAdqvCADo51wBflroALjc6AC83OgA6P9cAeZGQACgryQBRhKkAQVFaAGx/dgB/lZwALS7SAH2XogBnp8kAkLC/AD1GQwAxNNsAgbzaAJiyvAApTXMAcq/PAEJOUgCTv9oAmMHOACkn0AAJDx8ANT1EAJSpqwAwR0cAhLXPAIK20gCBt9UABAICAIOcoABzorsAhLrVAFqTswAxNDwAiqiyAH2RkgAtL7wAk8beAEFF2QB+lJsAV4qrAIOWmACVyOQALzHUAH253ABKUdAAVXaCAEx3lwCHt9YAZZKxACo8OgAoLsMAKibPAI3E4gBahKMAe5WfAC0t0gDr+fcAfLfXADJDTwBhjZoAgbfXAHGEiABKepgAcYiLAEdiYwBtpskAJR2+AHCLlAB1ipEAh6OlAGWTtQBodYAAFSU/AGyTtQB3kqAAobrOACwv0AAwLNkAf5mjAIC40gCBudUAAwQCAGepygCAuNsAaKfNADlMUACMnqAAZZSwAFFfbQB5kZUAQ1BTAFZrbQAdKDcANll3AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAeAAAAAAAAAAAAAAAX0hVg0dhYxUGUIFUFgAAV09nECuZlnI/apFrG5IAAHEvNkktQChBjEsMcCMNAAAqMlhFRFaVBHcLD4ZvaQAAPpA6ByyEOIJGjVt5UVkAAENaXRQcTQhzNVMdkzd8AAAwXnUYXAptASISPTRkfgAAAo97fYWLGp07OWAfdJcAAIlMjiGamIeIJ2WcJDFuAABCE4BoZlKbHmwlD5QDPAAAJk4RYg5/SgAAAAApGRcAAAAAAAl2igUAAAAAAAAAAAAAAAAgLnozAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP3/AADAAQAAgAEAAIABAACAAQAAgAEAAIABAACAAQAAgAEAAIABAACAAQAAgPEAAPD/AADw/wAA//8AAP//AAA=" rel="icon" type="image/x-icon" />
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
            <form:form action="/books/search" method="GET">
                <div class="row">
                    <div class="8u 12u"><input type="text" name="s" placeholder="Поиск по автору и названию книги" /></div>
                    <div class="4u 12u"><input type="submit" value="Найти" /></div>
                </div>
            </form:form>
            <br>
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
            <div class="pagination">
                <ul>
                    <c:choose>
                        <c:when test="${currentIndex == 1}">
                            <a href="#">&lt;&lt;</a>
                            <a href="#">&lt;</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${firstUrl}">&lt;&lt;</a>
                            <a href="${prevUrl}">&lt;</a>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach var="i" begin="${beginIndex}" end="${endIndex}">
                        <c:url var="pageUrl" value="/books/list?p=${i}#list" />
                        <c:choose>
                            <c:when test="${i == currentIndex}">
                                <a href="${pageUrl}" style="background-color: #c0d5d4;"><c:out value="${i}" /></a>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageUrl}"><c:out value="${i}" /></a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${currentIndex == totalPages}">
                            <a href="#">&gt;</a>
                            <a href="#">&gt;&gt;</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${nextUrl}">&gt;</a>
                            <a href="${lastUrl}">&gt;&gt;</a>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
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