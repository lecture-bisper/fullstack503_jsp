<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 27.
  Time: 오전 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- page 디렉티브 태그의 import 를 사용하여 java 패키지 중 SimpleDateFormat, Date 클래스를 가져옴 --%>
<%-- 일반 자바파일에서 import로 다른 클래스를 가져오는 것과 동일함 --%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

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

<%
  // page 디렉티브 태그의 import 속성을 사용하여 필요한 자바 패키지를 가져와서 사용
  Date today = new Date();
//  기본적으로 프로그래밍에서 시간은 1970년 1월 1일 0시 0분 0초 부터 시작하여 현재 시간까지 걸린 시간을 숫자(초)로 표현
//  사용자가 알아보기 힘들기 때문에 사용자가 알아보기 쉽게 하기 위해서 SimpleDateFormat 클래스를 사용함
//  y : 년도를 의미, yyyy 는 4자리의 년도 표시
//  M : 월을 의미, MM는 2자리의 월 표시
//  d : 일을 의미, dd는 2자리의 일 표시
//  H : 시간을 의미, HH는 24시간의 시간 표시
//  m : 분을 의미, mm은 2자리의 분 표시
//  s : 초를 의미, ss는 2자리의 초 표시
  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  String todayStr = dateFormat.format(today);
  out.println("오늘 날짜 : " + todayStr);
%>
</body>
</html>











