package qbh.forum.com.vn.controller;
import qbh.forum.com.vn.service.CommentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RemoveCommentController", value = "/RemoveCommentController")
public class RemoveCommentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
    }
}

