package bitc.fullstack503.jsp_20250110.database;

import jakarta.servlet.ServletContext;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class JSPBoardFileDAO extends JDBConnect {

  public JSPBoardFileDAO() {
    super();
  }

  public JSPBoardFileDAO(ServletContext application) {
    super(application);
  }

  public JSPBoardFileDAO(String dbDriver, String dbUrl, String dbUser, String dbPass) {
    super(dbDriver, dbUrl, dbUser, dbPass);
  }

//  데이터베이스에 파일 정보 추가
  public int insertFile(JSPBoardFileDTO file) {
    int result = 0;

    try {
      String sql = "INSERT INTO jspboardfile (title, cate, ofile, sfile, postdate) ";
      sql += "VALUES (?, ?, ?, ?, now()) ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, file.getTitle());
      pstmt.setString(2, file.getCate());
      pstmt.setString(3, file.getOfile());
      pstmt.setString(4, file.getSfile());

      result = pstmt.executeUpdate();
    } catch (Exception e) {
      e.printStackTrace();
    }

    return result;
  }

//  데이터베이스 저장된 파일 목록 조회
  public List<JSPBoardFileDTO> selectFileList() {
    List<JSPBoardFileDTO> fileList = new ArrayList<JSPBoardFileDTO>();

    try {
      String sql = "SELECT idx, title, cate, ofile, sfile, postdate FROM jspboardfile ";
      sql += "ORDER BY idx DESC ";

      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);

      while (rs.next()) {
        JSPBoardFileDTO file = new JSPBoardFileDTO();
        file.setIdx(rs.getInt("idx"));
        file.setTitle(rs.getString("title"));
        file.setCate(rs.getString("cate"));
        file.setOfile(rs.getString("ofile"));
        file.setSfile(rs.getString("sfile"));
        file.setPostDate(rs.getString("postdate"));

        fileList.add(file);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }

    return fileList;
  }
}












