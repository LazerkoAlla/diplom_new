<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="by.iba.model.Cart"%>
<%@page import="by.iba.model.LineItem"%>
<html>
<head>
    <title>Book Details</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
    <style>

        #ri { /* основной див с контентом */

            width: 90%;
            position: relative;
            display: flex;
            flex-wrap: wrap;
            left: 0;
            background: whitesmoke;
            color: #fff;

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
        .block {
            width: 30%;
            height: 70%;
            text-align: center;
            line-height: 100px;
            border-radius: 10px;
            border: 2px solid darkgreen;
            margin: 15px;
            margin-bottom: 15px;
            margin-top: 15px;
            align-items: center;
        }
        p{
            margin: 15px;
            color: #567ec4;
            line-height: 1.5;
            text-align: justify;
        }
        td {
            color: #567ec4;
            line-height: 1.5;
            text-align: justify;
            font-weight: bold;
            padding: 3px;
        }
        img {
            width: 250px;
            height: 400px;
            padding: 20px;
        }

    </style>

    <br>

    <form method="POST" action="MainPageServlet">
        <div id="div">
            <a href="MainPageServlet">Главная страница</a>
            <a href="CartController">Корзина</a>
            <a href="ContactServlet">Контакты</a>
<%--            <a href="LoginServlet">Вход</a>--%>
            <a href="LogoutServlet">Выход</a>
            <a href="PersonalDataServlet">Изменить личные данные</a>
            <input id="input" name="title" type="text" placeholder="Поиск"/>
        </div>
    </form>
</head>

<body id="test">
    <div id="ri">
        <div class="block">
            <img src="${book.imageURL}">

            <jsp:useBean id="cart" scope="session" class="by.iba.model.Cart"></jsp:useBean>
            <c:if test="${cart.items.stream().filter(item -> item.bookID == book.bookID).count() > 0}">
                <br>
                Added to cart
            </c:if>
            <c:if test="${cart.items.stream().filter(item -> item.bookID == book.bookID).count() == 0}">
                <form action="BookDetailsServlet?id=${book.bookID}" method="post">
                    <button type="submit" name="addBookToCart" value="${book.bookID}">Добавить в корзину</button>
                </form>
            </c:if>
        </div>
        <div class="block">
            <H3>${book.title}</H3>
            <p>Жанр: ${book.genre}</p>
            <p>Стоимость: ${book.price}</p>
            <p>${book.description}</p>
            <p>Рейтинг: ${book.rating}</p>

        </div>
        <div class="block">

            <form action="BookDetailsServlet?id=${book.bookID}" method="post">
                <p> </p>
                <p> </p>
                <p><b>Вы можете добавить рейтинг к этой книге!</b><br><br>
                    <input type="text" size="1" name="userRating" value="${userRating}">
                    <button type="submit">Добавить</button>
            </form>
            <form action="BookDetailsServlet?id=${book.bookID}" method="post">
                <p><b>Вы можете добавить отзыв к этой книге!</b><br><br>
                <input type="text" size="40" name="comment">
                <button type="submit" name="input">Добавить</button>
            </form>
            <p><b>Отзывы читателей: </b><br>
            <form action="BookDetailsServlet?id=${book.bookID}" method="post">
                <table>
                    <c:forEach items="${reviews}" var="review">
                        <tr>
                            <td><c:out value="${review.reviewerName}" /></td>
                            <td><c:out value="${review.commentText}" /></td>
                            <td><button type="submit" name="delete" value="${review.reviewID}">Удалить</button></td>
                        </tr>
                    </c:forEach>
                </table>
            </form>
        </div>
    </div>

    <div id="footer">
        Все права защищены &copy;
    </div>

</body>
</html>
