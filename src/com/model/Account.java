package com.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.*;

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


    public void registerCandidate(String email, String password, String highest_degree, String course, String specialization, String yop, String name, String gender, String dob, String contact, String resume) throws SQLException, ClassNotFoundException, FileNotFoundException {
    dbConnect();

    String path="/home/anand38/ZVersions/HR1/web/Uploads/Candidate/";
    File file=new File(path+resume);
    InputStream inputStream = new FileInputStream(file);

     String loginupdate="INSERT INTO CANDIDATE_LOGIN(email,password) values(?,?)";

     String educationupdate="INSERT INTO CANDIDATE_EDUCATION(candidate_id,highest_degree,course,specialization,year_of_passing,resume)" +
            "VALUES(LAST_INSERT_ID(),?,?,?,?,?)";

     String personalupdate="INSERT INTO CANDIDATE_PERSONAL(candidate_id,name,gender,dob,contact)" +
            "VALUES(LAST_INSERT_ID(),?,?,?,?)";
    PreparedStatement pstmtlogin=con.prepareStatement(loginupdate);
    pstmtlogin.setString(1,email);
    pstmtlogin.setString(2,password);
    pstmtlogin.executeUpdate();

    PreparedStatement pstmteducation=con.prepareStatement(educationupdate);
    pstmteducation.setString(1,highest_degree);
    pstmteducation.setString(2,course);
    pstmteducation.setString(3,specialization);
    pstmteducation.setString(4,yop);
    pstmteducation.setBlob(5,inputStream);
    pstmteducation.executeUpdate();

    PreparedStatement pstmtpersonal=con.prepareStatement(personalupdate);
    pstmtpersonal.setString(1,name);
    pstmtpersonal.setString(2,gender);
    pstmtpersonal.setString(3,dob);
    pstmtpersonal.setString(4,contact);
    pstmtpersonal.executeUpdate();

    dbClose();
    }

}
