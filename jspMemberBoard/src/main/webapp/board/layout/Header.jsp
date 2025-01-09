  <%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 8.
  Time: 오후 2:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%--    미리 생성한 Header 용 JSP 파일, 다른 파일에서 include 하여 사용 --%>
<%--    Header.jsp 파일을 다른 파일에서 include 하여 사용하기 때문에 UI가 계속 동일함 --%>
<%
//  현재 페이지 이름을 입력할 변수
  String pageName = "";

//  getRequestURL() : 서버 주소를 포함한 전체 주소를 출력
//  getRequestURI() : 전체 주소 중 서버 주소를 제외한 나머지 주소를 출력
//  lastIndexOf(문자) : 지정한 문자 혹은 문자열이 해당 문자열 안의 어느 index에 위치하는지 뒤에서부터 확인하여 알려줌
//  substring(index) : 지정한 문자열에서 지정한 index 위치에서 시작하는 문자열을 잘라내어 가져옴

// 서버주소를 제외한 나머지 주소 가져옴
  String result = request.getRequestURI();
//  가져온 나머지 주소에서 뒤에서 부터 검색하여 / 가 검색되는 Index를 가져옴
  int index = result.lastIndexOf("/") + 1;
//  가져온 index를 기준으로 문자열을 잘라서 가져옴, 최종적으로 파일명만 남음
  result = result.substring(index);

//  파일명에 따라서 각각의 페이지에 출력할 문자열을 설정함
  switch (result) {
    case "List.jsp":
      pageName = "게시글 목록";
      break;

    case "View.jsp":
      pageName = "게시글 상세";
      break;

    case "Write.jsp":
      pageName = "게시글 등록";
      break;

    case "Edit.jsp":
      pageName = "게시글 수정";
      break;

    case "Login.jsp":
      pageName = "로그인";
      break;

    case "MemberJoin.jsp":
      pageName = "회원가입";
      break;
  }
%>

<header class="px-sm-5 text-center" style="margin-top: 100px;">
  <div class="container">
    <div class="rounded-3 bg-secondary-subtle px-4 py-5">
<%--    설정된 문자열을 출력 --%>
      <h1 class="display-4">회원제 게시판 <%=pageName%> 페이지</h1>
    </div>
  </div>
</header>











