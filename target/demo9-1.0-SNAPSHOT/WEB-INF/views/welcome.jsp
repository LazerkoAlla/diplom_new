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

<%--  <style>--%>
<%--    body {--%>
<%--      /*background-image: url(images/bg.jpg);  Путь к фоновому изображению */--%>
<%--      background-color: #c7b39b; /* Цвет фона */--%>
<%--    }--%>
<%--    .footer {--%>
<%--      position: absolute; bottom: 0;--%>
<%--      width: 100%;--%>
<%--      height: 60px;--%>
<%--      background-color: #f5f5f5;--%>
<%--    }--%>

<%--    .footer .container {--%>
<%--      width: auto;--%>
<%--      max-width: 680px;--%>
<%--      padding: 0 15px;--%>
<%--    }--%>

<%--    #footer {--%>

<%--      position: fixed; /* Фиксированное положение */--%>
<%--      left: 0; bottom: 0; /* Левый нижний угол */--%>
<%--      padding: 10px; /* Поля вокруг текста */--%>
<%--      background: whitesmoke; /* Цвет фона */--%>
<%--      color: #fff; /* Цвет текста */--%>
<%--      width: 100%; /* Ширина слоя */--%>
<%--      height: 40px;--%>
<%--      opacity: 0.8;--%>
<%--      color:#567ec4;--%>
<%--      font-size: 15px;--%>
<%--      /*font-style: italic;*/--%>
<%--      font-weight: bold;--%>
<%--      display:flex;--%>
<%--      justify-content:space-around;--%>
<%--      align-items:center;--%>
<%--      flex-wrap:wrap;--%>
<%--    }--%>
<%--  </style>--%>

</head>
<body id="test">

<br>

  <form method="POST" action="MainPageServlet">
  <div id="div">
    <a href="MainPageServlet">Главная страница</a>
<%--    <a href="BookInfoServlet">About</a>--%>
    <a href="ContactServlet">Контакты</a>
    <a href="ShoppingCardServlet">Корзина</a>
    <a href="PersonalDataServlet">Изменить личные данные</a>
    <a href="LogoutServlet">Выход</a>
    <input id="input" name="title" type="text" placeholder="Поиск"/>
  </div>
  </form>


<div id="ri">

  <H2>Добро пожаловать, ${name}!</H2>

  <table border="1" bgcolor="black" >
    <caption>Список авторов</caption>
    <tr>
      <th>Имя</th>
      <th>Телефон</th>
    </tr>

    <c:forEach items="${group}" var="author">
      <tr>

        <td>${author.firstName}</td>
        <td>  ${author.lastName}</td>


      </tr>
    </c:forEach>


  </table>

  <p><font color="red">${errorMessage}</font></p>
  <form method="POST" action="GroupListServlet"> Новый автор :
    <p> Введите иd <input name="authorID" type="text" /> </p>
    <p> Введите имя <input name="firstName" type="text" /> </p>
    <p> Введите фамилию <input name="lastName" type="text" /> </p>
    <input name="add" type="submit" />
  </form>

<div>
  <form method="POST" action="GroupListServlet"> удалить :
    <p> Введите иd <input name="authorID" type="text" /> </p>
    <input name="delete" type="submit" />
  </form>
</div>

<div>
  <form method="POST" action="GroupListServlet"> Изменить :
    <p> измените имя <input name="firstName" type="text" /> </p>
    <p> измените иd <input name="authorID" type="text" /> </p>
    <input name="update" type="submit" />
  </form>
</div>

</div>
<div id="footer">
  Все права защищены &copy;
</div>
</body>
</html>


