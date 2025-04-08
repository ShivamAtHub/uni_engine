public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private String rollNo;
    private Integer universityId; // Can be null if not selected

    public User() {}

    public User(String name, String email, String password, String rollNo, Integer universityId) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.rollNo = rollNo;
        this.universityId = universityId;
    }

    // Getters & Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public String getRollNo() {
        return rollNo;
    }
    public void setRollNo(String rollNo) {
        this.rollNo = rollNo;
    }

    public Integer getUniversityId() {
        return universityId;
    }
    public void setUniversityId(Integer universityId) {
        this.universityId = universityId;
    }
}
