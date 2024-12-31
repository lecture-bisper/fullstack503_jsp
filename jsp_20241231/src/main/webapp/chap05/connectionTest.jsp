<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 31.
  Time: 오후 12:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 데이터베이스 사용을 위한 패키지 --%>
<%@ page import="java.sql.*" %>

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
//  java.sql 패키지에서 제공하는 데이터베이스 접속 진행을 위한 클래스
  Connection conn = null;

//  데이터베이스 접속은 외부 리소스를 사용하는 것이기 때문에 반드시 try ~ catch 로 예외처리를 해야 함
  try {
//    데이터베이스 접속 주소 설정
//    jdbc : 데이터베이스 접속 시 사용하는 커넥터 종류, 자바에서는 jdbc
//    mysql : 데이터베이스 종류
//    //localhost:3306 : 데이터베이스 서버 주소 및 포트번호
//    port : 네트워크 사용 시 IP 번호가 1개 주어지기 때문에 효과적으로 사용할 수 없음, 네트워크 자원을 port 라는 것으로 나누어서 동시에 여러가지 네트워크를 사용할 수 있도록 함
//    1 ~ 65535 개 존재함, 1 ~ 1000번까지는 OS내부적로 사용하는 것이 많기 때문에 이후 번호를 사용하는 것이 좋음
//    /testfull503db : 사용자가 접속하고자 하는 데이터베이스명
//    ? 뒤에 있는 부분은 mysql 접속을 위한 옵션 부분
    String url = "jdbc:mysql://localhost:3306/testfull503db?characterEncoding=UTF-8&serverTimezone=UTC";
    String userId = "test1";
    String userPw = "full503";

//    com.mysql.cj.jdbc.Driver : 최신 버전의 mysql 드라이버명 (구버전 : com.mysql.jdbc.Driver)
    Class.forName("com.mysql.cj.jdbc.Driver");
//    getConnection() : 지정한 URL과 사용자 ID, 사용자 PW 를 사용하여 실제로 데이터베이스에 접속
    conn = DriverManager.getConnection(url, userId, userPw);
    out.println("데이터베이스 연결이 성공했습니다.");
  }
  catch (SQLException e) {
    out.println("데이터베이스 연결이 실패했습니다.<br>");
    out.println("SQLException : " + e.getMessage());
  }
  finally {
//    conn이 null 아닐 경우는 한번 이상 데이터베이스에 접속했다는 의미
//    conn이 null 일 경우는 한번도 데이터베이스에 접속하지 않았다는 의미
    if (conn != null) {
//    데이터베이스 접속 종료
      conn.close();
    }
  }
%>
</body>
</html>











