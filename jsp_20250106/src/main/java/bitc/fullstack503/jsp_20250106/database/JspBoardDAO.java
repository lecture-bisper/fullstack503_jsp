package bitc.fullstack503.jsp_20250106.database;

import jakarta.servlet.ServletContext;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JspBoardDAO extends DBConnect {

  public JspBoardDAO() {
    super();
  }

  public JspBoardDAO(ServletContext app) {
    super(app);
  }

  public JspBoardDAO(String dbDriver, String dbUrl, String dbUser, String dbPass) {
    super(dbDriver, dbUrl, dbUser, dbPass);
  }

//  게시글 전체 목록 조회
  public List<JspBoardDTO> selectBoardList() {
    List<JspBoardDTO> boardList = new ArrayList<>();

    try {
      String sql = "SELECT board_idx, board_title, board_create_id, board_create_date, ";
      sql += "board_count, board_like ";
      sql += "FROM jspboard ";
      sql += "WHERE delete_yn = 'N' ";
      sql += "ORDER BY board_idx DESC ";

      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);

      while (rs.next()) {
        int boardIdx = rs.getInt("board_idx");
        String boardTitle = rs.getString("board_title");
        String boardCreateId = rs.getString("board_create_id");
        String boardCreateDate = rs.getString("board_create_date");
        int boardCount = rs.getInt("board_count");
        int boardLike = rs.getInt("board_like");

        JspBoardDTO board = new JspBoardDTO();
        board.setBoardIdx(boardIdx);
        board.setBoardTitle(boardTitle);
        board.setBoardCreateId(boardCreateId);
        board.setBoardCreateDate(boardCreateDate);
        board.setBoardCount(boardCount);
        board.setBoardLike(boardLike);

        boardList.add(board);
      }
    }
    catch (SQLException e) {
      System.out.println("데이터베이스 조회 중 오류가 발생했습니다.");
      System.out.println("SQLException : " + e.getMessage());
    }

    return boardList;
  }
  
//  게시글 상세 보기
  public JspBoardDTO selectBoardDetail(int boardIdx) {

    JspBoardDTO board = new JspBoardDTO();

    try {
      String sql = "SELECT board_idx, board_title, board_content, board_create_id, board_create_date, ";
      sql += "board_update_date, board_count, board_like ";
      sql += "FROM jspboard ";
      sql += "WHERE board_idx = ? ";
      sql += "AND delete_yn = 'N' ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, boardIdx);

      rs = pstmt.executeQuery();

      while (rs.next()) {
        board.setBoardIdx(rs.getInt("board_idx"));
        board.setBoardTitle(rs.getString("board_title"));
        board.setBoardContent(rs.getString("board_content"));
        board.setBoardCreateId(rs.getString("board_create_id"));
        board.setBoardCreateDate(rs.getString("board_create_date"));
        board.setBoardUpdateDate(rs.getString("board_update_date"));
        board.setBoardCount(rs.getInt("board_count"));
        board.setBoardLike(rs.getInt("board_like"));
      }
    }
    catch (SQLException e) {
      System.out.println("데이터 조회 중 오류가 발생했습니다.");
      System.out.println("SQLException : " + e.getMessage());
    }

    return board;
  }
  
//  게시글 등록
  public int insertBoard(JspBoardDTO board) {

    int result = 0;

    try {
      String sql = "INSERT INTO jspboard ";
      sql += "(board_title, board_content, board_create_id, board_create_date) ";
      sql += "VALUES (?, ?, ?, now()) ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, board.getBoardTitle());
      pstmt.setString(2, board.getBoardContent());
      pstmt.setString(3, board.getBoardCreateId());

      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("데이터베이스에 데이터 추가 중 오류가 발생했습니다.");
      System.out.println("SQLException : " + e.getMessage());
    }

    return result;
  }
  
//  게시글 수정
  public int updateBoard(int boardIdx, String title, String content) {

    int result = 0;

    try {
      String sql = "UPDATE jspboard ";
      sql += "SET board_title = ?, board_content = ?, board_update_date = now() ";
      sql += "WHERE board_idx = ? ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, title);
      pstmt.setString(2, content);
      pstmt.setInt(3, boardIdx);

      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("데이터 수정 중 오류가 발생했습니다.");
      System.out.println("SQLException : " + e.getMessage());
    }

    return result;
  }
  
//  게시글 삭제
  public int deleteBoard(int boardIdx) {

    int result = 0;

    try {
      String sql = "UPDATE jspboard SET delete_yn = 'Y' WHERE board_idx = ? ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, boardIdx);

      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("데이터 삭제 중 오류가 발생했습니다.");
      System.out.println("SQLException : " + e.getMessage());
    }

    return result;
  }
  
//  조회수 업데이트
  public void updateBoardCount(int boardIdx) {

    try {
      String sql = "UPDATE jspboard SET board_count = board_count + 1 WHERE board_idx = ? ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, boardIdx);

      pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("데이터 수정 중 오류가 발생했습니다.");
      System.out.println("SQLException : " + e.getMessage());
    }
  }
  
//  추천수 업데이트
}












