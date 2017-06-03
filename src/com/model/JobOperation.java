package com.model;

import com.bean.Post;
import org.json.JSONArray;
import org.json.JSONObject;

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


    public void insertPost(String randomId, String position, String salary, String location, String opening, String eligibility, String description, String stringdate) throws SQLException, ClassNotFoundException {
    dbConnect();
    String sql="insert into JOB(job_id,position,salary,location,openings,eligibility,description,date_of_post) values(?,?,?,?,?,?,?,?)";
    PreparedStatement pstmt=con.prepareStatement(sql);
    pstmt.setString(1,randomId);
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
        p.setJobid(rst.getString("job_id"));
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
        p=null;
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
            p.setJobid(rst.getString("job_id"));
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
            p=null;
        }

        dbClose();
        return list;
    }

    public ArrayList<Post> get_recent_to_old_Post(String query) throws SQLException, ClassNotFoundException {
        dbConnect();
        ArrayList<Post> list=new ArrayList<>();
        String sql="select * from JOB where position like ? ORDER BY id DESC";
        PreparedStatement pstmt=con.prepareStatement(sql);
        pstmt.setString(1,"%"+query+"%");
        ResultSet rst=pstmt.executeQuery();
        while (rst.next()){
            Post p=new Post();
            p.setJobid(rst.getString("job_id"));
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
            p=null;
        }

        dbClose();
        return list;

    }


    public boolean check_if_already_applied(String job_id, String session_email) throws SQLException, ClassNotFoundException {
        dbConnect();
        int flag=1;
        String sql="select * from APPLICANTS where job_id=? and candidate_id =(select candidate_id from CANDIDATE_LOGIN where email =?)";
        PreparedStatement pstmt=con.prepareStatement(sql);
        pstmt.setString(1,job_id);
        pstmt.setString(2,session_email);
        ResultSet rst=pstmt.executeQuery();
        if (rst.next()){
        flag=0;   //Already applied
        }
        dbClose();
        return flag==0;
    }

    public void apply_for_job(String job_id, String session_email) throws SQLException, ClassNotFoundException {
        dbConnect();
        String sql="insert into APPLICANTS(job_id,candidate_id) values(?,(select candidate_id from CANDIDATE_LOGIN where email =?))";
        PreparedStatement pstmt=con.prepareStatement(sql);
        pstmt.setString(1,job_id);
        pstmt.setString(2,session_email);
        pstmt.executeUpdate();
        dbClose();
    }
    public JSONObject getAppliedJobPostsObject(String email) throws SQLException, ClassNotFoundException {
        dbConnect();
        String sql="select position,salary,location,openings,eligibility,description,date_of_post from JOB INNER JOIN APPLICANTS ON APPLICANTS.job_id=JOB.job_id WHERE APPLICANTS.candidate_id=(SELECT candidate_id from CANDIDATE_LOGIN WHERE email=?)";
        PreparedStatement pstmt=con.prepareStatement(sql);
        pstmt.setString(1,email);
        ResultSet rst=pstmt.executeQuery();
        ArrayList<Post> list=new ArrayList<>();
        while (rst.next()){
            Post p=new Post();
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
            p=null;
        }
        dbClose();
        JSONObject object = new JSONObject();
        try {
            JSONArray array = new JSONArray();
            for (Post p : list) {
                JSONObject j = new JSONObject();
                j.put("jobid", p.getJobid());
                j.put("position", p.getPosition());
                j.put("salary", p.getSalary());
                j.put("location", p.getLocation());
                j.put("openings", p.getOpenings());
                j.put("eligibility", p.getEligibility());
                j.put("description", p.getDescription());
                j.put("date_of_post", p.getDate_of_post());
                array.put(j);
            }
            object.put("posts", array);
        }catch (Exception e){
            e.printStackTrace();
        }
        return object;
    }
}
