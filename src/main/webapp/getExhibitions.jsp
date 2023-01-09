<%@ page import="entity.Client" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Exhibition" %><%--
  Created by IntelliJ IDEA.
  User: Даня
  Date: 27.12.2022
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h>Create</h>
<form action="${pageContext.request.contextPath}/exhibition_crud" method = "post">
    <input type="hidden" name="action" value="create"/>
    <label for="start">start Date:</label><br>
    <input type = "date" name="start" id = "start"><br>
    <label for="description">description:</label><br>
    <input type = "text" name="description" id = "description"><br>
    <button type="submit">add</button>
</form>

<h>Update</h>
<form action="${pageContext.request.contextPath}/exhibition_crud" method = "post">
    <input type="hidden" name="action" value="update"/>
    <label for = "update_id">id:</label>
    <input type="number" name = "update_id" id = "update_id"><br>
    <label for="u_name">name:</label><br>
    <input type = "text" name="name" id = "u_name"><br>
    <label for="u_email">email:</label><br>
    <input type = "text" name="email" id = "u_email">

    <button type="submit">add</button>
</form>
<h>find</h>

<form action="${pageContext.request.contextPath}/exhibition" method = "post">
    <input type="hidden" name="action" value="find"/>
    <label for="find_id">id:</label><br>
    <input type = "number" name="find_id" id = "find_id">
    <button type="submit">find</button>
</form>

<table>
    <thead>
    <tr>
        <td>id</td>
        <td>startDate</td>
        <td>description</td>
    </tr>
    </thead>
    <tbody>
    <% List<Exhibition> exhibitions = (List<Exhibition>) request.getAttribute("exhibitions"); %>
    <% for (Exhibition exhibition : exhibitions) {%>
    <tr>
        <td><%= exhibition.getId() %></td>
        <td><%= exhibition.getStartDate() %></td>
        <td><%= exhibition.getDescription() %></td>
        <td><form action="${pageContext.request.contextPath}/update_delete" method="get">
            <input type = "hidden" name = "update" value = <%=exhibition.getId()%>>
            <input type = "hidden" name = "class" value="client">
            <input type = "submit" value="update">
        </form></td>
        <td><form action="${pageContext.request.contextPath}/update_delete" method="get">
            <input type = "hidden" name = "delete" value = <%=exhibition.getId()%>>
            <input type = "hidden" name = "class" value="client">
            <input type = "submit" value="delete">
        </form></td>
    </tr>
    <% } %>
    </tbody>
</table>

</body>
</html>
