package qbh.forum.com.vn.controller;

import qbh.forum.com.vn.model.Post;
import qbh.forum.com.vn.service.AccountService;
import qbh.forum.com.vn.service.PostService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@WebServlet(name = "PostController", value = "/PostController")
public class PostController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");
        if (command.equals("post")) {
            String img = request.getParameter("img");
            String content = request.getParameter("content");
            String idA = request.getParameter("idA");
            SimpleDateFormat dateFormat = new SimpleDateFormat("hh:mm:ss a dd/MM/yyyy");
            Date currentDate = new Date();
            String dateNow = dateFormat.format(currentDate);
            PostService.post(idA, img, content, dateNow);
        }
        if (command.equals("load")) {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            List<Post> posts = PostService.getAll();
            Collections.reverse(posts);
            for (Post post : posts) {
                String str = post.getContent();
                String first200Chars;
                if (str.length() <= 200) {
                    first200Chars = str;
                } else {
                    first200Chars = str.substring(0, 200);
                }
                response.getWriter().write("<div class=\"status-field-container write-post-container\">\n" +
                        "                            <div class=\"user-profile-box\">\n" +
                        "                                <div class=\"user-profile\">\n" +
                        "                                    <img src=\"images copy/profile-pic.png\" alt=\"\">\n" +
                        "                                    <div>\n" +
                        "                                        <p>" + AccountService.getAccountById(post.getIdA()).getName() + "\n" +
                        "                                        </p>\n" +
                        "                                        <small>" + post.getCreated_at() + "\n" +
                        "                                        </small>\n" +
                        "                                    </div>\n" +
                        "                                </div>\n" +
                        "                                <div>\n" +
                        "                                    <a href=\"#\"><i class=\"fas fa-ellipsis-v\"></i></a>\n" +
                        "                                </div>\n" +
                        "                            </div>\n" +
                        "                            <div class=\"status-field\"  style=\"margin-bottom: 20px;\">\n" +
                        "                                <a style=\"text-decoration: none;color: #6a6a6a!important;\">\n" +
                        "                                    <p>" + first200Chars + "\n" +
                        "                                        <a href=\"single.jsp?postId=" + post.getId() +"\">#Xem thêm</a></p>\n" +
                        "                                </a>\n" +
                        "                                <a href=\"single.jsp?postId=" + post.getId() + "\">\n" +
                        "                                    <img src=\"" + post.getImg() + "\" alt=\"Ảnh bài đăng\">\n" +
                        "                                </a>\n" +
                        "\n" +
                        "                            </div>\n" +
                        "                            <div class=\"post-reaction\">\n" +
                        "                                <div class=\"activity-icons\">\n" +
                        "                                    <div><img src=\"images copy/like-blue.png\" alt=\"\">120</div>\n" +
                        "                                    <div><img src=\"images copy/comments.png\" alt=\"\">52</div>\n" +
                        "                                    <div><img src=\"images copy/share.png\" alt=\"\">35</div>\n" +
                        "                                </div>\n" +
                        "                                <div class=\"post-profile-picture\">\n" +
                        "                                    <img src=\"images copy/profile-pic.png \" alt=\"\"> <i class=\" fas fa-caret-down\"></i>\n" +
                        "                                </div>\n" +
                        "                            </div>\n" +
                        "                        </div>");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
