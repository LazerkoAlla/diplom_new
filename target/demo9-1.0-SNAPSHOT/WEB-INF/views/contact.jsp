<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
    <link rel="stylesheet" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/themes/sunny/jquery-ui.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <style>
        /* Кнопка выпадающего списка */
        .dropbtn {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            font-size: 20px;
            border: none;
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
            background-color: #f1f1f1;
            min-width: 200px;
            /*box-shadow: 0px 10px 16px 0px rgba(0,0,0,0.2);*/
            z-index: 1;
        }

        /* Ссылки внутри выпадающего списка */
        .dropdown-content a {
            color: black;
            padding: 25px;
            text-decoration: none;
            /*display: block;*/
        }

        /* Изменение цвета выпадающих ссылок при наведении курсора */
        /*.dropdown-content a:hover {background-color: #ddd;}*/

        /* Показать выпадающее меню при наведении курсора */
        .dropdown:hover .dropdown-content {
            display: block;
            padding: 20px 20px;
        }

        /* Изменение цвета фона кнопки раскрывающегося списка при отображении содержимого раскрывающегося списка */
        .dropdown:hover .dropbtn {background-color: #3e8e41;}
    </style>
    <script>
        $( function() {
            $( "#accordion" ).accordion();
        } );
    </script>
    <title>the Book</title>
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

    <H3> Вы можете связаться с нами по следующим телефонам: </H3>
    <div id="accordion">
        <h3>     A1</h3>
        <div>
            <p>
                     +375299895468
            </p>
        </div>
        <h3>     Life :) </h3>
        <div>
            <p>
                     +375257371482
            </p>
        </div>
        <h3>     МТС </h3>
        <div>
            <p>
                +375296744607
            </p>
        </div>
    </div>


<div id="footer">
    Все права защищены &copy;
</div>
</body>
</html>