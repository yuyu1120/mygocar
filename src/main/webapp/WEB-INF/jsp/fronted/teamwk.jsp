<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="com.example.mygocar.dao.TeamMemberDAO, com.example.mygocar.model.TeamMember, java.util.List" %>

<%
    // 從資料庫中取得所有隊員資料
    TeamMemberDAO dao = new TeamMemberDAO();
    List<TeamMember> members = dao.getAllMembers();
%>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>組員介紹 - MyGoCar</title>
  <link rel="stylesheet" href="/css/resetcss.css">
  <link rel="stylesheet" href="/css/teamwk.css">
</head>
<body>
  <header class="header">
    <h1>隊員介紹</h1>
  </header>

  <main class="team-container">
    <%
        for (TeamMember tm : members) {
    %>
      <div class="team-card">
        <img src="<%= tm.getImageUrl() %>" alt="<%= tm.getName() %>" class="team-photo">
        <h3><%= tm.getName() %></h3>
        <p class="team-role"><%= tm.getRole() %></p>
        <p class="team-description"><%= tm.getDescription() %></p>
      </div>
    <%
        }
    %>
  </main>

  <!-- QR Code -->
  <div class="qr-code">
    <img src="img/cat51121.png" alt="QR Code">
  </div>
</body>
</html>
