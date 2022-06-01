package com.example.examplejee;

public class User {
    private String name, mail, password;
    private int note;
    public User(String name, String mail, String password) {
        this.name = name;
        this.mail = mail;
        this.password = password;
    }

    public User(int note){
        this.note = note;
    }
    public String getName() {
        return name;
    }

    public String getMail() {
        return mail;
    }

    public int getNote() {
        return note;
    }

    public String getPassword() {
        return password;
    }
}
