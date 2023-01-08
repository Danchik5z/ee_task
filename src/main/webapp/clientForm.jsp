<%@ page import="entity.Client" %><%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 08.01.2023
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
<h>Update</h>
<% Client client = (Client) request.getAttribute("client");
request.setCharacterEncoding("UTF-8");%>
<form action="${pageContext.request.contextPath}/update_delete" method = "post">


  <input type="hidden" name = "id" id = "update_id" value=<%=client.getID()%>>
  <input type = "hidden" name = "class" value="client">
  <label for="u_name">name:</label><br>
  <input type = "text" name="name" id = "u_name" value= "<%=client.getFullName()%>">
  <label for="u_email">email:</label><br>
  <input type = "text" name="email" id = "u_email" value= <%=client.getEmail()%>>

  <button type="submit">add</button>
</form>
</body>
</html>
