package com.monitor.controller;

import com.monitor.dao.ExamDAO;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet({"/login", "/logout", "/logTabSwitch", "/dashboard"})
public class MainController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ExamDAO examDAO = new ExamDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String path = request.getServletPath();
        
        if ("/dashboard".equals(path)) {
            HttpSession session = request.getSession(false);
            if (session != null && "FACULTY".equals(session.getAttribute("role"))) {
                List<Map<String, Object>> records = examDAO.getLiveDashboardData();
                request.setAttribute("examRecords", records);
                request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            } else {
                response.sendRedirect("login.jsp?error=Unauthorized entry window attempt.");
            }
        } else if ("/logout".equals(path)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect("login.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String path = request.getServletPath();

        if ("/login".equals(path)) {
            String user = request.getParameter("username");
            String pass = request.getParameter("password");
            String role = examDAO.authenticateUser(user, pass);

            if (role != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("role", role);
                
                if ("FACULTY".equals(role)) {
                    response.sendRedirect("dashboard");
                } else {
                    response.sendRedirect("exam.jsp");
                }
            } else {
                response.sendRedirect("login.jsp?error=Invalid security token pair matching.");
            }
        } else if ("/logTabSwitch".equals(path)) {
            String user = request.getParameter("username");
            if (user != null) {
                boolean success = examDAO.logTabSwitch(user);
                response.getWriter().write(success ? "SUCCESS" : "FAIL");
            }
        }
    }
}