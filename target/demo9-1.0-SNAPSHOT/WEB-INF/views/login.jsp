<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
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
            margin-top: 5%;
            margin-bottom: 5%;
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
            width: 35%;
            height: 45%;
            text-align: center;
            line-height: 100px;
            border-radius: 10px;
            margin: 15px;
            /*margin-bottom: 15px;*/
            /*margin-top: 15px;*/
            align-items: center;
            background-color: whitesmoke;
            opacity: 0.9;
            color:#567ec4;
        }

        p{
            margin: 10px;
            line-height: 1.5;
            text-align: center;
            margin-top: 10px;
        }
        /*input{*/
        /*    margin-bottom: 0;*/
        /*    margin-top: 0;*/
        /*    !*text-align: center;*!*/
        /*    align: center;*/
        /*}*/
        h3 {
            margin-bottom: 0;
            margin-top: 0;
            text-align: center;
            line-height: 3;
        }
    </style>
    <title>the Book</title>
</head>
<body id="test">
<form method="POST" action="MainPageServlet">
<div id="div">
    <a href="MainPageServlet">Главная страница</a>
<%--    <a href="#about/">About</a>--%>
    <a href="ContactServlet">Контакты</a>
    <a href="LoginServlet">Вход</a>
    <input id="input" name="title" type="text" placeholder="Поиск"/>
</div>
</form>
<br>
<%--<div id="login">--%>

<%--        <p ><font color="red">${errorMessage}</font></p>--%>
<%--        <form action="LoginServlet" method="POST">--%>
<%--            <h3 align="center">Вход в систему</h3>--%>
<%--            <div align="center">--%>
<%--                <p>Имя пользователя</p>--%>
<%--                <input placeholder="Имя" required="" id ="username" name="name" type="text" />--%>
<%--                <p>Пароль</p>--%>
<%--                <input placeholder="Пароль" required=""id ="password" name="password" type="password" />--%>
<%--                <p> </p>--%>
<%--                <input type="submit" value="Войти" />--%>
<%--            </div>--%>
<%--        </form>--%>

<%--</div>--%>
<div id="wrapper">
    <div class="block">
        <p><font color="red">${errorMessage}</font></p>
        <form action="LoginServlet" method="POST">
            <h3 align="center">Вход в систему</h3>
            <p>Имя пользователя</p>
            <input placeholder="Имя" required="" id ="username" name="name" type="text" />
            <p>Пароль</p>
            <input placeholder="Пароль" required="" id ="password" name="password" type="password" />
            <p> </p>
            <input type="submit" value="Войти" />

        </form>
    </div>
<div id="footer">
    Все права защищены &copy;
</div>
</body>
</html>
