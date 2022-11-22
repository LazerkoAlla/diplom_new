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
    <title> Title</title>

    <!-- Bootstrap core CSS -->
    <link href="webjars/bootstrap/4.3.1/css/bootstrap.min.css"
          rel="stylesheet">


</head>
<body id="test">

<br>

<form method="POST" action="MainPageServlet">
    <div id="div">
        <a href="MainPageServlet">Главная страница</a>
        <a href="BookInfoServlet">About</a>
        <a href="ContactServlet">Контакты</a>
        <a href="ShoppingCardServlet">Корзина</a>
        <a href="LogoutServlet">Выход</a>
        <input id="input" name="title" type="text" placeholder="Поиск"/>
    </div>
</form>

<br>
<form name="pass" method="post" action="PersonalDataServlet">
    <p><b>Изменить пароль:</b><br>
    <p><b>Введите логин:</b>
        <input type="text" size="40">
    <p><b>Введите новый пароль:</b>
        <input type="text" size="40">
    </p>
    <input type="submit" value="Изменить" />
</form>


</form>
Изменить пароль
<p><font color="red">${errorMessage}</font></p>
<form method="POST" action="PersonalDataServlet"> Измените пароль :
    <p> Введите пароль <input name="LoginName" type="text" /> </p>
    <p> Введите логин <input name="newPassword" type="text" /> </p>
    <input name="add" type="submit" />
</form>

</div>
<div id="footer">
    Все права защищены &copy;
</div>
</body>
</html>



