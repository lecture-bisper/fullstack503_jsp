<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 31.
  Time: 오전 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  // 팝업 상태를 관리하기 위한 변수
  String popupMode = "on";
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>쿠키없이 팝업창 만들기</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>

  <style>
    div#popup {
        position: absolute;
        top: 100px;
        left: 50px;
        color: yellow;
        width: 270px;
        height: 100px;
        background-color: gray;
    }

    div#popup > div {
        position: relative;
        background-color: #ffffff;
        top: 0px;
        border: 1px solid gray;
        padding: 10px;
        color: black;
    }
  </style>

  <script>
//    Jquery를 이용하여 이벤트 사용
    $(document).ready(function () {
      // closeBtn 버튼 클릭 시 팝업창 숨김
      $("#closeBtn").on("click", function() {
        $("#popup").hide();
      });
    });
  </script>

</head>
<body>
<div class="container mt-5">
  <h2>팝업 메인 페이지(ver0.1)</h2>

  <%
    for (int i = 1; i <= 10; i++) {
      out.println("현재 팝업창은 " + popupMode + "상태 입니다.<br>");
    }

//    위에서 선언한 팝업 관리 변수의 값이 "on" 과 같은지 확인
    if (popupMode.equals("on")) {
  %>

  <div id="popup">
    <h2 class="text-center">공지사항 팝업입니다.</h2>
    <div>
      <form name="popFrm">
        <div class="form-check form-check-inline">
          <input type="checkbox" class="form-check-input" id="inactiveToday" value="1">
          <label for="inactiveToday" class="form-check-label">하루동안 열지 않음</label>
        </div>
        <div class="d-inline-block">
          <input type="button" class="btn btn-primary" value="닫기" id="closeBtn">
        </div>
      </form>
    </div>
  </div>

  <%
    }
  %>
</div>
</body>
</html>











