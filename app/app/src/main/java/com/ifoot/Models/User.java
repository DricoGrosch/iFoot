package Models;

public class User {
    private String userName;
    private String password;
    private String firstName;


    public User(String userName, String password, String firstName) {
        this.userName = userName;
        this.password = password;
        this.firstName = firstName;
    }


    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
}
