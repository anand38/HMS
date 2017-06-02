package com.controller;

import com.bean.Candidate;
import com.bean.HR;
import com.bean.JsonProvider;
import com.bean.Parent;
import com.model.Account;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * Created by anand38 on 7/5/17.
 */
public class AccountController extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        HttpSession session=request.getSession();
        if(action==null){
            Parent p=checkCookie(request);
            HR hr=null;
            Candidate c=null;
            String loginas="";
            if (p==null){
                System.out.println("No cookie found");
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }else {
                Account account=new Account();
                if (p instanceof HR){
                    loginas="hr";
                    hr=new HR(((HR) p).getEmail(),((HR) p).getPassword());
                }else if (p instanceof Candidate){
                    loginas="candidate";
                    c=new Candidate(((Candidate) p).getEmail(),((Candidate) p).getPassword());
                }
                if (loginas.equalsIgnoreCase("hr")){
                    boolean status=false;
                    try {
                        status=account.doHRLogin(hr.getEmail(), hr.getPassword());
                        if (status){
                            String name=account.getName(hr.getEmail(),loginas);
                            session.setAttribute("session_flag","101"); // flag will be 101 if user logged in
                            session.setAttribute("session_name",name);
                            session.setAttribute("session_email",hr.getEmail());
                            request.getRequestDispatcher("/HR/landing.jsp").forward(request,response);
                        }
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                }else if (loginas.equalsIgnoreCase("Candidate")){
                    boolean status=false;
                    try {
                        status=account.doCandidateLogin(c.getEmail(),c.getPassword());
                        if (status){
                            String name=account.getName(c.getEmail(),loginas);
                            session.setAttribute("session_flag","101"); // flag will be 101 if user logged in
                            session.setAttribute("session_name",name);
                            session.setAttribute("session_email",c.getEmail());
                            request.getRequestDispatcher("/Candidate/landing.jsp").forward(request,response);
                        }
                    }catch (Exception e){
                        e.printStackTrace();
                    }

                }
            }
        }
        else
            doPost(request,response);

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String  action=request.getParameter("action");
        HttpSession session=request.getSession();
        Account account=new Account();
        if (action.equals("fromlogin")){
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            //String password= BCrypt.hashpw(request.getParameter("password"), BCrypt.gensalt());
            boolean remember=request.getParameter("remember")!=null;
            String loginas=request.getParameter("loginas");

            if (loginas.equalsIgnoreCase("hr")){
                boolean status=false;
                try {
                    status=account.doHRLogin(email, password);
                    if (status){
                        if (remember) {  //If user checks on Remember me we create cookie and save login information
                            createCookie(response,email,password,loginas); //call to method which creates cookies
                        }
                        System.out.println("HR Logged in");
                        String name=account.getName(email,loginas);
                        session.setAttribute("session_flag","101"); // flag will be 101 if user logged in
                        session.setAttribute("session_name",name);
                        session.setAttribute("session_email",email);
                        request.getRequestDispatcher("/HR/landing.jsp").forward(request,response);
                    }

                }catch (Exception e){
                    e.printStackTrace();
                }
            }else if (loginas.equalsIgnoreCase("Candidate")){
                boolean status=false;
                try {
                    status = account.doCandidateLogin(email, password);
                    if (status){
                        if (remember) {  //If user checks on Remember me we create cookie and save login information
                            createCookie(response,email,password,loginas); //call to method which creates cookies
                        }
                        System.out.println("Candidate Logged in");
                        String name=account.getName(email,loginas);
                        session.setAttribute("session_flag","101"); // flag will be 101 if user logged in
                        session.setAttribute("session_name",name);
                        session.setAttribute("session_email",email);
                        request.getRequestDispatcher("/Candidate/landing.jsp").forward(request,response);
                    }else {
                        request.getRequestDispatcher("index.jsp").forward(request,response);
                    }

                }catch (Exception e){
                    e.printStackTrace();
                }
            }//end of else if

        }//End of if

        if (action.equals("logout")){
            session.removeAttribute("session_flag");
            session.removeAttribute("session_name");
            session.removeAttribute("session_email");
            session.invalidate();

            //now we need to create cookies as well is present
            deleteCookie(request,response);   // method to delete cookie press Ctrl and click on deleteCookie() :)

            //now we need to redirect the user to login page :)
            JsonProvider.setObject(null);
            response.sendRedirect("index.jsp");
        }
    }

    private Parent checkCookie(HttpServletRequest request){
        Cookie [] cookies=request.getCookies();
        Parent p=null;
        if(cookies==null){
            return null;
        }
        else{
            String email="";
            String password="";
            String loginas="";
            for(Cookie ck:cookies){
                if(ck.getName().equals("email")){
                    email=ck.getValue();
                }
                if(ck.getName().equals("password")){
                    password=ck.getValue();
                }
                if (ck.getName().equals("loginas")){
                    loginas=ck.getValue();
                }
            }
            if(!email.isEmpty() && !password.isEmpty() && !loginas.isEmpty()){
               if (loginas.equalsIgnoreCase("hr")){
                p=new HR(email,password);
               }else if (loginas.equalsIgnoreCase("candidate")){
                   p=new Candidate(email,password);
               }
            }
        }
        return p;
    }

    private static void createCookie(HttpServletResponse response,String email,String password,String loginas){
            System.out.println("Cookie created for:"+loginas);
            Cookie ckemail=new Cookie("email",email);
            ckemail.setMaxAge(30*24*60*60); //Cookie set for 1 month in seconds
            response.addCookie(ckemail);

            Cookie ckpassword=new Cookie("password",password);
            ckpassword.setMaxAge(30*24*60*60); //Cookie set for 1 month in seconds
            response.addCookie(ckpassword);

            Cookie ckloginas=new Cookie("loginas",loginas);
            ckloginas.setMaxAge(30*24*60*60); //Cookie set for 1 month in seconds
            response.addCookie(ckloginas);


    }

    private static void deleteCookie(HttpServletRequest request,HttpServletResponse response){
        Cookie[] cookies=request.getCookies();
        for(Cookie ck:cookies){
            if (ck.getName().equalsIgnoreCase("email")){
                ck.setMaxAge(0);
                response.addCookie(ck);
            }
            if (ck.getName().equalsIgnoreCase("password")){
                ck.setMaxAge(0);
                response.addCookie(ck);
            }
            if (ck.getName().equalsIgnoreCase("loginas")){
                ck.setMaxAge(0);
                response.addCookie(ck);
            }
            System.out.println("Cookies deleted");
        }//End of for
    }//End of deleteCookie() method :)
}
