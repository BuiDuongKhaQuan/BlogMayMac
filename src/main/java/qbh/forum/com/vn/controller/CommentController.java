package qbh.forum.com.vn.controller;

import qbh.forum.com.vn.model.Account;
import qbh.forum.com.vn.model.Comment;
import qbh.forum.com.vn.service.CommentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CommentController", value = "/CommentController")
public class CommentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account user = (Account) request.getSession().getAttribute("acc");
        String desc = request.getParameter("desc");
        String postId = request.getParameter("postId");
        String parentId = request.getParameter("parentId");
        String reply =request.getParameter("reply");
        System.out.println(parentId);

        if(parentId != null){
            int id = new CommentService().insertReply(user.getId(),postId,reply,Integer.parseInt(parentId));
        }else {
            int id = new CommentService().insertCmt(user.getId(),postId,desc);
            Comment cmt = new CommentService().getCmtById(id);
            request.setAttribute("cmt", cmt);
            request.getRequestDispatcher("ajax/ajax-comment.jsp").forward(request,response);
        }


    }
}
