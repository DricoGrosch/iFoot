package com.ifoot.Models;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.sql.Time;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;


public class Match {
    private String location;
    private float latidude;
    private float longitude;
    private Date date;
    private ArrayList<User> users;


    public Match(String location, Date date) {
        this.location = location;
        this.date = date;
    }

    public String getLocation() {
        return location;
    }

    public void addUser(User user) {
        this.users.add(user);
    }

    public void removeUser(User user) {
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public ArrayList<User> getUsers() {
        return users;
    }

    public void setUsers(ArrayList<User> users) {
        this.users = users;
    }

    @Override
    public String toString() {
        return location + '\'' +
                ", date=" + date +
                '}';
    }
}
