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
        /*thead {*/
        /*    color: #567ec4;*/
        /*    line-height: 1.5;*/
        /*    text-align: justify;*/
        /*    font-weight: bold;*/
        /*    padding: 3px;*/
        /*    border-color: black;*/
        /*}*/
        table {
            color: #567ec4;
            line-height: 1.5;
            text-align: justify;
            font-weight: bold;
            padding: 3px;
            border-color: black;
        }

        td {
            color: #567ec4;
            line-height: 1.5;
            text-align: justify;
            font-weight: bold;
            padding: 3px;
            border-color: black;
        }
    </style>
    <title>the BOOK</title>

</head>
<br>

<body id="test">
<form method="POST" action="MainPageServlet">
    <div id="div">
        <a href="MainPageServlet">Главная страница</a>
        <a href="BookInfoServlet">About</a>
        <a href="ContactServlet">Контакты</a>
        <a href="LoginServlet">Вход</a>
        <a href="RegisterServlet">Регистрация</a>
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
    <h2>Book Store Checkout Page</h2>

    <c:if test="${not empty cart.items}">
        <table class="table table-striped">
            <thead>
            <th>Title</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total Price</th>
            <th></th>
            </thead>
            <tbody>
            <c:forEach var="item" items="${cart.items}">
                <form method="POST" action="CartController">
                    <tr style="text-align: left">
                        <td>
                            ${item.title}
                            ${item.price}
                        </td>
                        <td>
                            <input type="hidden" name="bookID" value="${item.bookID}">
                            <input type="text" name="updateQuantity" size="2" value="${item.quantity}">

                            <input type="submit" value="Update">
                        </td>

                        <td>${item.title}</td>
                        <td><fmt:formatNumber value="${item.price}" type="currency"></fmt:formatNumber></td>
                        <td><fmt:formatNumber value="${item.totalPrice}" type="currency"></fmt:formatNumber></td>
                        <td><input type="submit" name="remove" value="Remove"></td>
                    </tr>
                </form>

            </c:forEach>

            </tbody>
        </table>


        <h3>Total price of all items: ${cart.items.stream().map(i -> i.totalPrice).sum()} </h3>
        <input type="submit" class="btn btn-sucess" value="Checkout"></input>
        <button class="btn btn-sucess"><a href="MainPageServlet">Continue Shopping</a></button>

    </c:if>
    <c:if test="${empty cart.items}">
        <h4>Sorry, you haven't placed any order yet. Back to the home page to browse more books.</h4>
    </c:if>
</div>
<div id="footer">
    Все права защищены &copy;
</div>
</body>
</html>
