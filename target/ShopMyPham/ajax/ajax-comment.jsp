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
                <a id="rp-<%=cmt.getId()%>" class="reply">Trả lời</a>
                <%if(user.getId()== cmt.getUserId()){%>
                <a href="#" data-toggle="modal" data-target="#confirm-modal" class="remove"
                   id="delete<%=cmt.getId()%>">Xóa</a>

                <% }%>
                <div class="input-group mb-3 input-reply-<%=cmt.getId()%>"
                     style="display: none">
                    <input type="text" id="desc-reply-<%=cmt.getId()%>" class="form-control"
                           placeholder="Viết trả lời..." aria-label="Viết trả lời..."
                           aria-describedby="button-addon2">
                    <button class="btn btn-primary btn-reply" type="button"
                            id="reply-<%=cmt.getId()%>">Trả lời
                    </button>
                </div>
            </footer>
        </div>
    </div>
</div>
