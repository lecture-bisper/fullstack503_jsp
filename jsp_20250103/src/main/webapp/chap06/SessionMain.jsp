<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 3.
  Time: 오전 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 자바의 날짜 관련 클래스 import --%>
<%@ page import="java.util.Date" %>
<%-- 자바에서 제공하는 날자 데이터를 사용자가 알아보기 쉽도록 해주는 클래스 import --%>
<%@ page import="java.text.SimpleDateFormat" %>

<%
//  날짜 표현 방식을 시:분:초 로 지정함
  SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");

//  세션이 최초로 생성된 시간을 가져옴
  long creationTime = session.getCreationTime();
//  사용자가 알아보기 쉬운 형태로 변환
  String creationTimeStr = sdf.format(new Date(creationTime));

//  다른 작업 후 마지막으로 세션이 요청된 시간을 가져옴
  long lastTime = session.getLastAccessedTime();
  String lastTimeStr = sdf.format(new Date(lastTime));

//  현재 서버에 생성된 세션이 최초로 서버에 접속해서 생성된 세션인지 기존의 세션인지 확인
  boolean isNew = session.isNew();

//  현재 서버에 생성된 세션의 유지 시간을 설정
  session.setMaxInactiveInterval(10);


//  Session 내장 객체 메소드

//  getAttribute(세션이름) : 세션 영역에 저장된 데이터를 가져옴, Object 타입으로 출력, 지정한 세션 이름의 데이터가 없을 경우 null 을 출력
//  getAttributeNames() : 세션 영역에 저장된 모든 세션의 이름을 Enumeration 타입으로 출력
//  getCreationTime() : 현재 클라이언트에 대한 최초 세션 생성 시간을 출력
//  getId() : 현재 세션에 할당된 세션 ID를 출력
//  getLastAccessedTime() : 현재 세션 ID를 사용하는 클라이언트가 서버에 마지막으로 요청한 시간
//  getMaxInactiveInterval() : 현재 세션 정보가 서버에 저장되어 유지되는 시간 출력
//  isNew() : 현재 세션의 생성 여부를 출력, 처음 생성된 세션이면 true, 기존의 세션이면 false
//  setAttribute(세션이름, 데이터) : 세션 영역에 데이터를 저장
//  setMaxInactiveInterval(시간) : 현재 세션 정보를 서버에 저장하여 유지하는 시간을 설정
//  removeAttribute(세션이름) : 지정한 세션 이름을 가지고 있는 데이터를 세션 영역에서 삭제
//  invalidate() : 현재 접속한 세션에 대해서 세션 영역에 저장된 모든 데이터를 삭제
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>세션 사용하기</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2 class="text-center">세션 설정 확인</h2>

  <ul class="list-group">
    <li class="list-group-item">세션 유지 시간 : <%=session.getMaxInactiveInterval()%></li>
    <li class="list-group-item">세션 아이디 : <%=session.getId()%></li>
    <li class="list-group-item">최초 요청 시간 : <%=creationTimeStr%></li>
    <li class="list-group-item">마지막 요청 시간 : <%=lastTimeStr%></li>
    <li class="list-group-item">새 세션 여부 : <%=isNew%></li>
  </ul>
</div>
</body>
</html>











