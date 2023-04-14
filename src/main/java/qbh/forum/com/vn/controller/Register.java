package qbh.forum.com.vn.controller;

import qbh.forum.com.vn.model.Account;
import qbh.forum.com.vn.service.AccountService;
import qbh.forum.com.vn.service.LoginService;
import qbh.forum.com.vn.tools.Encode;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Register", value = "/register")
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");
        Account user = AccountService.getAccountByUser(username);
        if (user == null) {
            if (pass.equals(repass)) {
                LoginService.signUp(username, Encode.enCodeMD5(pass),email,name);
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("mess", "Mật khẩu chưa khớp");
                request.getRequestDispatcher("register.jsp").forward(request,response);
            }
        } else {
            request.setAttribute("mess", "Tên đăng nhập đã được sử dụng");
            request.getRequestDispatcher("register.jsp").forward(request,response);
        }


    }
}
