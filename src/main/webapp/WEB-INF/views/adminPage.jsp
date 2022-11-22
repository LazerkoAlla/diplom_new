<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css"  content="text/html" href="css/styles.css" />
    <link rel="stylesheet" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/themes/sunny/jquery-ui.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <style>

        #ri { /* основной див с контентом */

            width: 90%;
            position: relative; /* Фиксированное положение */
            display: flex;
            flex-wrap: wrap;
            left: 0;  /* Левый нижний угол */
            /*padding: 50px 50px; !* Поля вокруг текста *!*/
            background: whitesmoke; /* Цвет фона */
            color: #fff; /* Цвет текста */

            height: 77%;
            opacity: 0.8;
            color:#567ec4;
            font-size: 15px;
            /*font-style: italic;*/
            font-weight: bold;
            /*display: flex;*/
            justify-content:center;
            align-items:center;
            margin-top: 5%;
            margin-bottom: 5%;
            margin-right: 5%;
            margin-left: 5%;
        }

        .block1 {
            width: 25%;
            height: 80%;
            /*text-align: center;*/
            line-height: 100px;
            border-radius: 10px;
            border: 2px solid darkgreen;
            margin: 15px;
            /*margin-bottom: 15px;*/
            /*margin-top: 15px;*/
            /*align-items: center;*/

        }
        .block {
            width: 30%;
            height: 80%;
            text-align: center;
            /*line-height: 100px;*/
            border-radius: 10px;
            border: 2px solid darkgreen;
            margin: 15px;
            /*margin-bottom: 15px;*/
            /*margin-top: 15px;*/
            /*align-items: center;*/
        }
        .block12 {
            width: 25%;
            height: 80%;
            text-align: center;
            /*line-height: 100px;*/
            border-radius: 10px;
            border: 2px solid darkgreen;
            margin: 15px;
            /*margin-bottom: 15px;*/
            /*margin-top: 15px;*/
            /*align-items: center;*/
        }
        p{

            margin: 15px;

            line-height: 1.2;
            text-align: justify;
        }
        table{
            color: #567ec4;
            line-height: 1.2;
            text-align: justify;
            font-weight: bold;
            padding: 10px;
        }
    </style>
    <title>Admin Panel</title>
</head>
<br>

<body id="test">
    <form method="POST" action="MainPageServlet">
        <div id="div">
            <a href="MainPageServlet">Главная страница</a>
        </div>
    </form>

    <div id="ri">
        <div class="block1">
    <form method="post" action="AdminPanelServlet">
        <p><b>Title</b><br>
            <input type="text" size="40" name="title">
        </p>
        <p><b>ISBN</b><br>
            <input type="text" size="40" name="isbn">
        </p>
        <p><b>Genre</b><br>
            <input type="text" size="40" name="genre">
        </p>
        <p><b>Price</b><br>
            <input type="text" size="40" name="price">
        </p>
        <p><b>Rating</b><br>
            <input type="text" size="40" name="rating">
        </p>
        <p><b>Image</b><br>
            <input type="text" size="40" name="imageURL">
        </p>
        <p><b>Description</b><br>
            <input type="text" size="40" name="description">
        </p>
        <p><input type="submit" name="add" value="Добавить">
    </form>
        </div>
        <div class="block">
    <table>
        <caption>Books</caption>
        <tr>
            <th>Title</th>
            <th>ISBN</th>
            <th>Genre</th>
            <th>Price</th>
            <th>Rating</th>
<%--            <th>Image</th>--%>
<%--            <th>Description</th>--%>
        </tr>
        <form action="AdminPanelServlet" method="post">
            <c:forEach items="${books}" var="book">
                <tr>
                    <td>${book.title}</td>
                    <td>${book.isbn}</td>
                    <td>${book.genre}</td>
                    <td>${book.price}</td>
                    <td>${book.rating}</td>
<%--                    <td>${book.imageURL}</td>--%>
<%--                    <td>${book.description}</td>--%>
                    <td><button type="submit" name="delete" value="${book.bookID}">Удалить</button></td>
                </tr>
            </c:forEach>
        </form>
    </table>
        </div>
        <div class="block12">
    <table>
        <caption>Users</caption>
        <tr>
            <th>Login</th>
            <th>First Name</th>
            <th>Last Name</th>
        </tr>
        <form action="AdminPanelServlet" method="post">
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.login}</td>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <input type="text" name="id" value="${user.id}" hidden>
                    <c:if test="${user.blocked}">
                        <td><button type="submit" name="block" value="${!user.blocked}">Разблокировать</button></td>
                    </c:if>
                    <c:if test="${!user.blocked}">
                        <td><button type="submit" name="block" value="${!user.blocked}">Заблокировать</button></td>
                    </c:if>
                </tr>
            </c:forEach>
        </form>
    </table>
        </div>
    </div>
    <div id="footer">
        Все права защищены &copy;
    </div>
</body>
</html>
