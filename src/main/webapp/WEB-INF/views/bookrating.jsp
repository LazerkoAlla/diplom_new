<%--
  Created by IntelliJ IDEA.
  User: lazer
  Date: 14.10.2022
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p><font color="red">${bookMessage}</font></p>
<table border="1">
    <caption>Список книг</caption>
    <%--    в принципе он все показывает и без таблицы --%>
    <tr>
        <th>название</th>
        <th>избн</th>
        <th>жанр</th>
        <th>цена</th>
        <th>оценка</th>
    </tr>

    <c:forEach items="${group}" var="book">
        <tr>
            <td>${book.title}</td>
            <td>  ${book.isbn}</td>
            <td>  ${book.genre}</td>
            <td>  ${book.price}</td>
            <td>  ${book.rating}</td>


                <%--            <td>${author.authorID}</td>--%>

        </tr>
    </c:forEach>

    </td>
    </td>

</table>
</body>
</html>