<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 31.
  Time: 오전 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>쿠키 설정하기</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <div>
    <h2>1. 쿠키(Cookie) 설정</h2>

    <%
//      쿠키 생성, 쿠키 이름은 반드시 생성자를 사용하여 생성
      Cookie cookie = new Cookie("myCookie", "쿠키맛나요");
//      쿠키 저장 장소 설정
      cookie.setPath(request.getContextPath());
//      쿠키가 클라이언트 컴퓨터에 저장되어 있을 수 있는 시간 설정, 60분 * 60초 = 3600초 (1시간)
      cookie.setMaxAge(3600);
//      클라이언트의 요청에 따른 응답 객체인 response에 쿠키 정보 저장
      response.addCookie(cookie);
    %>

    <br><hr><br>

    <h2>2. 쿠키 설정 직후 쿠키값 확인</h2>
    <%
//      모든 쿠키 정보를 다 가져옴
//      현재는 서버에서 CookieMain.jsp 파일을 생성하고, 클라이언트로 전달하기 전임
//      방금 위에서 생성한 쿠키 정보를 없음, SessionID만 존재함
      Cookie[] cookies = request.getCookies();

      if (cookies != null) {
        for (Cookie c : cookies) {
//          쿠키 이름 가져오기
          String cookieName = c.getName();
//          쿠키 값 가져오기
          String cookieValue = c.getValue();
//          out.println(String.format("%s : %s<br>", cookieName, cookieValue));
          out.println(cookieName + " : " + cookieValue + "<br>");
        }
      }
    %>

    <br><hr><br>

    <h2>3. 페이지 이동 후 쿠키값 확인</h2>
    <a href="CookieResult.jsp" target="_blank" class="btn btn-link">다음 페이지에서 쿠키값 확인하기</a>

<%--    서버가 클라이언트에 CookieMain.jsp 를 전달하여 클라이언트의 웹 브라우저에 화면이 출력 --%>
<%--    (클라이언트가 서버에 CookieMain.jsp 파일에 대한 요청을 하고, 웹 서버가 클라이언트에 CookieMain.jsp 에 대한 결과를 전달한 상태, 첫번째 요청과 응답이 끝난 상태 --%>

<%--    쿠키 관련 메소드 --%>
<%--    getComment() : 쿠키에 대한 설명을 가져옴 --%>
<%--    setComment(String) : 쿠키에 대한 설명을 설정 --%>
<%--    getSecure() : 쿠키의 보안 설정을 가져옴 --%>
<%--    setSecure(boolean) : 쿠키의 보안을 설정 --%>
<%--    getVersion() : 쿠키의 버전을 가져옴 --%>
<%--    setVersion(int) : 쿠키의 버전을 설정 --%>
  </div>
</div>
</body>
</html>











