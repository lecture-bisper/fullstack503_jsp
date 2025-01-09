package bitc.fullstack503.jspmemberboard.database;

import jakarta.servlet.ServletContext;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// jspboard 테이블의 조작하기 위한 클래스
public class JSPBoardDAO extends JDBConnect {

  public JSPBoardDAO() {
    super();
  }

  public JSPBoardDAO(ServletContext application) {
    super(application);
  }

  public JSPBoardDAO(String dbDriver, String dbUrl, String dbUser, String dbPass) {
    super(dbDriver, dbUrl, dbUser, dbPass);
  }

//  게시물 전체 목록 보기
  public List<JSPBoardDTO> selectBoardList() {

    List<JSPBoardDTO> boardList = new ArrayList<JSPBoardDTO>();

    try {
      String sql = "SELECT board_idx, board_title, board_create_id, board_create_date, board_count, board_like ";
      sql += "FROM jspboard ";
      sql += "WHERE deleted_yn = 'N' ";
      sql += "ORDER BY board_idx DESC ";

      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);

      while (rs.next()) {
        JSPBoardDTO board = new JSPBoardDTO();
        board.setBoardIdx(rs.getInt("board_idx"));
        board.setBoardTitle(rs.getString("board_title"));
        board.setBoardCreateId(rs.getString("board_create_id"));
        board.setBoardCreateDate(rs.getString("board_create_date"));
        board.setBoardViewCount(rs.getInt("board_count"));
        board.setBoardLikeCount(rs.getInt("board_like"));

        boardList.add(board);
      }
    }
    catch (SQLException e) {
      System.out.println("데이터 조회 중 오류가 발생했습니다.");
      e.printStackTrace();
    }

    return boardList;
  }

//  게시물 상세 보기
  public JSPBoardDTO selectBoardDetail(int boardIdx) {

    JSPBoardDTO board = null;

    try {
      String sql = "SELECT board_idx, board_title, board_content, board_create_id, board_create_date, ";
      sql += "board_update_date, board_count, board_like ";
      sql += "FROM jspboard ";
      sql += "WHERE board_idx = ? ";
      sql += "AND deleted_yn = 'N' ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, boardIdx);

      rs = pstmt.executeQuery();

      while (rs.next()) {
        board = new JSPBoardDTO();
        board.setBoardIdx(rs.getInt("board_idx"));
        board.setBoardTitle(rs.getString("board_title"));
        board.setBoardContent(rs.getString("board_content"));
        board.setBoardCreateId(rs.getString("board_create_id"));
        board.setBoardCreateDate(rs.getString("board_create_date"));
        board.setBoardUpdateDate(rs.getString("board_update_date"));
        board.setBoardViewCount(rs.getInt("board_count"));
        board.setBoardLikeCount(rs.getInt("board_like"));
      }
    }
    catch (SQLException e) {
      System.out.println("데이터 조회 중 오류가 발생했습니다.");
      e.printStackTrace();
    }

    return board;
  }

//  게시물 등록
  public int insertBoard(JSPBoardDTO board) {

    int result = 0;

    try {
      String sql = "INSERT INTO jspboard (board_title, board_content, board_create_id, board_create_date) ";
      sql += "VALUES (?, ?, ?, now()) ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, board.getBoardTitle());
      pstmt.setString(2, board.getBoardContent());
      pstmt.setString(3, board.getBoardCreateId());

      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("데이터 추가 중 오류가 발생했습니다.");
      e.printStackTrace();
    }

    return result;
  }

//  게시물 수정
  public int updateBoard(JSPBoardDTO board) {

    int result = 0;

    try {
      String sql = "UPDATE jspboard ";
      sql += "SET board_title = ?, board_content = ?, board_update_date = now() ";
      sql += "WHERE board_idx = ? ";
      sql += "AND deleted_yn = 'N' ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, board.getBoardTitle());
      pstmt.setString(2, board.getBoardContent());
      pstmt.setInt(3, board.getBoardIdx());

      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("데이터 수정 중 오류가 발생했습니다.");
      e.printStackTrace();
    }

    return result;
  }

//  게시물 삭제
  public int deleteBoard(int boardIdx) {

    int result = 0;

    try {
      String sql = "UPDATE jspboard SET deleted_yn = 'Y' WHERE board_idx = ? ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, boardIdx);

      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("데이터 삭제 중 오류가 발생했습니다.");
      e.printStackTrace();
    }

    return result;
  }

//  조회수 증가
  public void updateViewCount(int boardIdx) {

    try {
      String sql = "UPDATE jspboard SET board_count = board_count + 1 WHERE board_idx = ? ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, boardIdx);

      pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("데이터 수정 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
  }

//  추천수 증가
  public void updateLikeCount(int boardIdx) {

    try {
      String sql = "UPDATE jspboard SET board_like = board_like + 1 WHERE board_idx = ? ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, boardIdx);

      pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("데이터 수정 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
  }

}












