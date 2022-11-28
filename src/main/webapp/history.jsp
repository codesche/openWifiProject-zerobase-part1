
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="DataBase.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<html>
<head>
    <title>위치 히스토리 목록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>
<h1>위치 히스토리 목록</h1>
<div>
  <ul class="nav justify-content-start bg-light float-left">
    <a class="nav-link" href="index.jsp">홈</a> |
    <a class="nav-link" href="history.jsp">위치 히스토리 목록</a> |
    <a class="nav-link" href="load-wifi.jsp">와이파이 정보 가져오기</a>
  </ul>
</div>
<br/>

<%
    String SELECT_HISTORY = "SELECT * FROM History";
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement(SELECT_HISTORY);
    ResultSet rs = ps.executeQuery();
%>

<table class="table table-bordered">
  <thead>
  <th scope="col">ID</th>
  <th scope="col">LAT</th>
  <th scope="col">LNT</th>
  <th scope="col">조회일자</th>
  <th scope="col">비고</th>
  </thead>

  <%
    while (rs.next()){
  %>

  <tr>
    <td><%= rs.getString("ID") %></td>
    <td><%= rs.getString("LAT") %></td>
    <td><%= rs.getString("LNT") %></td>
    <td><%= rs.getString("LOADDATE") %></td>
    <td>
      <form action="delete.jsp">
        <input type="submit" value="삭제">
        <input type="hidden" name="idx" value=<%= rs.getString("ID") %>>
      </form>
    </td>
  </tr>
  <%}%>
  <%
    conn.close();
    rs.close();
    ps.close();
  %>
  </tr>
</table>
</body>
</html>
