<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" type="text/html" href="css/styles.css" />
    <link rel="stylesheet" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/themes/sunny/jquery-ui.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <style>


        #wrapper { /* основной див с контентом*/

            width: 90%;
            position: relative; /* Фиксированное положение */
            left: 0;  /* Левый нижний угол */
            /*padding: 50px 50px; !* Поля вокруг текста *!*/

            height: 77%;
            opacity: 0.8;

            font-size: 15px;
            font-weight: bold;
            align-items:center;
            flex-wrap:wrap;
            /*margin-top: 5%;*/
            /*margin-bottom: 5%;*/
            margin-right: 5%;
            margin-left: 5%;
            display: flex;
            justify-content: center;
            align-items: center;
            align-content: center;
            border-radius: 5px;
            border: 2px solid #999;

        }
        .block {
            width: 25%;
            height: 28%;
            text-align: justify;
            line-height: 100px;
            border-radius: 10px;
            margin: 15px;
            margin-bottom: 15px;
            margin-top: 15px;

            background-color: whitesmoke;
            opacity: 1.0;
            color:#567ec4;

        }

        #links{
            position: absolute; /* Фиксированное положение */
            left: 0; bottom: 110px; /* Левый нижний угол */
            padding: 10px; /* Поля вокруг текста */
            background: whitesmoke; /* Цвет фона */
            color: #fff; /* Цвет текста */
            /*width: 50%; !* Ширина слоя *!*/
            height: 40px;
            opacity: 0.8;
            color:#567ec4;
            font-size: 15px;
            /*font-style: italic;*/
            font-weight: bold;
            display:flex;
            justify-content:center;
            align-items:center;
            /*flex-wrap:wrap;*/
            top:82%;
            left:45%;
            right: 45%;
        }
        /* Кнопка выпадающего списка */
        .dropbtn {
            background-color: whitesmoke;
            font-size: 16px;
            font-weight: bold;
            color: #567ec4;
            /*!*opacity: 0.8;*!*/
            padding: 12px;  /* ширина блока */
            border: none;
            text-decoration: none;
            margin-top: -25px;
            text-align: justify;
        }

        /* Контейнер <div> - необходим для размещения выпадающего содержимого */
        .dropdown {
            position: relative;
            display: inline-block;
        }

        /* Выпадающее содержимое (скрыто по умолчанию) */
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: whitesmoke;
            opacity: 0.8;
            min-width: 200px;
            /*box-shadow: 0px 10px 16px 0px rgba(0,0,0,0.2);*/
            z-index: 1;
        }

        /* Ссылки внутри выпадающего списка */
        .dropdown-content a {
            padding: 25px;
            text-decoration: none;
            /*display: block;*/
            color: #567ec4;
        }

        /*Изменение цвета выпадающих ссылок при наведении курсора */
        .dropdown-content a:hover {color: #cc3333; border-bottom-style: solid; border-bottom-color: #cc3333;}

        /* Показать выпадающее меню при наведении курсора */
        .dropdown:hover .dropdown-content {
            display: block;
            padding: 20px 20px;
        }

        /* Изменение цвета фона кнопки раскрывающегося списка при отображении содержимого раскрывающегося списка */
        .dropdown:hover .dropbtn {color: #cc3333; border-bottom-style: solid; border-bottom-color: #cc3333;font-weight: bold;}

        img {
            width: 80%; /* or any custom size */
            height: 80%;
            object-fit: contain;
        }
        h2{

            margin: 15px;
            color: #567ec4;
            line-height: 1.5;
            text-align: justify;

        }
        .h1block {
            width: 20%;
            height: 20%;
            text-align: center;
            /*line-height: 100px;*/
            border-radius: 10px;
            /*border: 2px solid darkgreen;*/
            margin: 2px;
            background-color: whitesmoke;
            opacity: 1.0;
            /*margin-bottom: 15px;*/
            /*margin-top: 15px;*/
            /*align-items: center;*/
        }
        img {
            width: 100px;
            height: 220px;
            float: left;
            margin-bottom: 30px;
            margin-left: 20px;

        }
    </style>
    <title>the BOOK</title>
    <h1>the BOOK</h1>
<br>
    <form method="POST" action="MainPageServlet">
    <div id="div">
        <a href="MainPageServlet">Главная страница</a>
<%--        <a href="BookInfoServlet">About</a>--%>
        <a href="CartController">Корзина</a>
        <a href="ContactServlet">Контакты</a>
        <a href="LoginServlet">Вход</a>
        <a href="RegisterServlet">Регистрация</a>
        <a href="AdminPanelServlet">Админ панель</a>
<%--        поменяла--%>
        <input id="input" name="title" type="text" placeholder="Поиск"/>
<%--        <%@include file="adminPage.jsp"%>--%>
    </div>
    </form>
</head>
<body id="test">



<div class="dropdown">
    <button class="dropbtn">Каталог</button>
    <div class="dropdown-content">
        <a href="MainPageServlet?genre=children">Детская литература</a>
        <a href="MainPageServlet?genre=detective">Детективы</a>
        <a href="MainPageServlet?genre=novel">Романы</a>
        <a href="MainPageServlet?genre=education">Образование</a>
        <a href="MainPageServlet">Все книги</a>
    </div>
</div>

<%--<div class="wrapper">--%>
<%--    <c:if test="${books.size() == 0}">--%>
<%--        Sorry, no books found:(--%>
<%--    </c:if>--%>
<%--    <c:forEach items="${books}" var="book">--%>
<%--        <div class="my_boks1">--%>
<%--            <a href="BookDetailsServlet?id=${book.bookID}">${book.title}</a>--%>
<%--        </div>--%>
<%--    </c:forEach>--%>
<%--</div>--%>

<div id="wrapper">
    <c:if test="${books.size() == 0}">
        <div class="h1block">
            <h2> Sorry, no books found... Please search again. </h2>
        </div>
    </c:if>
    <c:forEach items="${books}" var="book">
        <div class="block">
            <img src="${book.imageURL}">
            <a href="BookDetailsServlet?id=${book.bookID}">${book.title}</a>

        </div>
    </c:forEach>

</div>

<div id="footer">
    Все права защищены &copy;
</div>
</body>
</html>

