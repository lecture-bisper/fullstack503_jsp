<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 30.
  Time: 오전 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- java 의 Collection 인터페이스를 사용하기 위해서 import --%>
<%@ page import="java.util.Collection" %>
<%-- java의 SimpleDateFormat 클래스를 사용하기 위해서 import --%>
<%@ page import="java.text.SimpleDateFormat" %>

<%
  // 사용자가 원하는 날짜 표기 방식으로 설정
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//  기본적으로 getParameter로 전달받는 데이터는 모두 문자열
//  SimpleDateFormat을 통해서 클라이언트에서 전달받은 데이터를 파싱
  long addDate = sdf.parse(request.getParameter("addDate")).getTime();
//  클라이언트에서 전달받은 문자열 데이터를 숫자 타입으로 변환
  int addInt = Integer.parseInt(request.getParameter("addInt"));
//  클라이언트에서 전달받은 문자열을 변수에 저장
  String addStr = request.getParameter("addStr");

//  내장객체 response 에 addXXXHeader() 를 사용하여 헤더정보를 저장
//  헤더에 날짜 정보를 저장
  response.addDateHeader("myBirthday", addDate);
//  헤더에 숫자 정보를 저장
  response.addIntHeader("myNumber", addInt);
//  헤더에 숫자 정보를 하나 더 저장
  response.addIntHeader("myNumber", 1004);
//  헤더에 문자열 정보를 저장
  response.addHeader("myName", addStr);
//  헤더에 기존 문자열 정보를 수정
  response.setHeader("myName", "안중근");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내장 객체 - Response</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2>응답 헤더 정보 출력하기</h2>

  <%
    // 내장객체 response에 저장된 모든 헤더 정보 중 헤더 이름만 모두 가져옴
    Collection<String> headerNames = response.getHeaderNames();
    for (String hName : headerNames) {
//      getHeader() : 헤더 정보 중 지정한 헤더 이름과 일치하는 값을 가져옴
//      getHeader()로 헤더 정보를 가져오면 헤더 정보 중 이름과 일치하는 것 중에서 첫번째 것만 가져옴
      String hValue = response.getHeader(hName);
  %>
  <li><%=hName%> : <%=hValue%></li>
  <%
    }
  %>

  <h2>myNumber 만 출력하기</h2>

  <%
    // getHeaders() : 헤더 정보에 저장된 내용 중 지정한 헤더 이름을 가지고 있는 모든 헤더 정보를 가져옴
    Collection<String> myNumber = response.getHeaders("myNumber");
    for (String myNum : myNumber) {
  %>
  <li>myNumber : <%=myNum%></li>
  <%
    }
  %>
</div>
</body>
</html>











