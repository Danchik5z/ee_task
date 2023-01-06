<%@ page import="entity.Client" %>
<%@ page import="java.util.List" %><%--
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
  <label for="name">name:</label><br>
  <input type = "text" name="name" id = "name">
  <label for="email">email:</label><br>
  <input type = "text" name="email" id = "email">

  <button type="submit">add</button>
</form>

<h>Update</h>
<form action="${pageContext.request.contextPath}/client_crud" method = "post">
  <input type="hidden" name="action" value="update"/>
  <label for = "update_id">id:</label>
  <input type="number" name = "update_id" id = "update_id">
  <label for="u_name">name:</label><br>
  <input type = "text" name="u_name" id = "u_name">
  <label for="u_email">email:</label><br>
  <input type = "text" name="u_email" id = "u_email">

  <button type="submit">add</button>
</form>
<h>find</h>

<form action="${pageContext.request.contextPath}/clientclient" method = "post">
  <input type="hidden" name="action" value="find"/>
  <label for="find_id">id:</label><br>
  <input type = "number" name="find_id" id = "find_id">
  <button type="submit">find</button>
</form>
<h1 >delete</h1>
<form action="${pageContext.request.contextPath}/client_crud" method = "get">
  <input type="hidden" name="action" value="delete"/>
  <label for="delete_id">id:</label><br>
  <input type = "number" name="delete_id" id = "delete_id">
  <button type="submit">delete</button>
</form>
<table>
  <thead>
  <tr>
    <td>id</td>
    <td>fio</td>
    <td>email</td>
    <td>group_id</td>
  </tr>
  </thead>
  <tbody>
  <% List<Client> clients = (List<Client>) request.getAttribute("clients"); %>
  <% for (Client client : clients) {%>
  <tr>
    <td><%= client.getID() %></td>
    <td><%= client.getFullName() %></td>
    <td><%= client.getEmail()%></td>
  </tr>
  <% } %>
  </tbody>
</table>

</body>
</html>
