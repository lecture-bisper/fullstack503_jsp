package bitc.fullstack503.jspmemberboard.database;

public class JSPBoardDTO {

  private int boardIdx;
  private String boardTitle;
  private String boardContent;
  private String boardCreateId;
  private String boardCreateDate;
  private String boardUpdateDate;
  private int boardViewCount;
  private int boardLikeCount;

  public JSPBoardDTO() {}

  public JSPBoardDTO(int boardIdx, String boardTitle, String boardContent, String boardCreateId, String boardCreateDate, String boardUpdateDate, int boardViewCount, int boardLikeCount) {
    this.boardIdx = boardIdx;
    this.boardTitle = boardTitle;
    this.boardContent = boardContent;
    this.boardCreateId = boardCreateId;
    this.boardCreateDate = boardCreateDate;
    this.boardUpdateDate = boardUpdateDate;
    this.boardViewCount = boardViewCount;
    this.boardLikeCount = boardLikeCount;
  }

  public int getBoardIdx() {
    return boardIdx;
  }

  public void setBoardIdx(int boardIdx) {
    this.boardIdx = boardIdx;
  }

  public String getBoardTitle() {
    return boardTitle;
  }

  public void setBoardTitle(String boardTitle) {
    this.boardTitle = boardTitle;
  }

  public String getBoardContent() {
    return boardContent;
  }

  public void setBoardContent(String boardContent) {
    this.boardContent = boardContent;
  }

  public String getBoardCreateId() {
    return boardCreateId;
  }

  public void setBoardCreateId(String boardCreateId) {
    this.boardCreateId = boardCreateId;
  }

  public String getBoardCreateDate() {
    return boardCreateDate;
  }

  public void setBoardCreateDate(String boardCreateDate) {
    this.boardCreateDate = boardCreateDate;
  }

  public String getBoardUpdateDate() {
    return boardUpdateDate;
  }

  public void setBoardUpdateDate(String boardUpdateDate) {
    this.boardUpdateDate = boardUpdateDate;
  }

  public int getBoardViewCount() {
    return boardViewCount;
  }

  public void setBoardViewCount(int boardViewCount) {
    this.boardViewCount = boardViewCount;
  }

  public int getBoardLikeCount() {
    return boardLikeCount;
  }

  public void setBoardLikeCount(int boardLikeCount) {
    this.boardLikeCount = boardLikeCount;
  }
}












