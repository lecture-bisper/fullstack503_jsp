<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 31.
  Time: 오전 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
//  팝업의 상태를 관리하기 위한 변수
  String popupMode = "on";

//  클라이언트에서 전달하는 데이터 중 쿠키 정보를 모두 가져옴
//  2번째 접속 시 PopupCookie.jsp 에서 전달한 쿠키 정보를 가져올 수 있음
  Cookie[] cookies = request.getCookies();

//  쿠키 정보가 있는지 없는지 확인
  if (cookies != null) {
//    반복문으로 쿠키 정보를 모두 출력
    for (Cookie c : cookies) {
//      두번째 접속 시 "PopupClose" 라는 이름의 쿠키를 가져옴
      String cookieName = c.getName();
//      PopupClose 와 연동되는 값은 "off";
      String cookieValue = c.getValue();

//      쿠키 이름이 "PopupClose" 와 같으면 쿠키에서 받아온 값을 팝업 관리 변수에 저장
      if (cookieName.equals("PopupClose")) {
//        popupMode 변수에 "off" 저장
        popupMode = cookieValue;
      }
    }
  }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>쿠키를 이용한 팝업 관리</title>

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
//    closeBtn 버튼 클릭 시 팝업창 닫기
    $(document).ready(function () {
      $("#closeBtn").on("click", function() {
        $("#popup").hide();

        // jquery를 이용하여 checkbox가 선택되어 있는지 확인
        // checkbox가 선택되어 있을 경우 value 속성값을 가져옴
        var chkVal = $("input:checkbox[id=inactiveToday]:checked").val();

        if (chkVal == 1) {
          // ajax 통신, 자바스크립트를 이용하여 서버와 비동기 통신을 진행
          // url : 접속할 서버 주소
          // type : 접속 방식 설정, (get, post)
          // data : 통신 시 서버로 전달할 데이터 설정
          // dataType : 서버에서 클라이언트로 데이터 응답을 받을 경우 전달받는 데이터의 타입 (text, html, json)
          // success : 서버와 통신이 성공적으로 이루어졌을 경우 실행하는 콜백함수
          // error : 서버와 통신이 실패 시 실행되는 콜백함수
          $.ajax({
            url: './PopupCookie.jsp',
            type: 'get',
            // 서버로 전달할 데이터
            data: {inactiveToday: chkVal},
            dataType: 'text',
            // 정상 통신 성공 시 실행되는 콜백함수
            // 매개변수로 서버에서 전달하는 데이터를 받아옴
            success: function(resData) {
              // 서버에서 전달받은 데이터가 빈 문자열이 아닐 경우 현재 페이지 새로고침
              if (resData != '') {
                // 자바스크립트의 현재 페이지 새로 고침 명령어
                location.reload();
              }
            },
            error: function () {
              alert("오류가 발생했습니다.");
            }
          });
        }
      });
    });
  </script>
</head>
<body>

<div class="container mt-5">
  <h2>팝업 메인 페이지</h2>
  <%
    for (int i = 1; i <= 10; i++) {
//      두번째 접속 시 popupMode 변수값은 off로 되어 있음
      out.println("현재 팝업창은 " + popupMode + "상태입니다.<br>");
    }

    if (popupMode.equals("on")) {
  %>
  <div id="popup">
    <h2 class="text-center">공지사항 팝업입니다.</h2>
    <div class="text-end">
      <form name="popFrm">
        <div class="form-check form-check-inline">
          <input type="checkbox" class="form-check-input" id="inactiveToday" value="1">
          <label for="inactiveToday" class="form-check-label">하루 동안 열지 않음</label>
        </div>
        <div class="d-inline-block">
          <button type="button" class="btn btn-primary btn-sm" id="closeBtn">닫기</button>
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











