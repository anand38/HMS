package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by anand38 on 24/5/17.
 * This class does all database operation except login and signup for HR and Candidates
 */
public class JobOperation {
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


    public void insertPost(int randomId, String position, String salary, String location, String opening, String eligibility, String description, String stringdate) throws SQLException, ClassNotFoundException {
    dbConnect();
    String sql="insert into JOB values(?,?,?,?,?,?,?,?)";
    PreparedStatement pstmt=con.prepareStatement(sql);
    pstmt.setInt(1,randomId);
    pstmt.setString(2,position);
    pstmt.setString(3,salary);
    pstmt.setString(4,location);
    pstmt.setString(5,opening);
    pstmt.setString(6,eligibility);
    pstmt.setString(7,description);
    pstmt.setString(8,stringdate);
    pstmt.executeUpdate();
    dbClose();
    }
}
