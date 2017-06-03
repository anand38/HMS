package com.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.*;
import java.util.HashMap;

/**
 * Created by anand38 on 7/5/2017
 * This class does database operations for login and registration for HR as well as Candidates
 */
public class Account {
    String user = "root";
    String pass="";
    String url="jdbc:mysql://localhost:3306/";
    String dbname="HRM";
    String driver="com.mysql.jdbc.Driver";
    Connection con;
    private void dbConnect() throws ClassNotFoundException, SQLException {
        Class.forName(driver);
        con = DriverManager.getConnection(url+dbname,user,pass);
    }

    private void dbClose() throws SQLException{
        con.close();
    }


    public boolean doHRLogin(String email, String password) throws SQLException, ClassNotFoundException {
        dbConnect();
        int count=0;
        String sql="select count(*) as count from HR where email=? and password=?";
        PreparedStatement pstmt=con.prepareStatement(sql);
        pstmt.setString(1,email);
        pstmt.setString(2,password);
        ResultSet rst=pstmt.executeQuery();
        while (rst.next()){
            count=rst.getInt("count");
        }
        dbClose();
        if (count==0)
            return false;
        else
            return true;
    }

    public boolean doCandidateLogin(String email,String password) throws SQLException, ClassNotFoundException {
        dbConnect();
        int flag=0;
        String sql="select * from CANDIDATE_LOGIN where email=? and password=?";
        PreparedStatement pstmt=con.prepareStatement(sql);
        pstmt.setString(1,email);
        pstmt.setString(2,password);
        ResultSet rst=pstmt.executeQuery();

        if (rst.next()){
            flag=1;
        }else
            flag=0;
        dbClose();
        return flag==1;
    }

    public String getName(String email, String loginas) throws SQLException, ClassNotFoundException {
        dbConnect();
        String name=null;
        if (loginas.equalsIgnoreCase("hr")){
            String sql="select name from HR where email=?";
            PreparedStatement pstmt=con.prepareStatement(sql);
            pstmt.setString(1,email);
            ResultSet rst=pstmt.executeQuery();
            while (rst.next()){
                name=rst.getString("name");
            }
        }else if (loginas.equalsIgnoreCase("candidate")){
            String sql="select name from CANDIDATE_PERSONAL where candidate_id=(select candidate_id from CANDIDATE_LOGIN where email=?)";
            PreparedStatement pstmt=con.prepareStatement(sql);
            pstmt.setString(1,email);
            ResultSet rst=pstmt.executeQuery();
            while (rst.next()){
                name=rst.getString("name");
            }
        }
        dbClose();
        return name;
    }


    public void registerCandidate(String email, String password, String highest_degree, String college_name, String course, String specialization, String yop, String name, String gender, String dob, String contact, String resume) throws SQLException, ClassNotFoundException, FileNotFoundException {
    dbConnect();

    String path="/home/anand38/ZVersions/HR1/web/Uploads/Candidate/";
    File file=new File(path+resume);
    InputStream inputStream = new FileInputStream(file);

     String loginupdate="INSERT INTO CANDIDATE_LOGIN(email,password) values(?,?)";

     String educationupdate="INSERT INTO CANDIDATE_EDUCATION(candidate_id,highest_degree,college_name,course,specialization,year_of_passing,resume)" +
            "VALUES(LAST_INSERT_ID(),?,?,?,?,?,?)";

     String personalupdate="INSERT INTO CANDIDATE_PERSONAL(candidate_id,name,gender,dob,contact)" +
            "VALUES(LAST_INSERT_ID(),?,?,?,?)";
    PreparedStatement pstmtlogin=con.prepareStatement(loginupdate);
    pstmtlogin.setString(1,email);
    pstmtlogin.setString(2,password);
    pstmtlogin.executeUpdate();

    PreparedStatement pstmteducation=con.prepareStatement(educationupdate);
    pstmteducation.setString(1,highest_degree);
    pstmteducation.setString(2,college_name);
    pstmteducation.setString(3,course);
    pstmteducation.setString(4,specialization);
    pstmteducation.setString(5,yop);
    pstmteducation.setBlob(6,inputStream);
    pstmteducation.executeUpdate();

    PreparedStatement pstmtpersonal=con.prepareStatement(personalupdate);
    pstmtpersonal.setString(1,name);
    pstmtpersonal.setString(2,gender);
    pstmtpersonal.setString(3,dob);
    pstmtpersonal.setString(4,contact);
    pstmtpersonal.executeUpdate();

    dbClose();
    }

    public HashMap<String,String> get_Educational_and_personal_details(String session_email) throws SQLException, ClassNotFoundException {
        dbConnect();
        HashMap<String,String> map=new HashMap<>();

        //Educational Details Retrieval
        String educationaldetailsql="select * from CANDIDATE_EDUCATION where candidate_id=(select candidate_id from CANDIDATE_LOGIN where email=?)";
        PreparedStatement pstmt1=con.prepareStatement(educationaldetailsql);
        pstmt1.setString(1,session_email);
        ResultSet rst1=pstmt1.executeQuery();
        while (rst1.next()){
            map.put("highest_degreee", rst1.getString("highest_degree"));
            map.put("college_name",rst1.getString("college_name"));
            map.put("course", rst1.getString("course"));
            map.put("specialization", rst1.getString("specialization"));
            map.put("year_of_passing", rst1.getString("year_of_passing"));
        }

        String personaldetailsql="select * from CANDIDATE_PERSONAL where candidate_id=(select candidate_id from CANDIDATE_LOGIN where email=?)";
        PreparedStatement pstmt2=con.prepareStatement(personaldetailsql);
        pstmt2.setString(1,session_email);
        ResultSet rst2=pstmt2.executeQuery();
        while (rst2.next()){
            map.put("name",rst2.getString("name"));
            map.put("gender",rst2.getString("gender"));
            map.put("dob",rst2.getString("dob"));
            map.put("contact",rst2.getString("contact"));
        }
        System.out.println("Map:"+map);
        dbClose();
        return map;
    }

    public void updateCandidateDetails(String session_email, String highest_degree, String college_name, String course, String specialization, String yop, String name, String gender, String dob, String contact, String resume) throws SQLException, ClassNotFoundException, FileNotFoundException {
        dbConnect();
        String path="/home/anand38/ZVersions/HR1/web/Uploads/Candidate/";
        File file=new File(path+resume);
        InputStream inputStream = new FileInputStream(file);

        String educationalsql="update CANDIDATE_EDUCATION set highest_degree=?,college_name=?,course=?, specialization=?, year_of_passing=?, resume=? where candidate_id=(select candidate_id from CANDIDATE_LOGIN where email=?)";
        PreparedStatement pstmt1=con.prepareStatement(educationalsql);
        pstmt1.setString(1,highest_degree);
        pstmt1.setString(2,college_name);
        pstmt1.setString(3,course);
        pstmt1.setString(4,specialization);
        pstmt1.setString(5,yop);
        pstmt1.setBlob(6,inputStream);
        pstmt1.setString(7,session_email);
        pstmt1.executeUpdate();

        String personalsql="update CANDIDATE_PERSONAL set name=?,gender=?,dob=?,contact=? where candidate_id=(select candidate_id from CANDIDATE_LOGIN where email=?)";
        PreparedStatement pstmt2=con.prepareStatement(personalsql);
        pstmt2.setString(1,name);
        pstmt2.setString(2,gender);
        pstmt2.setString(3,dob);
        pstmt2.setString(4,contact);
        pstmt2.setString(5,session_email);
        pstmt2.executeUpdate();
        dbClose();
    }
}
