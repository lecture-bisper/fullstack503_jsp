package bitc.fullstack503.jspmemberboard.database;

import jakarta.servlet.ServletContext;

import java.sql.SQLException;

public class JSPMemberDAO extends JDBConnect {

  public JSPMemberDAO() {
    super();
  }

  public JSPMemberDAO(ServletContext application) {
    super(application);
  }

  public JSPMemberDAO(String dbDriver, String dbUrl, String dbUser, String dbPass) {
    super(dbDriver, dbUrl, dbUser, dbPass);
  }

//  사용자가 입력한 ID/PW를 사용하는 회원 여부 확인
  public boolean isLogin(String userId, String userPw) {

    boolean result = false;

    try {
      String sql = "SELECT count(*) AS cnt FROM jspmember ";
      sql += "WHERE user_id = ? ";
      sql += "AND user_pw = ? ";
      sql += "AND deleted_yn = 'N' ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, userId);
      pstmt.setString(2, userPw);

      rs = pstmt.executeQuery();

      while (rs.next()) {
        if (rs.getInt("cnt") == 1) {
          result = true;
        }
      }
    }
    catch (Exception e) {
      System.out.println("데이터베이스에서 정보 조회 중 오류가 발생했습니다.");
      e.printStackTrace();
    }

    return result;
  }

//  지정한 회원 정보 조회
  public JSPMemberDTO getMemberInfo(String userId) {

    JSPMemberDTO member = null;

    try {
      String sql = "SELECT user_id, user_name, user_email, user_phone, user_addr ";
      sql += "FROM jspmember ";
      sql += "WHERE user_id = ? ";
      sql += "AND deleted_yn = 'N' ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, userId);

      rs = pstmt.executeQuery();

      while (rs.next()) {
        member = new JSPMemberDTO();
        member.setUserId(rs.getString("user_id"));
        member.setUserName(rs.getString("user_name"));
        member.setUserEmail(rs.getString("user_email"));
        member.setUserPhone(rs.getString("user_phone"));
        member.setUserAddress(rs.getString("user_addr"));
      }
    }
    catch (SQLException e) {
      System.out.println("데이터 조회 중 오류가 발생했습니다.");
      e.printStackTrace();
    }

    return member;
  }

//  회원 가입
  public int insertMember(JSPMemberDTO member) {

    int result = 0;

    try {
      String sql = "INSERT INTO jspmember ";
      sql += "(user_id, user_pw, user_name, user_email, user_phone, user_addr) ";
      sql += "VALUES (?, ?, ?, ?, ?, ?) ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, member.getUserId());
      pstmt.setString(2, member.getUserPw());
      pstmt.setString(3, member.getUserName());
      pstmt.setString(4, member.getUserEmail());
      pstmt.setString(5, member.getUserPhone());
      pstmt.setString(6, member.getUserAddress());

      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("데이터 추가 중 오류가 발생했습니다.");
      e.printStackTrace();
    }

    return result;
  }

//  회원 정보 수정
  
//  회원 탈퇴
}












