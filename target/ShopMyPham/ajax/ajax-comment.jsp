<%@ page import="qbh.forum.com.vn.model.Comment" %>
<%@ page import="qbh.forum.com.vn.model.Account" %>
<%@ page import="qbh.forum.com.vn.service.AccountService" %><%--
  Created by IntelliJ IDEA.
  User: Nguyen Ngoc Huy
  Date: 4/14/2023
  Time: 11:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Comment cmt = (Comment) request.getAttribute("cmt");
    Account user = (Account) request.getSession().getAttribute("acc");
    Account userCmt = AccountService.getAccountById(cmt.getUserId());
%>
<div class="item item-<%=cmt.getId()%>">
    <div class="user">
        <figure>
            <img src="images/img01.jpg">
        </figure>
        <div class="details">
            <h5 class="name"><%=userCmt.getName()%>
            </h5>
            <div class="time"><%=cmt.getCmtDate()%>
            </div>
            <div class="description">
                <%=cmt.getDescription()%>
            </div>
            <footer id="form-reply">
                <div class="media-body">
                    <ul class="list-unstyled list-inline media-detail pull-right">
                        <%if (user.getId() == cmt.getUserId()) {%>
                        <li>
                            <%--
                            Usecase Comment
                            19. Chọn 1 bình luận và nhấn vào xóa
                            --%>
                            <a href="#" data-toggle="modal" data-target="#confirm-modal"
                               class="remove"
                               id="delete<%=cmt.getId()%>">Xóa</a>
                        </li>
                        <% }%>
                        <li>
                            <%--
                            Usecase Comment
                            14. Chọn 1 bình luận và nhấn vào trả lời
                            --%>
                            <a id="rp-<%=cmt.getId()%>" class="reply">Trả lời</a>
                        </li>
                    </ul>
                    <%--Đây là khung trả lời--%>
                    <div class="input-group mb-3 input-reply-<%=cmt.getId()%>"
                         style="display: none">
                        <%--
                        Usecase Comment
                        16. người dùng nhập nội dung trả lời
                        --%>
                        <input type="text" id="desc-reply-<%=cmt.getId()%>"
                               class="form-control text    "
                               placeholder="Viết trả lời..." aria-label="Viết trả lời..."
                               aria-describedby="button-addon2">
                        <%--
                        Usecase Comment
                        17. Người dung nhấn trả lời và lặp lại bước 7 đến 12
                        --%>
                        <div class="input-group-btn">
                            <button class="btn btn-primary btn-reply" type="button"
                                    id="reply-<%=cmt.getId()%>">Trả lời
                            </button>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <%--
    Usecase Comment
    18. hiển thị trả lời phía dưới bình luận gốc
    --%>
    <div class="reply-list-<%=cmt.getId()%>">
    </div>
