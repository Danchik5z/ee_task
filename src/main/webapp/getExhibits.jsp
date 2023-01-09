<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 29.12.2022
  Time: 23:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ page import="entity.Client" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Exhibit" %>
<%--
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
<form action="${pageContext.request.contextPath}/exhibit_crud" method = "post">
    <input type="hidden" name="action" value="create"/>
    <label for="hallnumber">hallnumber:</label><br>
    <input type = "number" name="hallnumber" id = "hallnumber"><br>
    <label for="description">descripotion:</label><br>
    <input type = "text" name="description" id = "description">

    <button type="submit">add</button>
</form>

<h>Update</h>
<form action="${pageContext.request.contextPath}/exhibit_crud" method = "post">
    <input type="hidden" name="action" value="create"/>
    <label for="update_id">id:</label><br>
    <input type = "number" name="update_id" id = "update_id"><br>
    <label for="u_hallnumber">hallnumber:</label><br>
    <input type = "number" name="u_hallnumber" id = "u_hallnumber"><br>
    <label for="u_description">descripotion:</label><br>
    <input type = "text" name="u_description" id = "u_description">

    <button type="submit">add</button>

</form>
<h>find</h>

<form action="${pageContext.request.contextPath}/exhibit" method = "post">
    <input type="hidden" name="action" value="find"/>
    <label for="find_id">id:</label><br>
    <input type = "number" name="find_id" id = "find_id">
    <button type="submit">find</button>
</form>
<table>
    <thead>
    <tr>
        <td>id</td>
        <td>hallNumber</td>
        <td>description</td>
    </tr>
    </thead>
    <tbody>
    <% List<Exhibit> exhibits = (List<Exhibit>) request.getAttribute("exhibits"); %>
    <% for (Exhibit client : exhibits) {%>
    <tr>
        <td><%= client.getID() %></td>
        <td><%=client.getHallNumber()%></td>
        <td><%=client.getDescription()%></td>
        <td><form action="${pageContext.request.contextPath}/update_delete" method="get">
            <input type = "hidden" name = "update" value = <%=client.getID()%>>
            <input type = "hidden" name = "class" value="client">
            <input type = "submit" value="update">
        </form></td>
        <td><form action="${pageContext.request.contextPath}/update_delete" method="get">
            <input type = "hidden" name = "delete" value = <%=client.getID()%>>
            <input type = "hidden" name = "class" value="client">
            <input type = "submit" value="delete">
        </form></td>
    </tr>
    <% } %>
    </tbody>
</table>

</body>
</html>

</body>
</html>
