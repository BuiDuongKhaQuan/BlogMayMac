package qbh.forum.com.vn.controller;

import qbh.forum.com.vn.model.Account;
import qbh.forum.com.vn.model.Comment;
import qbh.forum.com.vn.service.AccountService;
import qbh.forum.com.vn.service.CommentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CommentController", value = "/CommentController")
public class CommentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Account user = (Account) request.getSession().getAttribute("acc");
        String postId = request.getParameter("postId");
        String parentId = request.getParameter("parentId");
        String delete = request.getParameter("delete");

        if (delete != null) {
            String id = request.getParameter("id");
            new CommentService().RemoveCmt(Integer.parseInt(id));
        } else if (parentId != null) {
            /*
             * Usecase Comment
             * 20. lấy và xử lý dữ liệu
             * */
            String replyDesc = request.getParameter("reply");
            /*
             * Usecase Comment
             * 21. Chuyển dữ liệu cho CommentService
             * */
            int id = new CommentService().insertReply(user.getId(), postId, replyDesc, Integer.parseInt(parentId));
            /*
             * Usecase Comment
             * 24.Controller lấy nội dung trả lời
             * */
            Comment reply = new CommentService().getCmtById(id);
            Account userReply = AccountService.getAccountById(reply.getUserId());
            /*
             * Usecase Comment
             * 25. chuyển nội dung trả lời cho post-detail.jsp
             * */
            PrintWriter writer = response.getWriter();
            String s = "<div class=\"item item-" + reply.getId() + "\">\n" +
                    "    <div class=\"user\">\n" +
                    "        <figure>\n" +
                    "            <img src=\"images/img01.jpg\">\n" +
                    "        </figure>\n" +
                    "        <div class=\"details\">\n" +
                    "            <h5 class=\"name\">" + userReply.getName() + "\n" +
                    "            </h5>\n" +
                    "            <div class=\"time\">" + reply.getCmtDate() + "\n" +
                    "            </div>\n" +
                    "            <div class=\"description\">\n" +
                    reply.getDescription() +
                    "            </div>\n" +
                    "            <footer>\n" +
                    "                <div class=\"media-body\">\n" +
                    "                    <ul class=\"list-unstyled list-inline media-detail pull-right\">\n";
            if (user.getId() == reply.getUserId()) {
                s += "\n" +
                        "                        <li class=\"\">\n" +
                        "                            <a href=\"#\" data-toggle=\"modal\" data-target=\"#confirm-modal\"\n" +
                        "                               id=\"delete" + reply.getId() + "\" class=\"remove\">Xóa</a>\n" +
                        "                        </li>\n";
            }
            s += "\n" +
                    "                    </ul>\n" +
                    "                </div>\n" +
                    "            </footer>\n" +
                    "        </div>\n" +
                    "    </div>\n" +
                    "</div>";
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/html");
            writer.write(s);
        } else {
            /*
             * Usecase Comment
             * 8. lấy và xử lý dữ liệu
             * */
            String desc = request.getParameter("desc");
            /*
             * Usecase Comment
             * 9. Chuyển dữ liệu cho CommentService
             * */
            int id = new CommentService().insertCmt(user.getId(), postId, desc);
            /*
             * Usecase Comment
             * 12.Controller lấy nội dung bình luận
             * */
            Comment cmt = new CommentService().getCmtById(id);
            Account userCmt = AccountService.getAccountById(cmt.getUserId());
            /*
             * Usecase Comment
             * 13. chuyển nội dung bình luận cho post-detail.jsp
             * */
            PrintWriter writer = response.getWriter();
            String s = "<div class=\"item item-" + cmt.getId() + "\">\n" +
                    "    <div class=\"user\">\n" +
                    "        <figure>\n" +
                    "            <img src=\"images/img01.jpg\">\n" +
                    "        </figure>\n" +
                    "        <div class=\"details\">\n" +
                    "            <h5 class=\"name\">" + userCmt.getName() +
                    "            </h5>\n" +
                    "            <div class=\"time\">" + cmt.getCmtDate() + "\n" +
                    "            </div>\n" +
                    "            <div class=\"description\">\n" +
                    cmt.getDescription() +
                    "            </div>\n" +
                    "            <footer id=\"form-reply\">\n" +
                    "                <div class=\"media-body\">\n" +
                    "                    <ul class=\"list-unstyled list-inline media-detail pull-right\">\n";
            if (user.getId() == cmt.getUserId()) {
                s +=
                        "                        <li>\n" +
                                "                            <a href=\"#\" data-toggle=\"modal\" data-target=\"#confirm-modal\"\n" +
                                "                               class=\"remove\"\n" +
                                "                               id=\"delete" + cmt.getId() + "\">Xóa</a>\n" +
                                "                        </li>\n";
            }
            s +=
                    "                        <li>\n" +
                            "                            <a id=\"rp-" + cmt.getId() + "\" class=\"reply\">Trả lời</a>\n" +
                            "                        </li>\n" +
                            "                    </ul>\n" +
                            "                    <div class=\"input-group mb-3 input-reply-" + cmt.getId() + "\"\n" +
                            "                         style=\"display: none\">\n" +
                            "                        <input type=\"text\" id=\"desc-reply-" + cmt.getId() + "\"\n" +
                            "                               class=\"form-control text    \"\n" +
                            "                               placeholder=\"Viết trả lời...\" aria-label=\"Viết trả lời...\"\n" +
                            "                               aria-describedby=\"button-addon2\">\n" +
                            "                        <div class=\"input-group-btn\">\n" +
                            "                            <button class=\"btn btn-primary btn-reply\" type=\"button\"\n" +
                            "                                    id=\"reply-" + cmt.getId() + "\">Trả lời\n" +
                            "                            </button>\n" +
                            "                        </div>\n" +
                            "                    </div>\n" +
                            "                </div>\n" +
                            "            </footer>\n" +
                            "        </div>\n" +
                            "    </div>\n" +
                            "    <div class=\"reply-list-" + cmt.getId() + "\">\n" +
                            "    </div>";
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/html");
            writer.write(s);
        }


    }
}
