package com.model;

import com.bean.Post;

import java.sql.*;
import java.util.ArrayList;

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
    String sql="insert into JOB(job_id,position,salary,location,openings,eligibility,description,date_of_post) values(?,?,?,?,?,?,?,?)";
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

    public ArrayList<Post> getPosts() throws SQLException, ClassNotFoundException {
        ArrayList<Post> list=new ArrayList();
        dbConnect();
        String sql="select * from JOB";
        PreparedStatement pstmt=con.prepareStatement(sql);
        ResultSet rst=pstmt.executeQuery();
        while (rst.next()){
        Post p=new Post();
        p.setJobid(rst.getInt("job_id"));
        p.setPosition(rst.getString("position"));
        p.setSalary(rst.getString("salary"));
        p.setLocation(rst.getString("location"));

        String temp=rst.getString("eligibility").replace("\r\n","<BR>");
        String eligibility=temp.replace("\n","<BR>");
        p.setEligibility(eligibility);

        temp=rst.getString("description").replace("\r\n","<BR>");
        String description=temp.replace("\n","<BR>");
        p.setDescription(description);

        p.setOpenings(rst.getString("openings"));
        p.setDate_of_post(rst.getString("date_of_post"));

        list.add(p);
        }
        dbClose();
        return list;
    }

    public ArrayList<Post> getqueryPost(String query) throws SQLException, ClassNotFoundException {
        dbConnect();
        ArrayList<Post> list=new ArrayList<>();
        String sql="select * from JOB where position like ?";
        PreparedStatement pstmt=con.prepareStatement(sql);
        pstmt.setString(1,"%"+query+"%");
        ResultSet rst=pstmt.executeQuery();
        while (rst.next()){
            Post p=new Post();
            p.setJobid(rst.getInt("job_id"));
            p.setPosition(rst.getString("position"));
            p.setSalary(rst.getString("salary"));
            p.setLocation(rst.getString("location"));

            String temp=rst.getString("eligibility").replace("\r\n","<BR>");
            String eligibility=temp.replace("\n","<BR>");
            p.setEligibility(eligibility);

            temp=rst.getString("description").replace("\r\n","<BR>");
            String description=temp.replace("\n","<BR>");
            p.setDescription(description);

            p.setOpenings(rst.getString("openings"));
            p.setDate_of_post(rst.getString("date_of_post"));

            list.add(p);
        }

        dbClose();
        return list;
    }
}
