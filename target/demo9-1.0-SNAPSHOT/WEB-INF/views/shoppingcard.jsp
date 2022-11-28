<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
    <link rel="stylesheet" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/themes/sunny/jquery-ui.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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
            width: 90%;
            height: 90%;
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


        table {
            color: #567ec4;
            line-height: 1.5;
            font-weight: bold;
            border-color: black;
            margin: 15px;
        }
        th {
            color: #567ec4;
            line-height: 1.5;
            text-align: center;
            font-weight: bold;
            padding: 8px;
        }
        td {
            color: #567ec4;
            line-height: 1.5;
            text-align: center;
            font-weight: bold;
            padding: 8px;
        }
h2 {
    margin: 15px;
    color: #567ec4;
    line-height: 1.5;
    text-align: justify;
}

h3 {
    margin: 15px;
    color: #567ec4;
    line-height: 1.5;
    text-align: justify;
}

        h4 {
            margin: 15px;
            color: #567ec4;
            line-height: 1.5;
            text-align: justify;
        }

        #in {
            float: left;
            margin: 15px;
        }
        button {
            float: left;
            margin: 15px;
        }

    </style>
    <title>the BOOK</title>
</head>
<br>

<body id="test">
<form method="POST" action="MainPageServlet">
    <div id="div">
        <a href="MainPageServlet">Главная страница</a>
        <a href="ContactServlet">Контакты</a>
<%--        <a href="LoginServlet">Вход</a>--%>
        <a href="LogoutServlet">Выход</a>
<%--        <a href="RegisterServlet">Регистрация</a>--%>
        <input id="input" name="title" type="text" placeholder="Поиск"/>
    </div>
</form>
<div id="ri">
<%--    <table>--%>
<%--        <c:forEach items="${sessionScope.cart.getItems()}" var="lineItem">--%>
<%--            <tr>--%>
<%--                <td><c:out value="${review.reviewerName}" /></td>--%>
<%--                <td><c:out value="${review.commentText}" /></td>--%>
<%--                <td><button type="submit" name="delete" value="${review.reviewID}">Delete</button></td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>
<%--    <form name="form1" action="/MainServlet/main" method="POST">--%>
<%--        <input type="hidden" name="action" value="checking">--%>
<%--        <div class="select123">--%>
<%--            <select name="select123" onchange="document.form1.submit();">--%>
<%--                <option selected="selected" value=""></option>--%>
<%--                <option value="">1</option>--%>
<%--                <option value="">2</option>--%>
<%--                <option value="">3</option>--%>
<%--                <option value="">4</option>--%>
<%--            </select>--%>
<%--        </div>--%>
<%--    </form>--%>
    <%@page import="by.iba.model.Cart"%>
    <%@page import="by.iba.model.LineItem"%>
    <%-- if there is already a Cart bean created inside the session scope, this will not ininitiate a new object --%>
    <jsp:useBean id="cart" scope="session" class="by.iba.model.Cart"></jsp:useBean>

    <div id="ri">
        <div class="block">
    <h2>Корзина</h2>

    <c:if test="${not empty cart.items}">

        <table border="black">
            <tr><th>Название</th><th>Цена</th><th>Количество</th><th colspan="2">Удалить из корзины</th></tr>
<%--        </table>--%>
<%--        <table>--%>
<%--&lt;%&ndash;            <thead>&ndash;%&gt;--%>
<%--            <th>Title</th>--%>
<%--            <th>Price</th>--%>
<%--            <th>Quantity</th>--%>
<%--&lt;%&ndash;            <th>Total Price</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <th></th>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </thead>&ndash;%&gt;--%>
<%--            <tbody>--%>
            <c:forEach var="item" items="${cart.items}">
                <form method="POST" action="CartController">
                    <tr><td>${item.title}</td>
                        <td>${item.price}</td>
                        <td><input type="hidden" name="bookID" value="${item.bookID}">
                        <input type="text" name="updateQuantity" size="2" value="${item.quantity}">

                        <input type="submit" value="Добавить"></td>

                        <td>${item.title}</td>
<%--                        <td><fmt:formatNumber value="${item.price}" type="currency"></fmt:formatNumber></td>--%>
<%--                        <td><fmt:formatNumber value="${item.totalPrice}" type="currency"></fmt:formatNumber></td>--%>
                        <td><input type="submit" name="remove" value="Удалить из корзины"></td>


                    </tr>
<%--                    <tr style="text-align: left">--%>
<%--                        <td>--%>
<%--                            ${item.title}--%>
<%--                            ${item.price}--%>
<%--                        </td>--%>
<%--                        <td>--%>
<%--                            <input type="hidden" name="bookID" value="${item.bookID}">--%>
<%--                            <input type="text" name="updateQuantity" size="2" value="${item.quantity}">--%>

<%--                            <input type="submit" value="Добавить">--%>
<%--                        </td>--%>
<%--<p> </p>--%>
<%--                        <td>${item.title}</td>--%>
<%--                        <td><fmt:formatNumber value="${item.price}" type="currency"></fmt:formatNumber></td>--%>
<%--                        <td><fmt:formatNumber value="${item.totalPrice}" type="currency"></fmt:formatNumber></td>--%>
<%--                        <td><input type="submit" name="remove" value="Удалить из корзины"></td>--%>
<%--                    </tr>--%>
                </form>

            </c:forEach>

<%--            </tbody>--%>
        </table>


        <h3>Итоговая цена: ${cart.items.stream().map(i -> i.totalPrice).sum()} </h3>
            <form method="POST" action="MainPageServlet">
                <input id="in" type="submit" name="remove" value="Обратно к покупкам">
            </form>
<%--        <button class="btn btn-sucess"></button>--%>

<%--            <a href="MainPageServlet">Обратно к покупкам</a>--%>
        <p> </p>
        <input type="submit" id="in" value="Перейти к олате">
    </c:if>
    <c:if test="${empty cart.items}">
        <h4>Корзина пуста. Вернитесь на главную страницу, чтобы просмотреть другие книги.</h4>
    </c:if>
</div>
    </div>

<div id="footer">
    Все права защищены &copy;
</div>
</body>
</html>
