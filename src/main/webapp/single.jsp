<%@ page import="qbh.forum.com.vn.model.Post" %>
<%@ page import="qbh.forum.com.vn.service.PostService" %>
<%@ page import="qbh.forum.com.vn.model.Account" %>
<%@ page import="java.util.List" %>
<%@ page import="qbh.forum.com.vn.model.Comment" %>
<%@ page import="qbh.forum.com.vn.service.CommentService" %>
<%@ page import="qbh.forum.com.vn.service.AccountService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Website Hỗ trợ đăng bài may mặc">
    <!-- Shareable -->
    <meta property="og:title" content="Website Hỗ trợ đăng bài may mặc"/>

    <title>Chi tiết bài đăng &mdash; Nhóm 12</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="scripts/bootstrap/bootstrap.min.css">
    <!-- IonIcons -->
    <link rel="stylesheet" href="scripts/ionicons/css/ionicons.min.css">
    <!-- Toast -->
    <link rel="stylesheet" href="scripts/toast/jquery.toast.min.css">
    <!-- OwlCarousel -->
    <link rel="stylesheet" href="scripts/owlcarousel/dist/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="scripts/owlcarousel/dist/assets/owl.theme.default.min.css">
    <!-- Magnific Popup -->
    <link rel="stylesheet" href="scripts/magnific-popup/dist/magnific-popup.css">
    <link rel="stylesheet" href="scripts/sweetalert/dist/sweetalert.css">
    <!-- Custom style -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/skins/all.css">
    <link rel="stylesheet" href="css/demo.css">
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
<%
    String id = request.getParameter("postId");
    Post post = new PostService().postDetail(Integer.parseInt(id));
    Account user = (Account) request.getSession().getAttribute("acc");
    List<Comment> listCmt = new CommentService().getListCmtByPost(1);

%>
<section class="single">
    <div class="container">
        <div class="row">
            <div class="col-md-4 sidebar" id="sidebar">
                <aside>
                    <div class="aside-body">
                        <figure class="ads">
                            <img src="images/ad.png">
                            <figcaption>Advertisement</figcaption>
                        </figure>
                    </div>
                </aside>
                <aside>
                    <h1 class="aside-title">Recent Post</h1>
                    <div class="aside-body">
                        <article class="article-fw">
                            <div class="inner">
                                <figure>
                                    <a href="single.jsp">
                                        <img src="images/news/img16.jpg">
                                    </a>
                                </figure>
                                <div class="details">
                                    <h1><a href="single.jsp">Lorem Ipsum Dolor Sit Amet Consectetur Adipisicing Elit</a>
                                    </h1>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                        tempor incididunt ut labore et dolore magna aliqua.
                                    </p>
                                    <div class="detail">
                                        <div class="time">December 26, 2016</div>
                                        <div class="category"><a href="category.jsp">Lifestyle</a></div>
                                    </div>
                                </div>
                            </div>
                        </article>
                        <div class="line"></div>
                        <article class="article-mini">
                            <div class="inner">
                                <figure>
                                    <a href="single.jsp">
                                        <img src="images/news/img05.jpg">
                                    </a>
                                </figure>
                                <div class="padding">
                                    <h1><a href="single.jsp">Duis aute irure dolor in reprehenderit in voluptate
                                        velit</a></h1>
                                    <div class="detail">
                                        <div class="category"><a href="category.jsp">Lifestyle</a></div>
                                        <div class="time">December 22, 2016</div>
                                    </div>
                                </div>
                            </div>
                        </article>
                        <article class="article-mini">
                            <div class="inner">
                                <figure>
                                    <a href="single.jsp">
                                        <img src="images/news/img02.jpg">
                                    </a>
                                </figure>
                                <div class="padding">
                                    <h1><a href="single.jsp">Fusce ullamcorper elit at felis cursus suscipit</a></h1>
                                    <div class="detail">
                                        <div class="category"><a href="category.jsp">Travel</a></div>
                                        <div class="time">December 21, 2016</div>
                                    </div>
                                </div>
                            </div>
                        </article>
                        <article class="article-mini">
                            <div class="inner">
                                <figure>
                                    <a href="single.jsp">
                                        <img src="images/news/img13.jpg">
                                    </a>
                                </figure>
                                <div class="padding">
                                    <h1><a href="single.jsp">Duis aute irure dolor in reprehenderit in voluptate
                                        velit</a></h1>
                                    <div class="detail">
                                        <div class="category"><a href="category.jsp">International</a></div>
                                        <div class="time">December 20, 2016</div>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>
                </aside>
                <aside>
                    <div class="aside-body">
                        <form class="newsletter">
                            <div class="icon">
                                <i class="ion-ios-email-outline"></i>
                                <h1>Newsletter</h1>
                            </div>
                            <div class="input-group">
                                <input type="email" class="form-control email" placeholder="Your mail">
                                <div class="input-group-btn">
                                    <button class="btn btn-primary"><i class="ion-paper-airplane"></i></button>
                                </div>
                            </div>
                            <p>By subscribing you will receive new articles in your email.</p>
                        </form>
                    </div>
                </aside>
            </div>
            <div class="col-md-8">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Film</li>
                </ol>
                <article class="article main-article">
                    <header>
                        <h1>Pellentesque elementum tellus id mauris faucibus</h1>
                        <ul class="details">
                            <li>Posted on 31 December, 2016</li>
                            <li><a>Film</a></li>
                            <li>By <a href="#">John Doe</a></li>
                        </ul>
                    </header>
                    <div class="main">
                        <div class="featured">
                            <figure>
                                <img src="<%=post.getImg()%>">
                                <figcaption>Image by pexels.com</figcaption>
                            </figure>
                        </div>
                        <p><%=post.getContent()%>
                        </p>
                    </div>
                    <footer>
                        <div class="col">
                            <ul class="tags">
                                <li><a href="#">Free Themes</a></li>
                                <li><a href="#">Bootstrap 3</a></li>
                                <li><a href="#">Responsive Web Design</a></li>
                                <li><a href="#">HTML5</a></li>
                                <li><a href="#">CSS3</a></li>
                                <li><a href="#">Web Design</a></li>
                            </ul>
                        </div>
                        <div class="col">
                            <a href="#" class="love"><i class="ion-android-favorite-outline"></i>
                                <div>1220</div>
                            </a>
                        </div>
                    </footer>
                </article>
                <div class="sharing">
                    <div class="title"><i class="ion-android-share-alt"></i> Sharing is caring</div>
                    <ul class="social">
                        <li>
                            <a href="#" class="facebook">
                                <i class="ion-social-facebook"></i> Facebook
                            </a>
                        </li>
                        <li>
                            <a href="#" class="twitter">
                                <i class="ion-social-twitter"></i> Twitter
                            </a>
                        </li>
                        <li>
                            <a href="#" class="googleplus">
                                <i class="ion-social-googleplus"></i> Google+
                            </a>
                        </li>
                        <li>
                            <a href="#" class="linkedin">
                                <i class="ion-social-linkedin"></i> Linkedin
                            </a>
                        </li>
                        <li>
                            <a href="#" class="skype">
                                <i class="ion-ios-email-outline"></i> Email
                            </a>
                        </li>
                        <li class="count">
                            20
                            <div>Shares</div>
                        </li>
                    </ul>
                </div>
                <div class="line">
                    <div>Author</div>
                </div>
                <div class="author">
                    <figure>
                        <img src="images/img01.jpg">
                    </figure>
                    <div class="details">
                        <%--								<div class="job">Web Developer</div>--%>
                        <h3 class="name">ABC</h3>
                        <p>Nulla sagittis rhoncus nisi, vel gravida ante. Nunc lobortis condimentum elit, quis porta
                            ipsum rhoncus vitae. Curabitur magna leo, porta vel fringilla gravida, consectetur in
                            libero. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.</p>
                        <ul class="social trp sm">
                            <li>
                                <a href="#" class="facebook">
                                    <svg>
                                        <rect/>
                                    </svg>
                                    <i class="ion-social-facebook"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="twitter">
                                    <svg>
                                        <rect/>
                                    </svg>
                                    <i class="ion-social-twitter"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="youtube">
                                    <svg>
                                        <rect/>
                                    </svg>
                                    <i class="ion-social-youtube"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="googleplus">
                                    <svg>
                                        <rect/>
                                    </svg>
                                    <i class="ion-social-googleplus"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="line">
                    <div>You May Also Like</div>
                </div>
                <div class="row">
                    <article class="article related col-md-6 col-sm-6 col-xs-12">
                        <div class="inner">
                            <figure>
                                <a href="#">
                                    <img src="images/news/img03.jpg">
                                </a>
                            </figure>
                            <div class="padding">
                                <h2><a href="#">Duis aute irure dolor in reprehenderit in voluptate</a></h2>
                                <div class="detail">
                                    <div class="category"><a href="category.jsp">Lifestyle</a></div>
                                    <div class="time">December 26, 2016</div>
                                </div>
                            </div>
                        </div>
                    </article>
                    <article class="article related col-md-6 col-sm-6 col-xs-12">
                        <div class="inner">
                            <figure>
                                <a href="#">
                                    <img src="images/news/img08.jpg">
                                </a>
                            </figure>
                            <div class="padding">
                                <h2><a href="#">Duis aute irure dolor in reprehenderit in voluptate</a></h2>
                                <div class="detail">
                                    <div class="category"><a href="category.jsp">Lifestyle</a></div>
                                    <div class="time">December 26, 2016</div>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <div class="line thin"></div>
                <div class="comments">
                    <h2 class="title"><%=listCmt.size()%> Bình Luận</h2>
                    <%
                        if (user == null) {%>
                    <div class="text-center">Bạn cần <a href="login.jsp" class="text-primary">Đăng nhập </a>để bình
                        luận.
                    </div>
                    <%} else {%>
                    <form class="row">
                        <input type="text" id="postId" value="1" style="display: none">
                        <div class="form-group col-md-12">
                            <label>Bình Luận <span class="required"></span></label>
                            <input id="description" type="text" class="form-control" name="description"
                                   placeholder="Viết bình luận ở đây ...">
                        </div>
                        <div class="form-group col-md-12">
                            <button class="btn btn-primary" id="button-submit">Đăng Bình Luận</button>
                        </div>
                    </form>
                    <%
                        }
                    %>
                    <div class="comment-list" id="comment-list">
                        <%
                            for (Comment cmt : listCmt) {
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
                            <% List<Comment> listReply = new CommentService().getListReplyCmtById(cmt.getId());
                                if (listReply.size() > 0) {
                                    for (Comment reply : listReply) {
                                        Account userReply = AccountService.getAccountById(reply.getUserId());
                            %>
                            <div class="reply-list-<%=cmt.getId()%>">
                                <div class="item item-<%=cmt.getId()%>">
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
                                                <%if(user.getId()== cmt.getUserId()){%>
                                                <%--                                                <a href="#" data-toggle="modal" data-target="#confirm-modal" class="remove"--%>
                                                <%--                                                   id="delete<%=cmt.getId()%>">Xóa</a>--%>
                                                <a href="#" data-toggle="modal" data-target="#confirm-modal" id="delete<%=cmt.getId()%>" class="remove">Xóa</a>

                                                <% }%>
                                            </footer>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                    }
                                }%>
                        </div>
                        <% }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="modal fade" id="confirm-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    <i class="fa fa-warning"></i> Lưu ý
                </h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Bạn có muốn xoá bình luận này ?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary yes" data-dismiss="modal">Có</button>
                <button type="button" class="btn btn-secondary no" data-dismiss="modal">Không</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- Start footer -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="block">
                    <h1 class="block-title">Thông tin nhóm 12</h1>
                    <div class="block-body">
                        <figure class="foot-logo">
                            <img src="images/logo_footer.png" class="img-responsive" alt="Logo">
                        </figure>
                        <p class="brand-description">
                            Hãy trải nghiệm cùng chúng tôi thế giới may mặc đầy màu sắc
                        </p>
                        <a href="page.jsp" class="btn btn-magz white">Về chúng tôi <i
                                class="ion-ios-arrow-thin-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="block">
                    <h1 class="block-title">Thẻ phổ biến </h1>
                    <div class="block-body">
                        <ul class="tags">
                            <li><a href="#">HTML5</a></li>
                            <li><a href="#">CSS3</a></li>
                            <li><a href="#">Bootstrap 3</a></li>
                            <li><a href="#">Web Design</a></li>
                            <li><a href="#">Creative Mind</a></li>
                            <li><a href="#">Trello</a></li>
                            <li><a href="#">at 00.00PM</a></li>
                        </ul>
                    </div>
                </div>
                <div class="line"></div>
                <div class="block">
                    <h1 class="block-title">Bản tin</h1>
                    <div class="block-body">
                        <p>Bằng cách đăng ký, bạn sẽ nhận được các bài viết mới trong email của mình.</p>
                        <form class="newsletter">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="ion-ios-email-outline"></i>
                                </div>
                                <input type="email" class="form-control email" placeholder="Mail của bạn">
                            </div>
                            <button class="btn btn-primary btn-block white">Đăng ký</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="block">
                    <h1 class="block-title">Tin mới nhất</h1>
                    <div class="block-body">
                        <article class="article-mini">
                            <div class="inner">
                                <figure>
                                    <a href="single.jsp">
                                        <img src="images/news/img12.jpg" alt="Sample Article">
                                    </a>
                                </figure>
                                <div class="padding">
                                    <h1><a href="single.jsp">Donec consequat lorem quis augue pharetra</a></h1>
                                </div>
                            </div>
                        </article>
                        <article class="article-mini">
                            <div class="inner">
                                <figure>
                                    <a href="single.jsp">
                                        <img src="images/news/img14.jpg" alt="Sample Article">
                                    </a>
                                </figure>
                                <div class="padding">
                                    <h1><a href="single.jsp">eu dapibus risus aliquam etiam ut venenatis</a></h1>
                                </div>
                            </div>
                        </article>
                        <article class="article-mini">
                            <div class="inner">
                                <figure>
                                    <a href="single.jsp">
                                        <img src="images/news/img15.jpg" alt="Sample Article">
                                    </a>
                                </figure>
                                <div class="padding">
                                    <h1><a href="single.jsp">Nulla facilisis odio quis gravida vestibulum </a></h1>
                                </div>
                            </div>
                        </article>
                        <article class="article-mini">
                            <div class="inner">
                                <figure>
                                    <a href="single.jsp">
                                        <img src="images/news/img16.jpg" alt="Sample Article">
                                    </a>
                                </figure>
                                <div class="padding">
                                    <h1><a href="single.jsp">Proin venenatis pellentesque arcu vitae </a></h1>
                                </div>
                            </div>
                        </article>
                        <a href="#" class="btn btn-magz white btn-block">See All <i
                                class="ion-ios-arrow-thin-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-xs-12 col-sm-6">
                <div class="block">
                    <h1 class="block-title">Theo dõi chúng tôi</h1>
                    <div class="block-body">
                        <p>Theo dõi chúng tôi và giữ liên lạc để nhận tin tức mới nhất</p>
                        <ul class="social trp">
                            <li>
                                <a href="#" class="facebook">
                                    <svg>
                                        <rect width="0" height="0"/>
                                    </svg>
                                    <i class="ion-social-facebook"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="twitter">
                                    <svg>
                                        <rect width="0" height="0"/>
                                    </svg>
                                    <i class="ion-social-twitter-outline"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="youtube">
                                    <svg>
                                        <rect width="0" height="0"/>
                                    </svg>
                                    <i class="ion-social-youtube-outline"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="googleplus">
                                    <svg>
                                        <rect width="0" height="0"/>
                                    </svg>
                                    <i class="ion-social-googleplus"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="instagram">
                                    <svg>
                                        <rect width="0" height="0"/>
                                    </svg>
                                    <i class="ion-social-instagram-outline"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="tumblr">
                                    <svg>
                                        <rect width="0" height="0"/>
                                    </svg>
                                    <i class="ion-social-tumblr"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="dribbble">
                                    <svg>
                                        <rect width="0" height="0"/>
                                    </svg>
                                    <i class="ion-social-dribbble"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="linkedin">
                                    <svg>
                                        <rect width="0" height="0"/>
                                    </svg>
                                    <i class="ion-social-linkedin"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="skype">
                                    <svg>
                                        <rect width="0" height="0"/>
                                    </svg>
                                    <i class="ion-social-skype"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="rss">
                                    <svg>
                                        <rect width="0" height="0"/>
                                    </svg>
                                    <i class="ion-social-rss"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="line"></div>
                <div class="block">
                    <h1 class="block-title">Thành viên</h1>
                    <div class="block-body no-margin">
                        <div class="block-body">
                            <p>Bùi Dương Khả Quân - 20130372</p>
                            <p>Châu Quế Bình - 20130204</p>
                            <p>Nguyễn Ngọc Huy- 20130281</p>
                            <!-- <ul class="footer-nav-horizontal">

                                <li>Bùi Dương Khả Quân - 20130372</li>
                                <li>Châu Quế Bình - 20130204</li>
                                <li>Nguyễn Ngọc Huy- 20130281</li>
                            </ul> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="copyright">
                    COPYRIGHT &copy; Group12 2023. ALL RIGHT RESERVED.
                    <div>
                        Made with <i class="ion-heart"></i> by <a href="http://kodinger.com">Group12</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- End Footer -->

<!-- JS -->
<script src="js/jquery.js"></script>
<script src="js/jquery.migrate.js"></script>
<script src="scripts/bootstrap/bootstrap.min.js"></script>
<script>var $target_end = $(".best-of-the-week");</script>
<script src="scripts/jquery-number/jquery.number.min.js"></script>
<script src="scripts/owlcarousel/dist/owl.carousel.min.js"></script>
<script src="scripts/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
<script src="scripts/easescroll/jquery.easeScroll.js"></script>
<script src="scripts/sweetalert/dist/sweetalert.min.js"></script>
<script src="scripts/toast/jquery.toast.min.js"></script>
<script src="js/demo.js"></script>
<script src="js/e-magz.js"></script>
<script>
    $(document).ready(function (){
        deletecomment();
        showreply()
        reply()
    })
    function deletecomment() {
        $(".remove").each(function () {
            const id = $(this).attr("id").substring(6);
            $(this).on("click", function (e) {
                e.preventDefault();
                $("button[type='button'].yes").on("click", function () {
                    console.log(id)
                    $.ajax({
                        url: "/Forum_war/RemoveCommentController" ,
                        type: "post",
                        data: {
                            id: id,
                        },
                        success: function (data) {
                            $(".item-" + id).remove();
                        }
                    })
                })

            })
        })
    }
</script>
<script>

    function showreply() {
        $(".reply").click(function () {
                const id = this.id.substring(3);
                $("#rp-" + id).css("display", "none");
                $(".input-reply-" + id).removeAttr("style")
            }
        )
    }
</script>
<script>
    $("#button-submit").click(function (e) {
        e.preventDefault();
        const comment = $("#description").val();
        const postId = $("#postId").val();
        if (comment == "") {
            alert("Vui lòng không bỏ trống!")
        } else {
            $.ajax({
                type: 'post',
                url: '/Forum_war/CommentController',
                data: {
                    desc: comment,
                    postId: postId
                },
                success: function (data) {
                    // console.log(data);
                    $("#comment-list").prepend(data);
                    deletecomment();
                    showreply()
                    reply()
                    document.getElementById('description').value = '';
                }
            })
        }

    })

    function reply() {
        $(".btn-reply").click(function (e) {
            e.preventDefault();
            const parentId = this.id.substring(6);
            const reply = $("#desc-reply-" + parentId).val();
            const postId = $("#postId").val();
            console.log(parentId)
            console.log(reply)
            console.log(postId)

            if (reply == "") {
                alert("Vui lòng nhập trả lời!")
            } else {
                $.ajax({
                    type: 'post',
                    url: '/Forum_war/CommentController',
                    data: {
                        parentId: parentId,
                        reply: reply,
                        postId: postId
                    },
                    success: function (data) {
                        window.location.href = "http://localhost:8080/Forum_war/single.jsp?postId=" + postId
                        deletecomment();
                        document.getElementById('desc-reply').value = '';
                        $("#rp-" + parentId).removeAttr("style");
                        $(".input-reply-" + parentId).css("display", "none")
                    }
                })
            }


        })
    }


</script>
</body>
</html>