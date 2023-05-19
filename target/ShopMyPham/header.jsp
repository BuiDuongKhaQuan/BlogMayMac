<%@ page import="qbh.forum.com.vn.model.Account" %><%--
  Created by IntelliJ IDEA.
  User: khaqu
  Date: 4/5/2023
  Time: 12:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Account account = (Account) request.getSession().getAttribute("acc");%>
<header class="primary">
    <div class="firstbar">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-12">
                    <div class="brand">
                        <a href="index.jsp">
                            <img src="images/logo.png" alt="Magz Logo">
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12">
                    <form class="search" autocomplete="off">
                        <div class="form-group">
                            <div class="input-group">
                                <input type="text" name="q" class="form-control" placeholder="Tìm kiếm">
                                <div class="input-group-btn">
                                    <button class="btn btn-primary"><i class="ion-search"></i></button>
                                </div>
                            </div>
                        </div>
                        <!-- <div class="help-block">

                        </div> -->
                    </form>
                </div>
                <div class="col-md-3 col-sm-12 text-right">
                    <%if (account == null) {%>
                    <ul class="nav-icons">
<%--                        <li><a href="register.jsp"><i class="ion-person-add"></i>--%>
<%--                            <div>Đăng ký</div>--%>
<%--                        </a></li>--%>
                        <li><a href="login.jsp"><i class="ion-person"></i>
                            <div>Đăng nhập</div>
                        </a></li>
                    </ul>
                    <%} else {%>
                    <ul class="nav-icons">
                        <li><a href="#"><i class="ion-person-add"></i>
                            <div>Xin chào <%=account.getName()%></div>
                        </a></li>
                        <li><a href="login?command=out"><i class="ion-person"></i>
                            <div>Đăng xuất</div>
                        </a></li>
                    </ul>
                    <%}%>
                </div>
            </div>
        </div>
    </div>

    <!-- Start nav -->
    <nav class="menu">
        <div class="container">
            <div class="brand">
                <a href="#">
                    <img src="images/logo_light.png" alt="Group12 Logo">
                </a>
            </div>
            <div class="mobile-toggle">
                <a href="#" data-toggle="menu" data-target="#menu-list"><i class="ion-navicon-round"></i></a>
            </div>
            <div class="mobile-toggle">
                <a href="#" data-toggle="sidebar" data-target="#sidebar"><i class="ion-ios-arrow-left"></i></a>
            </div>
            <div id="menu-list">
                <ul class="nav-list">
                    <li class="for-tablet nav-title"><a>Menu</a></li>
                    <li class="for-tablet"><a href="login.jsp">Đăng nhập</a></li>
                    <li class="for-tablet"><a href="register.jsp">Đăng ký</a></li>
                    <li><a href="post.jsp">Bài đăng</a></li>
                    <li><a href="page.jsp">Về chúng tôi</a></li>
                    <li><a href="search.jsp">Bài viết <i class="ion-ios-arrow-right"></i>
                        <div class="badge">Hot</div>
                    </a>
                        <div class="dropdown-menu megamenu">
                            <div class="megamenu-inner">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <h2 class="megamenu-title">Xu hướng</h2>
                                            </div>
                                        </div>
                                        <ul class="vertical-menu">
                                            <li><a href="#"><i class="ion-ios-circle-outline"></i> 4 kiểu váy mùa hè
                                                hack tuổi</a></li>
                                            <li><a href="#"><i class="ion-ios-circle-outline"></i> 10 cách diện chân váy
                                            </a></li>
                                            <li><a href="#"><i class="ion-ios-circle-outline"></i> 3 mẫu quần giúp bạn
                                                trở thành quý cô sành điệu trong nháy mắt</a></li>
                                            <li><a href="#"><i class="ion-ios-circle-outline"></i> Ba nhà thiết kế nữ
                                                khiến làng thời trang châu Á tự hào</a></li>
                                            <li><a href="#"><i class="ion-ios-circle-outline"></i> Vì sao nên sắm quần
                                                màu be cho tủ đồ mùa hè?</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <h2 class="megamenu-title">Các bài viết</h2>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <article class="article col-md-4 mini">
                                                <div class="inner">
                                                    <figure>
                                                        <a href="post-detail.jsp">
                                                            <img src="images/news/img10.jpg" alt="Sample Article">
                                                        </a>
                                                    </figure>
                                                    <div class="padding">
                                                        <div class="detail">
                                                            <div class="time">December 10, 2016</div>
                                                            <div class="category"><a href="post.jsp">Healthy</a>
                                                            </div>
                                                        </div>
                                                        <h2><a href="post-detail.jsp">Duis aute irure dolor in reprehenderit
                                                            in voluptate</a></h2>
                                                    </div>
                                                </div>
                                            </article>
                                            <article class="article col-md-4 mini">
                                                <div class="inner">
                                                    <figure>
                                                        <a href="post-detail.jsp">
                                                            <img src="images/news/img11.jpg" alt="Sample Article">
                                                        </a>
                                                    </figure>
                                                    <div class="padding">
                                                        <div class="detail">
                                                            <div class="time">December 13, 2016</div>
                                                            <div class="category"><a href="post.jsp">Lifestyle</a>
                                                            </div>
                                                        </div>
                                                        <h2><a href="post-detail.jsp">Duis aute irure dolor in reprehenderit
                                                            in voluptate</a></h2>
                                                    </div>
                                                </div>
                                            </article>
                                            <article class="article col-md-4 mini">
                                                <div class="inner">
                                                    <figure>
                                                        <a href="post-detail.jsp">
                                                            <img src="images/news/img14.jpg" alt="Sample Article">
                                                        </a>
                                                    </figure>
                                                    <div class="padding">
                                                        <div class="detail">
                                                            <div class="time">December 14, 2016</div>
                                                            <div class="category"><a href="post.jsp">Travel</a>
                                                            </div>
                                                        </div>
                                                        <h2><a href="post-detail.jsp">Duis aute irure dolor in reprehenderit
                                                            in voluptate</a></h2>
                                                    </div>
                                                </div>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li><a href="contact.jsp">Liên hệ</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- End nav -->
</header>