<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 30.
  Time: 오후 3:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- ArrayList 를 사용하기 위해서 import --%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
//  ArrayList 객체 생성
  List<String> lists = new ArrayList<>();
//  ArrayList에 데이터 추가
  lists.add("리스트");
  lists.add("컬렉션");
//  세션 영역에 데이터 저장
//  session 내장 객체에 lists 라는 이름으로 데이터 저장
  session.setAttribute("lists", lists);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>세션 영역</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2>페이지 이동 후 session 영역의 속성 읽기</h2>

  <div>
    <ul>
      <%
//        세션 영역에 저장된 lists 라는 이름의 데이터를 가져오기
        List<String> sessionList = (List<String>)session.getAttribute("lists");

//        ArrayList에 저장된 데이터를 반복문을 사용하여 모두 출력
        for (String item : sessionList) {
          out.print("<li>" + item + "</li>");
        }
      %>
    </ul>
    <a href="SessionLocation.jsp" target="_blank" class="btn btn-link">SessionLocation.jsp 바로 가기</a>
  </div>
</div>
</body>
</html>











