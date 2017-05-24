package com.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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


            response.setContentType("text/plain");
            response.getWriter().write(position+" "+salary+" "+location+" "+eligibility+" "+description+" "+opening);
        }

    }
}
