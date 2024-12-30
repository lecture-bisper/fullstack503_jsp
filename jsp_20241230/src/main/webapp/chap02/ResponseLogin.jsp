<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 30.
  Time: 오전 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
//  request 내장 객체를 통해서 클라이언트에서 서버로 전달된 데이터를 가져옴
  String id = request.getParameter("userId");
  String pw = request.getParameter("userPw");

//  클라이언트에서 전달한 id/pw가 서버에 있는 id/pw와 같은 확인
  if (id.equalsIgnoreCase("must") && pw.equalsIgnoreCase("1234")) {
//  id/pw가 같을 경우 response 내장 객체에서 제공하는 sendRedirect() 를 호출하여 지정한 페이지로 이동
//  sendRedirect() 와 forward() 는 동일하게 페이지 이동 기능을 제공
//  sendRedirect()는 지정한 페이지로 재접속하라고 클라이언트한테 요청
//  forward() 는 서버 내부에서 지정한 페이지로 이동
    response.sendRedirect("ResponseWelcome.jsp");
  }
  else {
//  id/pw가 다를 경우 원래 페이지로 이동
//    getRequestDispatcher() 를 통해서 이동할 페이지 설정, 접속 방식을 get 방식으로 설정, loginErr 이라는 데이터도 함께 전송
    request.getRequestDispatcher("ResponseMain.jsp?loginErr=1").forward(request, response);
  }
%>











