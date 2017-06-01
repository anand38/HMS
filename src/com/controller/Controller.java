package com.controller;

import com.bean.Post;
import com.model.JobID;
import com.model.JobOperation;
import jdk.nashorn.api.scripting.JSObject;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.*;

public class Controller extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if (action==null)
            request.getRequestDispatcher("index.jsp").forward(request,response);
        else doPost(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if (action.equalsIgnoreCase("frompostjob")){
            String position=request.getParameter("position").trim();
            String salary=request.getParameter("salary").trim();
            String location=request.getParameter("location").trim();
            String eligibility=request.getParameter("eligibility").trim();
            String description=request.getParameter("description").trim();
            String opening=request.getParameter("opening").trim();


            /* To calculate time of post*/
            DateFormat df=DateFormat.getDateInstance(DateFormat.MEDIUM,new Locale("en"));
            Date date=new Date();
            String stringdate=df.format(date);

            int randomId=JobID.getID(position);

            JobOperation jb=new JobOperation();
            try {
                jb.insertPost(randomId, position, salary, location, opening, eligibility, description, stringdate);
            }catch (Exception e){
                e.printStackTrace();
            }
            jb=null;
            response.setContentType("text/plain");
            response.getWriter().write("Post Successful");
        }

        if (action.equalsIgnoreCase("gotohrregister")){
            request.getRequestDispatcher("HR/register.jsp").forward(request,response);
        }
        if (action.equalsIgnoreCase("gotocandidateregister")){
            request.getRequestDispatcher("Candidate/register.jsp").forward(request,response);
        }

    }

}
