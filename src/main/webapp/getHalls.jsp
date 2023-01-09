<%@ page import="entity.Client" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Exhibition" %>
<%@ page import="entity.Ticket" %>
<%@ page import="entity.Hall" %><%--
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
  <label for="repair_date">repair_date:</label><br>
  <input type = "date" name="repair_date" id = "repair_date"><br>


  <button type="submit">add</button>
</form>

<h>add exhibits</h>

<form action="${pageContext.request.contextPath}/exhibition_crud" method = "post">
  <input type="hidden" name="action" value="add"/>
  <label for="exh_id">id:</label><br>
  <input type = "number" name="exh_id" id = "exh_id">
  <label for="add_id">id of exhibit to add:</label><br>
  <input type = "number" name="add_id" id = "add_id">
  <button type="submit">find</button>
</form>

<h>remove exhibits</h>

<form action="${pageContext.request.contextPath}/exhibition_crud" method = "post">
  <input type="hidden" name="action" value="delete_exh"/>
  <label for="exhibition_id">id:</label><br>
  <input type = "number" name="exhibition_id" id = "exhibition_id">
  <label for="remove_id">id of exhibit to add:</label><br>
  <input type = "number" name="remove_id" id = "remove_id">
  <button type="submit">find</button>
</form>
<h>Update</h>
<form action="${pageContext.request.contextPath}/exhibition_crud" method = "post">
  <input type="hidden" name="action" value="update"/>
  <label for = "update_id">id:</label>
  <input type="number" name = "update_id" id = "update_id">
  <label for="u_name">name:</label><br>
  <input type = "text" name="name" id = "u_name">
  <label for="u_email">email:</label><br>
  <input type = "text" name="email" id = "u_email">

  <button type="submit">add</button>
</form>
<h>find</h>

<form action="${pageContext.request.contextPath}/exhibit" method = "post">
  <input type="hidden" name="action" value="find"/>
  <label for="find_id">id:</label><br>
  <input type = "number" name="find_id" id = "find_id">
  <button type="submit">find</button>
</form>
<h1 >delete</h1>
<form action="${pageContext.request.contextPath}/exhibition_crud" method = "post">
  <input type="hidden" name="action" value="delete"/>
  <label for="delete_id">id:</label><br>
  <input type = "number" name="delete_id" id = "delete_id">
  <button type="submit">delete</button>
</form>
<table>
  <thead>
  <tr>
    <td>id</td>
    <td>Repair_date</td>
  </tr>
  </thead>
  <tbody>
  <% List<Hall> halls = (List<Hall>) request.getAttribute("hall"); %>
  <% int i = 1 ;%>
  <% for (Hall hall : halls) {%>
  <tr>
    <td><%= hall.getHallNumber() %></td>
    <td><%= hall.getRepair_date() %></td>
  </tr>
  <% i++;} %>
  </tbody>
</table>

</body>
</html>
