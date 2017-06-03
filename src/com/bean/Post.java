package com.bean;

import java.io.Serializable;

/**
 * Created by anand38 on 24/5/17.
 */
public class Post implements Serializable {
    public Post(){

    }
    private String jobid;
    private String position;
    private String salary;
    private String location;
    private String openings;
    private String eligibility;
    private String description;
    private String date_of_post;
    //Getters
    public String getJobid() {
        return jobid;
    }

    public String getPosition() {
        return position;
    }

    public String getSalary() {
        return salary;
    }

    public String getLocation() {
        return location;
    }

    public String getOpenings() {
        return openings;
    }

    public String getEligibility() {
        return eligibility;
    }

    public String getDescription() {
        return description;
    }

    public String getDate_of_post() {
        return date_of_post;
    }

    //setters

    public void setJobid(String jobid) {
        this.jobid = jobid;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setOpenings(String openings) {
        this.openings = openings;
    }

    public void setEligibility(String eligibility) {
        this.eligibility = eligibility;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setDate_of_post(String date_of_post) {
        this.date_of_post = date_of_post;
    }
}
