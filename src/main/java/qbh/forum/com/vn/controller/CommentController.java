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
        /*
        * Usecase Comment
        * 8. lấy và xử lý dữ liệu
        * */
        Account user = (Account) request.getSession().getAttribute("acc");
        String postId = request.getParameter("postId");
        String parentId = request.getParameter("parentId");
        String delete = request.getParameter("delete");

        if(delete != null){
            /*
             * Usecase Comment
             * 20. lấy mã bình luận
             * */
            String id = request.getParameter("id");
            /*
             * Usecase Comment
             * 21. gửi mã cho service
             * */
            new CommentService().RemoveCmt(Integer.parseInt(id));
        }else if(parentId != null){
            String reply =request.getParameter("reply");
            int id = new CommentService().insertReply(user.getId(),postId,reply,Integer.parseInt(parentId));
            Comment cmt = new CommentService().getCmtById(id);
            request.setAttribute("reply", cmt);
            request.getRequestDispatcher("ajax/ajax-replyCmt.jsp").forward(request,response);
        }else {
            String desc = request.getParameter("desc");
            /*
            * Usecase Comment
            * 9. Chuyển dữ liệu cho CommentService
            * */
            int id = new CommentService().insertCmt(user.getId(),postId,desc);
            /*
            * Usecase Comment
            * 12.Controller lấy dữ liệu
            * */
            Comment cmt = new CommentService().getCmtById(id);
            request.setAttribute("cmt", cmt);
            request.getRequestDispatcher("ajax/ajax-comment.jsp").forward(request,response);
        }


    }
}
