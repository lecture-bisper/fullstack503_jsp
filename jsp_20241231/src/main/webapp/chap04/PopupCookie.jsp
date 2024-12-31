<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 31.
  Time: 오전 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
//  클라이언트에서 전달한 데이터를 가져오기
  String chkVal = request.getParameter("inactiveToday");

//  클라이언트에서 전달받은 데이터가 null이 아니고, 1과 같으면 쿠키 설정
  if (chkVal != null && chkVal.equals("1")) {
//    PopupClose 라는 이름의 쿠키 설정, 값을 "off"로 설정
    Cookie cookie = new Cookie("PopupClose", "off");
    cookie.setPath(request.getContextPath());
    cookie.setMaxAge(60*60*24); // 시간은 초로 설정, 연산식을 사용해도 됨
    response.addCookie(cookie); // 클라이언트에 전달할 response 객체에 쿠키를 저장
    out.println("쿠키 : 하루 동안 열지 않음");
  }
%>











