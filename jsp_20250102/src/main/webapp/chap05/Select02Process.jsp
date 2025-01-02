<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 2.
  Time: 오후 4:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%@ page import="bitc.fullstack503.jsp_20250102.DBConnPool" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<%
  request.setCharacterEncoding("UTF-8");

  String strNum = request.getParameter("num");
  int postNum = 0;

  if (strNum != null) {
    postNum = Integer.parseInt(strNum);
  }

  DBConnPool db = new DBConnPool();

  List<Map> dataList = new ArrayList<>();

  try {
    String sql = "";

    if (strNum != null) {
      sql = "SELECT num, title, content, id, postdate, visitcount FROM board ";
      sql += "WHERE num = ? ";

      db.pstmt = db.conn.prepareStatement(sql);
      db.pstmt.setInt(1, postNum);
    }
    else {
      sql = "SELECT num, title, content, id, postdate, visitcount FROM board ";
      db.pstmt = db.conn.prepareStatement(sql);
    }

    db.rs = db.pstmt.executeQuery();

    while (db.rs.next()) {
      int num = db.rs.getInt("num");
      String title = db.rs.getString("title");
      String content = db.rs.getString(3);
      String userId = db.rs.getString(4);
      String postDate = db.rs.getString("postdate");
      int visitCount = db.rs.getInt("visitcount");

      Map<String, Object> post = new HashMap<>();
      post.put("num", num);
      post.put("title", title);
      post.put("content", content);
      post.put("userId", userId);
      post.put("postDate", postDate);
      post.put("visitCount", visitCount);

      dataList.add(post);
    }
  }
  catch (SQLException e) {

  }
  finally {
    db.close();
  }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Title</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2 class="text-center">PreparedStatement 로 데이터 조회하기</h2>

  <div class="mt-3">
    <table class="table table-hover table-striped">
      <thead>
        <tr>
          <th>글번호</th>
          <th>글제목</th>
          <th>글내용</th>
          <th>글쓴이</th>
          <th>등록시간</th>
          <th>조회수</th>
        </tr>
      </thead>
      <tbody>
        <%
          for (int i = 0; i < dataList.size(); i++) {
            out.println("<tr>");
            out.println("<td>" + (int)dataList.get(i).get("num") + "</td>");
            out.println("<td>" + (String)dataList.get(i).get("title") + "</td>");
            out.println("<td>" + (String)dataList.get(i).get("content") + "</td>");
            out.println("<td>" + (String)dataList.get(i).get("userId") + "</td>");
            out.println("<td>" + (String)dataList.get(i).get("postDate") + "</td>");
            out.println("<td>" + (int)dataList.get(i).get("visitCount") + "</td>");
            out.println("</tr>");
          }
        %>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>











