package bitc.fullstack503.jspmemberboard.database;

public class JSPMemberDTO {

  private String userId;
  private String userPw;
  private String userName;
  private String userEmail;
  private String userPhone;
  private String userAddress;

  public JSPMemberDTO() {}

  public JSPMemberDTO(String userId, String userPw, String userName, String userEmail, String userPhone, String userAddress) {
    this.userId = userId;
    this.userPw = userPw;
    this.userName = userName;
    this.userEmail = userEmail;
    this.userPhone = userPhone;
    this.userAddress = userAddress;
  }

  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

  public String getUserPw() {
    return userPw;
  }

  public void setUserPw(String userPw) {
    this.userPw = userPw;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getUserEmail() {
    return userEmail;
  }

  public void setUserEmail(String userEmail) {
    this.userEmail = userEmail;
  }

  public String getUserPhone() {
    return userPhone;
  }

  public void setUserPhone(String userPhone) {
    this.userPhone = userPhone;
  }

  public String getUserAddress() {
    return userAddress;
  }

  public void setUserAddress(String userAddress) {
    this.userAddress = userAddress;
  }
}












