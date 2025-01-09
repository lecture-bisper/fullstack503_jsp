  <%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 8.
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<nav class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top">
  <div class="container-fluid">
    <a href="/board/List.jsp" class="navbar-brand">게시판</a>
    <ul class="navbar-nav">
      <li class="nav-item">
        <a href="#" class="nav-link">메뉴 1</a>
      </li>
      <li class="nav-item">
        <a href="#" class="nav-link">메뉴 2</a>
      </li>
      <li class="nav-item">
        <a href="#" class="nav-link">메뉴 3</a>
      </li>
    </ul>
    <div class="ms-auto">
    <%
//      세션 정보를 확인하여 로그인 여부 확인
//      세션 정보가 없으면 로그인 버튼 출력
      if (session.getAttribute("userId") == null) {
        out.println("<a href='/board/login/Login.jsp' class='btn btn-outline-info'>로그인</a>");
      }
      else {
    %>
<%--    세션 정보가 있으면 사용자 이름 출력 및 로그아웃 버튼 출력 --%>
        <span class="navbar-text text-light me-3"><%=session.getAttribute("userName")%> 님 반갑습니다.</span>
        <a href="/board/login/LogoutProcess.jsp" class="btn btn-outline-secondary">로그아웃</a>
    <%
      }
    %>
    </div>
  </div>
</nav>











