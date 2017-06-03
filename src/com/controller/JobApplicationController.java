package com.controller;

import com.model.JobOperation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by anand38 on 3/6/17.
 */
public class JobApplicationController extends HttpServlet {
    static ArrayList<String> list=new ArrayList();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if(action.equalsIgnoreCase("applyjob")){
            String job_id=request.getParameter("job_id");
            String flag="0";
            JobOperation jb=new JobOperation();
            boolean status=false;
            try {
                status=jb.check_if_already_applied(job_id,(String)request.getSession().getAttribute("session_email"));

            if (status){
                flag="1";
            }else{
                System.out.println("Applied for:"+job_id);
                jb.apply_for_job(job_id, (String) request.getSession().getAttribute("session_email"));
            }
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            response.setContentType("text/plain");
            response.getWriter().write(flag);
        }
    }
}
