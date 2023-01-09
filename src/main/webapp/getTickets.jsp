<%@ page import="entity.Client" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Ticket" %><%--
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
<form action="${pageContext.request.contextPath}/client_crud" method = "post">
  <input type="hidden" name="action" value="create"/>
  <label for="client_id">client_id:</label><br>
  <input type = "text" name="client_id" id = "client_id"><br>
  <label for="hall_id">hall_id:</label><br>
  <input type = "text" name="hall_id" id = "hall_id"><br>
  <label for="price">price:</label><br>
  <input type = "text" name="price" id = "price">


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
    <td>client_id</td>
    <td>hall_id</td>
    <td>price</td>
  </tr>
  </thead>
  <tbody>
  <% List<Ticket> clients = (List<Ticket>) request.getAttribute("tickets"); %>
  <% for (Ticket client : clients) {%>
  <tr>
    <td><%= client.getID() %></td>
    <td><%= client.getClientID() %></td>
    <td><%= client.getHallID()%></td>

    <td><%= client.getPrice()%></td>
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
