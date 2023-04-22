/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ict.servlet;

import ict.bean.UserBean;
import ict.db.UserDB;
import ict.personal.RandomString;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet(name = "HandleUser", urlPatterns = {"/HandleUser"})
public class HandleUser extends HttpServlet {

    private UserDB db;

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        init();
        String action = request.getParameter("action");
        if ("login".equals(action)) {

            String Username = request.getParameter("username");
            String Password = request.getParameter("password");
            UserBean userbean = db.QueryUserByName(Username);

            if (userbean != null) {
                if (userbean.getPassword().equals(Password)) {
                    RequestDispatcher rd;
                    String userid = userbean.getUserID();

                    request.setAttribute("userid", userid);
                    rd = getServletContext().getRequestDispatcher("/login.jsp");
                    rd.forward(request, response);
                } else {
                    RequestDispatcher rd;
                    rd = getServletContext().getRequestDispatcher("/index.jsp");
                    rd.forward(request, response);
                }
            } else {
                RequestDispatcher rd;
                rd = getServletContext().getRequestDispatcher("/index.jsp");
                rd.forward(request, response);
            }
        } else if ("signup".equals(action)) {
            String easy = RandomString.digits + "ACEFGHJKLMNPQRUVWXYabcdefhijkprstuvwx";
            RandomString tickets = new RandomString(25, new SecureRandom(), easy);
            String UserID = tickets.nextString();
            String Username = request.getParameter("username");
            String Password = request.getParameter("password");
            String Email = request.getParameter("email");
            int Role = Integer.parseInt(request.getParameter("role"));
            int Enable = 1;

            db.AddRecord(UserID, Username, Email, Password, Role, Enable);
            RequestDispatcher rd;
            request.setAttribute("userid", UserID);
            rd = getServletContext().getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        } else if ("disable".equals(action)) {
            String userid = request.getParameter("userid");
            db.DisableAccount(userid);
            RequestDispatcher rd;
            rd = getServletContext().getRequestDispatcher("/AccountManagement.jsp");
            rd.forward(request, response);

        } else if ("edit".equals(action)) {
            String UserID = request.getParameter("userid");
            String Username = request.getParameter("username");
            String Password = request.getParameter("password");
            String Email = request.getParameter("email");
            int Status = Integer.parseInt(request.getParameter("status"));
            db.EditRecord(UserID, Username, Password, Status, Email);
            RequestDispatcher rd;
            rd = getServletContext().getRequestDispatcher("/AccountManagement.jsp");
            rd.forward(request, response);
        } else if ("editpersonal".equals(action)) {
            String UserID = request.getParameter("userid");
            String Username = request.getParameter("username");
            String Password = request.getParameter("password");
            String Email = request.getParameter("email");
            db.EditPersonalRecord(UserID, Username, Password, Email);
            RequestDispatcher rd;
            request.setAttribute("userid", UserID);
            rd = getServletContext().getRequestDispatcher("/login.jsp");
            rd.forward(request, response);

        } else {
            PrintWriter out = response.getWriter();
            out.println("No such action!!!");
        }
    }

    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        db = new UserDB(dbUrl, dbUser, dbPassword); //UserDB 
    }

}
