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
//  클라이언트에서 전달받는 데이터의 문자셋 설정
  request.setCharacterEncoding("UTF-8");

//  클라이언트에서 데이터 받아오기, 글 번호를 받아옴
  String strNum = request.getParameter("num");
//  받아온 글 번호를 숫자 타입으로 저장하기 위한 변수
  int postNum = 0;

//  클라이언트에서 전달받은 데이터가 있으면 숫자 데이터로 변환하고 없으면 그냥 넘어감
  if (strNum != null) {
    postNum = Integer.parseInt(strNum);
  }

//  데이터베이스 접속
  DBConnPool db = new DBConnPool();

//  데이터베이스에서 SELECT 쿼리문 실행 후 전달받은 데이터를 저장할 List
  List<Map> dataList = new ArrayList<>();

  try {
    String sql = "";

//    클라이언트에서 전달받은 데이터가 있을 경우와 없을 경우의 SQL 쿼리문이 다름
    if (strNum != null) {
      sql = "SELECT num, title, content, id, postdate, visitcount FROM board ";
      sql += "WHERE num = ? ";

//      클라이언트에서 전달받은 데이터가 있을 경우 해당 데이터로 SQL 쿼리문 변경
      db.pstmt = db.conn.prepareStatement(sql);
      db.pstmt.setInt(1, postNum);
    }
    else {
//      클라이언트에서 전달받은 데이터가 없을 경우 전체 조회 쿼리문으로 사용
      sql = "SELECT num, title, content, id, postdate, visitcount FROM board ";
      db.pstmt = db.conn.prepareStatement(sql);
    }

//    PreparedStatement 를 사용하여 데이터베이스에서 SQL 쿼리문 실행 후 결과 받아오기
    db.rs = db.pstmt.executeQuery();

//    데이터베이스에서 전달받은 데이터에서 출력할 데이터가 있는지 확인 후 출력
    while (db.rs.next()) {
//      가져온 데이터에서 컬럼명을 통해서 데이터 출력
      int num = db.rs.getInt("num");
      String title = db.rs.getString("title");
//      가져온 데이터에서 컬럼 index를 통해서 데이터 출력, 1부터 시작
      String content = db.rs.getString(3);
      String userId = db.rs.getString(4);
      String postDate = db.rs.getString("postdate");
      int visitCount = db.rs.getInt("visitcount");

//      출력된 데이터를 html에 출력하기 위해서 HashMap 타입의 변수에 저장
//      여러가지 데이터 타입을 입력하기 위해서 Object 타입으로 데이터를 입력
      Map<String, Object> post = new HashMap<>();
      post.put("num", num);
      post.put("title", title);
      post.put("content", content);
      post.put("userId", userId);
      post.put("postDate", postDate);
      post.put("visitCount", visitCount);

//      Select문의 결과는 데이터의 행이 여러개일 수 있기 때문에 HashMap 데이터를 List에 저장
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
//          List에 저장된 데이터를 하나씩 출력하여 html 화면에 표현
          for (int i = 0; i < dataList.size(); i++) {
            out.println("<tr>");
//            기존에 입력된 데이터가 Object 타입이기 때문에 출력 시 강제 타입 변환
//            List에서 데이터 출력 시 get(index)을 사용하고, List에서 출력된 데이터는 HashMap 타입이므로 Map에서 데이터를 출력하는 메소드 get(key)를 연속적으로 사용
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











