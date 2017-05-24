package com.model;

import java.sql.*;

/**
 * Created by anand38 on 7/5/17.
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
        int count=0;
        String sql="select count(*) as count from CANDIDATE where email=? and password=?";
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
            String sql="select name from CANDIDATE where email=?";
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
}
