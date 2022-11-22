<%--
  Created by IntelliJ IDEA.
  User: lazer
  Date: 01.10.2022
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>the BOOK</title>
<%--    <link rel="stylesheet" type="text/css" href="css/div.css" />--%>
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
    <link rel="stylesheet" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/themes/sunny/jquery-ui.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
        $( function() {
            $( "#resizable" ).resizable();
        } );
    </script>

</head>
<style>

    #div1 {
        width: auto;
        height: 40px;
        position: -ms-device-fixed;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        /*margin-bottom: 100px;*/
        /*margin: 80px;*/
        opacity: 0.8;
        background: ghostwhite; /* Цвет фона */
        padding: 10px; /* Поля вокруг текста */


    }
    #ri { /* основной див с контентом */

        width: 90%;
        position: relative; /* Фиксированное положение */
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
        justify-content:space-around;
        align-items:center;
        flex-wrap:wrap;
        margin-top: 5%;
        margin-bottom: 5%;
        margin-right: 5%;
        margin-left: 5%;
    }

    table {
        color: black; /* Цвет текста */
    }

    /*#footer1 {*/

    /*    position: relative; !* Фиксированное положение *!*/
    /*    left: 0; bottom: 0; !* Левый нижний угол *!*/
    /*    padding: 0px; !* Поля вокруг текста *!*/
    /*    background: whitesmoke; !* Цвет фона *!*/
    /*    color: #fff; !* Цвет текста *!*/
    /*    width: 100%; !* Ширина слоя *!*/
    /*    !*padding-bottom: 0px;*!*/
    /*    height: 50px;*/
    /*    opacity: 0.8;*/
    /*    color:#567ec4;*/
    /*    font-size: 15px;*/

    /*    font-weight: bold;*/
    /*    display:flex;*/
    /*    justify-content:space-around;*/
    /*    align-items:center;*/
    /*    flex-wrap:wrap;*/
    /*    overflow:auto;*/
    /*}*/

</style>
<body id="test">
<%--  таблицу с комментами можно удалить и написать инфу о нас типо  --%>
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

<br>
<div id="ri">
<table border="1">
    <caption>Comments</caption>
    <tr>
        <th>Comment</th>
    </tr>

<%--    <form method="POST" action="DeleteCommentServlet">--%>
    <c:forEach items="${commentText}" var="review">
        <tr>
            <td>${review.commentText}
<%--                <input name="update" type="submit" value="delete" action="DeleteCommentServlet"/>--%>
            <button formmethod="post" formaction="DeleteCommentServlet" items="${commentText}">
                del</button>
            </td>


        </tr>
    </c:forEach>

<%--    </form>--%>

</table>

<p><font color="red">${errorMessage}</font></p>
<form method="POST" action="BookInfoServlet"> Новый :
    <p> Введите текст <input name="commentText" type="text" /> </p>
    <input name="add" type="submit" />
</form>


<%--<div>--%>
<%--    <form method="POST" action="DeleteCommentServlet"> удалить :--%>
<%--        <p> Введите иd <input name="commentText" type="text" /> </p>--%>
<%--        <input name="delete" type="submit" />--%>
<%--    </form>--%>
<%--</div>--%>





<%--    <div class="comments-block">--%>
<%--        <section class="s-line s-product-feedbacks" id="feedbacks">--%>
<%--            <div class="container">--%>
<%--                <div class="w-product-feedbacks">--%>
<%--                    <div class="row">--%>
<%--                        <div class="col-xl-5 col-lg-10 col-md-12">--%>
<%--                            <form class="w-user-feedback-form">--%>
<%--                                <input type="hidden" name="_token" value="tpO57b9JK6hd24TISh4fkApOeL8Cr31OFPLnFPMC" style="border: 1px solid rgb(202, 202, 202);">--%>
<%--                                <input type="hidden" name="comment_item_id" value="63584" style="border: 1px solid rgb(202, 202, 202);">--%>
<%--                                <input type="hidden" name="comment_content_type" value="product" style="border: 1px solid rgb(202, 202, 202);">--%>
<%--                                <div class="section-name _h3 margin-bottom-10">Оставьте ваш отзыв</div>--%>
<%--                                <div class="row row-short-gutters">--%>
<%--                                    <div class="col-md-12 col-12">--%>
<%--                                        <div class="input margin-bottom-10 label-top">--%>
<%--                                            <label>Ваше имя<span class="red">*</span></label>--%>
<%--                                            <input type="text" class="input__default" name="comment_name" value="" placeholder="" style="border: 1px solid rgb(202, 202, 202);">--%>
<%--                                        </div>--%>
<%--                                        <div class="input margin-bottom-10 label-top" style="display: none;">--%>
<%--                                            <label>Заголовок отзыва<span class="red">*</span></label>--%>
<%--                                            <input type="text" class="input__default" name="comment_title" value="Отзыв" placeholder="" style="border: 1px solid rgb(202, 202, 202);">--%>
<%--                                        </div>--%>
<%--                                        <div class="input margin-bottom-10 label-top">--%>
<%--                                            <label>Оценка<span class="red">*</span></label>--%>
<%--                                            <input type="hidden" name="comment_stars" value="5" style="border: 1px solid rgb(202, 202, 202);">--%>
<%--                                            <div class="stars d_stars">--%>
<%--                                                <div class="star active"><i class="fa fa-star" aria-hidden="true"></i></div>--%>
<%--                                                <div class="star active"><i class="fa fa-star" aria-hidden="true"></i></div>--%>
<%--                                                <div class="star active"><i class="fa fa-star" aria-hidden="true"></i></div>--%>
<%--                                                <div class="star active"><i class="fa fa-star" aria-hidden="true"></i></div>--%>
<%--                                                <div class="star active"><i class="fa fa-star" aria-hidden="true"></i></div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-md-12 col-12">--%>
<%--                                        <div class="input margin-bottom-10 label-top">--%>
<%--                                            <label>Отзыв<span class="red">*</span></label>--%>
<%--                                            <textarea class="textarea__default" name="comment_note" style="border: 1px solid rgb(202, 202, 202);"></textarea>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-md-12 col-12">--%>
<%--                                        <div class="input margin-bottom-10 label-top">--%>
<%--                                            <p class="margin-bottom-10">Если у вас вопрос, укажите e-mail для обратной связи.</p>--%>
<%--                                            <label>Ваш e-mail</label>--%>
<%--                                            <input type="text" class="input__default" name="comment_email" value="" placeholder="" style="border: 1px solid rgb(202, 202, 202);">--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="w-button margin-bottom-10">--%>
<%--                                    <input type="submit" class="button medium blue" id="send-comment" value="Отправить" style="border: 1px solid rgb(202, 202, 202);">--%>
<%--                                </div>--%>
<%--                            </form>--%>
<%--                        </div>--%>
<%--                        <div class="col-xl-7 col-lg-10 col-md-12 w-index-slider">--%>
<%--                            <div class="section-name _h2 margin-bottom-10">Отзывы</div>--%>
<%--                            <div class="row">--%>
<%--                                <div class="col-feedback col-12">--%>
<%--                                    <div class="no-feedbacks-description">--%>
<%--                                        У этого товара ещё нет отзывов.<br>--%>
<%--                                        Будьте первыми, кто оставит отзыв!--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </section>--%>

<%--    </div>--%>




<p><font color="red">${errorMessage}</font></p>
<form method="POST" action="InfoServlet"> Новый :
    <p> Введите текст <input name="title" type="text" /> </p>
    <input name="add" type="submit" />
</form>
<form action="InfoServlet" method="post">

    <table border="1">
        <caption>book</caption>
        <tr>
            <th>book</th>
        </tr>

        <c:forEach items="${title}" var="book">
            <tr>
                <td>${book.title}</td>

            </tr>
        </c:forEach>

        </td>
        </td>

    </table>
</form>

<div id="footer">
    Все права защищены &copy;
</div>

</body>
</html>
