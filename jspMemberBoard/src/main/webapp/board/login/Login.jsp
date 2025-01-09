<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 8.
  Time: 오전 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원제 게시판 로그인 페이지</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>

  <script>
    $(document).ready(function () {
      // 취소 버튼 클릭 시 이전 화면으로 이동
      $("#btn-cancel").on("click", function () {
        history.back();
      });
    });
  </script>
</head>
<body>

<%-- 절대 경로 --%>
<%-- 리소스의 위치를 최상위 디렉토리인 root 디렉토리를 기준으로 리소스를 찾는 방식 --%>
<%-- root : 윈도우에서는 각 드라이브의 최상위 폴더를 의미 (c:\, d:\) --%>
<%-- 리눅스(macos포함)에서는 최상위 디렉토리(root) 를 '/' 로 표현함 --%>
<%-- 웹 환경은 tomcat 에서 설정한 디렉토리(폴더)를 root 디렉토리로 인식함 --%>
<%-- / : 최상위 디렉토리를 의미하는 기호, 각각의 디렉토리를 구분하는 기호 --%>
<%-- ~ : 웹에서는 미사용, 운영체제에서 사용, 현재 계정의 홈 디렉토리를 의미 --%>

<%-- 상대 경로 --%>
<%-- 현재 파일이 존재하는 위치를 기준으로 다른 리소스를 찾아가는 방식 --%>
<%-- 동일한 디렉토리일 경우 '.' 생략 가능 --%>
<%-- . : 현재 디렉토리(폴더)를 의미 --%>
<%-- .. : 현재 디렉토리보다 한단계 상위 디렉토리를 의미 --%>

<%@ include file="../layout/Header.jsp" %>

<%@ include file="../layout/Menu.jsp" %>

<main class="container mt-5">
  <section>
    <div class="row">
      <div class="col-sm-4 mx-auto border rounded rounded-4 p-4">
        <form action="./LoginProcess.jsp" method="post">
          <div class="mt-3 form-floating">
            <input type="text" class="form-control" id="user-id" name="userId" placeholder="아이디를 입력하세요">
            <label for="user-id">아이디를 입력하세요</label>
          </div>
          <div class="mt-3 form-floating">
            <input type="password" class="form-control" id="user-pw" name="userPw" placeholder="비밀번호를 입력하세요">
            <label for="user-pw">비밀번호를 입력하세요</label>
          </div>
          <div class="mt-3 d-grid gap-2">
            <button type="submit" class="btn btn-primary">로그인</button>
            <button type="reset" class="btn btn-secondary" id="btn-cancel">취소</button>
          </div>
          <div class="mt-1 d-flex justify-content-end">
            <a href="./MemberJoin.jsp" class="btn btn-link text-info">회원 가입</a>
          </div>
        </form>
      </div>
    </div>
  </section>
</main>

<%@ include file="../layout/Footer.jsp"%>

</body>
</html>











