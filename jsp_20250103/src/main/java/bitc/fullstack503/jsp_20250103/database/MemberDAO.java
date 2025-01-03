package bitc.fullstack503.jsp_20250103.database;

import java.sql.*;

// DAO : 데이터베이스를 컨트롤하기 위한 자바 클래스
// 각각의 메소드에 해당 테이블의 데이터를 추가, 삭제, 수정, 조회하는 기능을 구현하면 됨
public class MemberDAO {

//  데이터베이스 접속 및 SQL 쿼리 관련 클래스
  private Connection conn;
  private Statement stmt;
  private PreparedStatement pstmt;
  private ResultSet rs;

//  데이터베이스 접속 정보
  private String dbDriver;
  private String dbUrl;
  private String dbUser;
  private String dbPass;

  public MemberDAO() {
    dbDriver = "com.mysql.jdbc.Driver";
    dbUrl = "jdbc:mysql://localhost:3306/testfull503db?characterEncoding=UTF-8&serverTimezone=UTC";
    dbUser = "test1";
    dbPass = "full503";
  }

  public void dbOpen() {
    try {
      Class.forName(dbDriver);
      conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
    }
    catch (Exception e) {
      System.out.println("데이터베이스 연결 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
  }

  public void dbClose() {
    try {
      if (rs != null) { rs.close(); }
      if (stmt != null) { stmt.close(); }
      if (pstmt != null) { pstmt.close(); }
      if (conn != null) { conn.close(); }
    }
    catch (Exception e) {}

    System.out.println("데이터베이스 연결을 종료합니다.");
  }

//  로그인 가능 여부
//  사용자가 입력한 id/pw를 가지고 있는 사용자가 있는지 여부를 확인하는 메소드
//  매개변수로 사용자가 입력한 id/pw를 전달받음
  public boolean isMember(String userId, String userPw) {

//    데이터베이스 조회 결과를 저장하는 변수
    boolean result = false;

//    사용자가 입력한 ID/PW를 사용하는 사용자가 있는지 여부 확인용 SQL문
    String sql = "SELECT count(*) AS cnt FROM member ";
    sql += "WHERE id = ? AND pass = ? ";

    try {
//      PreparedStatement 객체 생성
      pstmt = conn.prepareStatement(sql);
//      SQL문의 ? 부분에 들어갈 데이터 세팅
      pstmt.setString(1, userId);
      pstmt.setString(2, userPw);

//      완성된 SQL문을 데이터베이스에 전달하여 결과 받아오기
      rs = pstmt.executeQuery();

//      데이터베이스에서 전달받은 데이터가 있으면 true, 없으면 false
      if (rs.next() == true) {
//        데이터가 있을 경우 cnt 컬럼의 데이터 값을 확인, 1이면 로그인, 1이 아니면 오류
        if (rs.getInt("cnt") == 1) {
          result = true; // 사용자가 있으므로 결과를 true로 변경
        }
      }
    } catch (SQLException e) {
      System.out.println("데이터베이스 조회 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
    finally {
      try {
        if (rs != null) { pstmt.close(); }
        if (pstmt != null) { pstmt.close(); }
      }
      catch (Exception e) {}
    }
    
//    데이터베이스 조회 결과를 반환
    return result;
  }

//  회원 정보 조회
  public MemberDTO selectMember(String userId) {

//    데이터베이스 조회 결과를 저장할 MemberDTO 타입의 변수 선언, 기본값 null
    MemberDTO member = null;

//    데이터베이스에서 지정한 회원의 정보를 조회해 올 SQL 문 생성
    String sql = "SELECT id, pass, name, regidate FROM member ";
    sql += "WHERE id = ? ";

    try {
//      데이터베이스에 SQL문을 전달할 PreparedStatement 객체 생성
      pstmt = conn.prepareStatement(sql);
//      SQL 문의 ? 에 데이터 추가
      pstmt.setString(1, userId);

//      데이터베이스에 SQL문 전달 및 결과 받아오기
      rs = pstmt.executeQuery();

//      데이터베이스에서 전달받은 결과 출력, 데이터가 있으면 true, 없으면 false
      if (rs.next()) {
//        컬럼명을 기반으로 데이터를 출력
        String id = rs.getString("id");
        String pass = rs.getString("pass");
        String name = rs.getString("name");
        String regiDate = rs.getString("regidate");

//        MemberDTO 클래스 타입의 객체에 선언 및 데이터 입력
        member = new MemberDTO();
        member.setId(id);
        member.setPass(pass);
        member.setName(name);
        member.setRegidate(regiDate);
      }
    }
    catch (SQLException e) {
      System.out.println("데이터베이스 조회 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
    finally {
      try {
        if (rs != null) { rs.close(); }
        if (pstmt != null) { pstmt.close(); }
      }
      catch (Exception e) {}
    }

//    데이터베이스 조회 결과를 반환
    return member;
  }

//  회원 가입
  public int insertMember(MemberDTO member) {

//    사용자 추가 결과를 저장하는 변수
    int result = 0;
    
//    SQL문 생성
    String sql = "INSERT INTO member (id, pass, name, regidate) ";
    sql += "VALUES (?, ?, ?, now()) ";

    try {
//    PreparedStatement 생성
      pstmt = conn.prepareStatement(sql);
//    데이터 입력
      pstmt.setString(1, member.getId());
      pstmt.setString(2, member.getPass());
      pstmt.setString(3, member.getName());

//    SQL문 실행
      result = pstmt.executeUpdate();

      if (result <= 0) {
        System.out.println("회원 가입에 실패했습니다.");
      }
    }
    catch (SQLException e) {
      System.out.println("데이터베이스에 데이터 추가 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
    finally {
      try {
        if (pstmt != null) { pstmt.close(); }
      } catch (Exception e) {}
    }

    return result;
  }
//  회원 정보 수정
//  회원 삭제
}












