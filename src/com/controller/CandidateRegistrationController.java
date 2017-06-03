//This servlet is responsible to handle candidate registration and upload his/her resume


package com.controller;

import com.model.Account;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

public class CandidateRegistrationController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart){
            String email="";
            String password="";
            String highest_degree="";
            String college_name="";
            String course="";
            String specialization="";
            String monthofyop="";
            String yearofyop="";
            String name="";
            String gender="";
            String dob="";
            String contact="";
            String resume="";

            String UPLOAD_DIRECTORY="/home/anand38/ZVersions/HR1/web/Uploads/Candidate"; //Directory name here
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List items = null;
            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
            Iterator itr = items.iterator();
            while (itr.hasNext()) {
                FileItem item = (FileItem) itr.next();
                if (item.isFormField()) {

                    //Form data here

                    if (item.getFieldName().equalsIgnoreCase("email")){
                        email=item.getString();
                    }
                    if (item.getFieldName().equalsIgnoreCase("password")){
                        password=item.getString();
                    }
                    if (item.getFieldName().equalsIgnoreCase("highest_degree")){
                        highest_degree=item.getString();
                    }
                    if (item.getFieldName().equalsIgnoreCase("college_name")){
                        college_name=item.getString();
                    }
                    if (item.getFieldName().equalsIgnoreCase("course")){
                        course=item.getString();
                    }
                    if (item.getFieldName().equalsIgnoreCase("specialization")){
                        specialization=item.getString();
                    }
                    if (item.getFieldName().equalsIgnoreCase("monthofyop")){
                        monthofyop=item.getString();
                    }
                    if (item.getFieldName().equalsIgnoreCase("yearofyop")){
                        yearofyop=item.getString();
                    }
                    if (item.getFieldName().equalsIgnoreCase("name")){
                        name=item.getString();
                    }
                    if (item.getFieldName().equalsIgnoreCase("gender")){
                        gender=item.getString();
                    }
                    if (item.getFieldName().equalsIgnoreCase("dob")){
                        dob=item.getString();
                    }
                    if (item.getFieldName().equalsIgnoreCase("contact")){
                        contact=item.getString();
                    }

                } else {
                    try {
                        resume= item.getName();
                        System.out.println("Itemname:"+resume);
                        File savedFile = new File(UPLOAD_DIRECTORY +File.separator + resume);
                        item.write(savedFile);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }

            //enter data in database
            Account account = new Account();
            try {
                account.registerCandidate(email, password, highest_degree,college_name, course,
                        specialization, monthofyop + " " + yearofyop, name, gender, dob, contact,resume);
            } catch (Exception e) {
                e.printStackTrace();
            }
            account=null;
            File f=new File("/home/anand38/ZVersions/HR1/web/Uploads/Candidate/"+resume);
            try{
                if (f.delete())
                    System.out.println("File deleted");
                else System.out.println("File not deleted");
            }catch(Exception e){
                e.printStackTrace();
            }
            request.getRequestDispatcher("index.jsp").forward(request, response);
            System.out.println(email+password+highest_degree+college_name+course+specialization+monthofyop+yearofyop+name+gender+dob+contact);
        }

    }
}
