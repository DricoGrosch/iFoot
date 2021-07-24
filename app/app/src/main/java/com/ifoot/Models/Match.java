package Models;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class Match {
    private String location;
    private float latidude;
    private float longitude;
    private DateTimeFormatter date;
    private ArrayList<User> users;


    public Match(String location, float latidude, float longitude, DateTimeFormatter date) {
        this.location = location;
        this.latidude = latidude;
        this.longitude = longitude;
        this.date = date;
    }

    public String getLocation() {
        return location;
    }

    public void addUser(User user){
        this.users.add(user);
    }

    public void removeUser(User user){
        this.users.remove(user);
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public float getLatidude() {
        return latidude;
    }

    public void setLatidude(float latidude) {
        this.latidude = latidude;
    }

    public float getLongitude() {
        return longitude;
    }

    public void setLongitude(float longitude) {
        this.longitude = longitude;
    }

    public DateTimeFormatter getDate() {
        return date;
    }

    public void setDate(DateTimeFormatter date) {
        this.date = date;
    }

    public ArrayList<User> getUsers() {
        return users;
    }

    public void setUsers(ArrayList<User> users) {
        this.users = users;
    }


}
