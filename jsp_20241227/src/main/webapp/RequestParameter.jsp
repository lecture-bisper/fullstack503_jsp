<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 27.
  Time: 오후 3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="euc-kr" %>


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내장 객체 - request</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<%
  // 클라이언트에서 전달되는 데이터는 모두 문자열
//  전달된 문자열의 문자셋이 다를 수 있음
//  전달되는 문자열의 문자셋을 맞춰주기 위한 명령어
  request.setCharacterEncoding("UTF-8");

//  getParameter() : 클라이언트에서 사용자가 form 태그를 통해 전달한 데이터를 가져오는 메소드
//  매개변수로 입력한 1개의 데이터만 가져옴
//  클라이언트의 input 태그 name 속성값과 매개변수의 값이 동일해야 함
//  전달받은 데이터는 모두 문자열, 필요에 따라서 데이터 타입 변환이 필요함
  String id = request.getParameter("id");
  String gender = request.getParameter("gender");
//  getParameterValues() : getParameter() 와 동일한 기능을 가진 메소드
//  매개변수로 입력한 데이터를 배열로 가져옴
//  주로 checkbox 의 데이터를 가져오는데 사용함
  String[] favo = request.getParameterValues("favo");
  String favoStr = "";

  if (favo != null) {
    for (int i = 0; i < favo.length; i++) {
      favoStr += favo[i] + " ";
    }
  }

//  replace() : String 클래스에서 제공하는 문자열 수정 메소드
//  첫번째 매개변수의 문자열을 검색하여 두번째 매개변수의 문자열로 변경

//  textarea 태그를 통해서 서버로 전달된 데이터도 문자열 데이터 1개임
//  textarea 태그는 여러 라인의 데이터를 입력해서 사용하기 때문에 사용자가 보는 화면에서는 줄바꿈 기호가 보이지 않지만 실제로는 존재함
//  클라이언트에서 전달받은 데이터를 html 로 출력 시 html은 \n혹은 \r 같은 이스케이프 문자를 해석할 수 없기 때문에 하나의 라인으로 출력됨
//  사용자가 입력한 모양 그대로 html 로 출력하고자 할 경우 \r\n 을 html의 줄바꿈 태그인 <br>로 바꿔 줌
  String intro = request.getParameter("intro").replace("\r\n", "<br>");
%>

<div class="container mt-5">
  <ul class="list-group">
<%--    표현식을 사용하여 스크립틀릿에서 선언한 변수를 html 화면으로 출력 --%>
    <li class="list-group-item">아이디 : <%=id%></li>
    <li class="list-group-item">성별 : <%=gender%></li>
    <li class="list-group-item">관심사항 : <%=favoStr%></li>
    <li class="list-group-item">자기소개 : <%=intro%></li>
  </ul>
</div>
</body>
</html>











