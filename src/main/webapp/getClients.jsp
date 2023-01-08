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


<h>find by id</h>

<form action="${pageContext.request.contextPath}/clientclient" method = "get">
  <input type="hidden" name="action" value="find"/>
  <label for="find_id">id:</label><br>
  <input type = "number" name="find_id" id = "find_id">
  <button type="submit">find</button>
</form>

<h>find by fio</h>

<form action="${pageContext.request.contextPath}/clientclient" method = "get">
  <input type="hidden" name="action" value="find_fio"/>
  <label for="full_name">id:</label><br>
  <input type = "text" name="full_name" id = "full_name">
  <button type="submit">find</button>
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
  <% List<Client> clients = (List<Client>) request.getAttribute("clients");
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    int pageNo = (int) request.getAttribute("page");
    int recordsPerPage = (int) request.getAttribute("recordsPerPage");
    int noOfPages = (int) request.getAttribute("noOfPages");
    int start = (pageNo-1) * recordsPerPage;
    if(start != 0){
      start--;
    }%>
  <% for (int i = start; i < (pageNo * recordsPerPage) - 1 && i < clients.size(); i++ ) {%>
  <% Client client = clients.get(i);%>
  <tr>
    <td><%= client.getID() %></td>
    <td><%= client.getFullName() %></td>
    <td><%= client.getEmail()%></td>
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

<table>
  <tr>

    <% if(pageNo!=1){ %>
    <td><a href="${pageContext.request.contextPath}/clientclient?page=<%=pageNo - 1%>">Previous</a></td>
    <%}%>
    <% for(int i = 1; i <= noOfPages; i++){
      if(i == pageNo){ %>
    <td><%=i%></td>
    <% }
    else{ %>
    <td><a href="${pageContext.request.contextPath}/clientclient?page=<%=i%>"><%=i%></a></td>
    <%}
    }%>
    <%--For displaying Next link --%>
    <% if(pageNo!=noOfPages){ %>
    <td><a href="${pageContext.request.contextPath}/clientclient?page=<%=pageNo + 1%>">Next</a></td>
    <%}%>
  </tr>
</table>


</body>
</html>
