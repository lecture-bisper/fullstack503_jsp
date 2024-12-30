package bitc.fullstack503.jsp_20241230;

// jsp 파일에서 사용할 Person 클래스 선언
public class Person {

//  필드
  private String name;
  private int age;

//  기본 생성자
  public Person() {}

//  매개변수가 있는 생성자
  public Person(String name, int age) {
    super();
    this.name = name;
    this.age = age;
  }

//  Getter/Setter
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getAge() {
    return age;
  }

  public void setAge(int age) {
    this.age = age;
  }
}












