<%@ page import="qbh.forum.com.vn.model.Comment" %>
<%@ page import="qbh.forum.com.vn.model.Account" %>
<%@ page import="qbh.forum.com.vn.service.AccountService" %><%--
  Created by IntelliJ IDEA.
  User: Nguyen Ngoc Huy
  Date: 4/24/2023
  Time: 8:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Comment reply = (Comment) request.getAttribute("reply");
    Account user = (Account) request.getSession().getAttribute("acc");
    Account userReply = AccountService.getAccountById(reply.getUserId());
%>

<div class="item item-<%=reply.getId()%>">
    <div class="user">
        <figure>
            <img src="images/img01.jpg">
        </figure>
        <div class="details">
            <h5 class="name"><%=userReply.getName()%>
            </h5>
            <div class="time"><%=reply.getCmtDate()%>
            </div>
            <div class="description">
                <%=reply.getDescription()%>
            </div>
            <footer>
                <div class="media-body">
                    <ul class="list-unstyled list-inline media-detail pull-right">
                        <%if (user.getId() == reply.getUserId()) {%>
                        <li class="">
                            <a href="#" data-toggle="modal" data-target="#confirm-modal"
                               id="delete<%=reply.getId()%>" class="remove">Xóa</a>
                        </li>
                        <% }%>
                    </ul>
                </div>
            </footer>
        </div>
    </div>
</div>
