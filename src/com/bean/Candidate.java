package com.bean;

/**
 * Created by anand38 on 7/5/17.
 */
public class Candidate extends Parent{
    private String name;
    private String email;
    private String password;
    public Candidate(){

    }
    public Candidate(String email,String password){
        this.email=email;
        this.password=password;
    }

    public String getEmail() {
        return email;
    }
    public String getName(){ return name; }

    public String getPassword() {
        return password;
    }
}
