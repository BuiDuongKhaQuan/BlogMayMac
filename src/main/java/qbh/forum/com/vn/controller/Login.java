package qbh.forum.com.vn.controller;

import qbh.forum.com.vn.model.Account;
import qbh.forum.com.vn.service.LoginService;
import qbh.forum.com.vn.tools.Encode;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Login", value = "/login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");
        if (command.equals("out")) {
            HttpSession session = request.getSession();
            session.invalidate();
            response.sendRedirect("home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");
        if (command.equals("login")) {
            String user = request.getParameter("username");
            String pass = request.getParameter("pass");
            if (user != null && pass != null) {
                Account account = LoginService.login(user, Encode.enCodeMD5(pass));
                if (account == null) {
                    request.setAttribute("mess", "Sai tài khoản hoặc mật khẩu");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("acc", account);
                    response.sendRedirect("home");
                }
            }
        }

    }
}
