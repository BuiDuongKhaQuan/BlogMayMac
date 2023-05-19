<%@ page import="qbh.forum.com.vn.model.Account" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="qbh.forum.com.vn.model.Post" %>
<%@ page import="qbh.forum.com.vn.service.AccountService" %>
<%@ page import="qbh.forum.com.vn.service.PostService" %>
<%@ page import="java.util.Collections" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html><html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Website Hỗ trợ đăng bài may mặc">
    <!-- Shareable -->
    <meta property="og:title" content="Website Hỗ trợ đăng bài may mặc"/>


    <title>Đăng bài &mdash; Nhóm 12 </title>
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
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/skins/all.css">
    <link rel="stylesheet" href="css/demo.css">
    <link rel="stylesheet" href="dropify/css/dropify.min.css">
    <style>
        #show {
            background-color: rgba(0, 0, 0, 0.5);
            display: none;
            position: fixed;
            z-index: 9999;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            justify-content: center;
            align-items: center;
        }

        .promotion-box {
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
            width: 700px;
            height: 400px;
            border-radius: 10px;
            border: 2px solid rgba(255, 255, 255, .5);
            background: white;
            backdrop-filter: blur(20px);
            box-shadow: 0 0 30px rgba(0, 0, 0, .5);
            overflow: hidden;
        }

        .promotion-box .title {
            margin-left: 20px;
            font-size: 20px;
            font-weight: 500;
        }

        .promotion-box .icon-close {
            position: absolute;
            top: 0;
            right: 0;
            width: 35px;
            height: 35px;
            background: #162938;
            font-size: 22px;
            color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            border-bottom-left-radius: 10px;
            cursor: pointer;
            padding: 8px;
        }

        .promotion-box button {
            width: 100px;
            margin: 0 auto;
        }

        .promotion-content {
            display: flex;
            flex-direction: column;
            padding: 0 20px 0 20px;
        }

    </style>
</head>

<body>

<jsp:include page="header.jsp"></jsp:include>

<section class="category">
    <div class="container">
        <div class="row">
            <div class="col-md-8 text-left">
                <!--  -->
                <div class="content-area">

                    <% Account account = (Account) request.getSession().getAttribute("acc");
                        if (account != null) {%>
                    <div class="write-post-container">
                        <div class="user-profile">
                            <img src="images copy/profile-pic.png" alt="">
                            <div>
                                <p><%=account.getName()%>
                                </p>
                            </div>
                        </div>

                        <div class="post-upload-textarea">
                                <textarea name="content" placeholder="Bạn đang nghĩ gì, <%=account.getName()%>?"
                                          id="content" cols="30"
                                          rows="3"></textarea>
                            <% Map<String, String> myImg = (Map<String, String>) session.getAttribute("img");
                                String img = "";
                                String path = "";
                                if (myImg != null) {
                                    for (Map.Entry<String, String> entry : myImg.entrySet()) {
                                        img = "data:image/jpeg;base64," + entry.getValue();
                                        path = entry.getKey();
                                    }%>
                            <div style="border-bottom: 1px solid #ccc;">
                                <img src="<%=img%>" style="margin: 10px 0px; width: 30%;">
                                <input type="hidden" id="img" value="<%=path%>">
                            </div>
                            <%}%>
                            <div class="add-post-links">
                                <a href="javascript:void(0);" onclick="show()"><img src="images copy/photo.png"
                                                                                    alt="">Ảnh</a>
                                <a href="javascript:void(0);" onclick="post(<%=account.getId()%>)"><img
                                        src="images copy/upload.png" alt="">Đăng bài</a>
                            </div>
                            <div id="show" class="promotion">
                                <div class="promotion-box">
                                    <label class="title">Tải ảnh của bạn lên</label>
                                    <img src="user-template/img/icon/close.png" width="22px"
                                         class="zmdi zmdi-close icon-close"
                                         onclick="closeNew()">
                                    <div class="promotion-content">
                                        <form action="UploadImg" method="post"
                                              enctype="multipart/form-data">
                                            <input type="file" name="file" size="60" class="dropify"
                                                   data-min-width="400"/>
                                            <input type="submit" value="Upload"/>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%} else {%>
                    <div class="write-post-container">
                        Bạn hãy đăng nhập để sử dụng chức năng đăng bài! <a href="login.jsp">Đăng nhập</a>
                    </div>
                    <%}%>

                    <%--
                    Usecase comment
                    1. Kéo tìm và chọn 1 bài đăng ở phần dưới đây
                    --%>
                    <div id="list_post">
                        <% List<Post> posts = PostService.getAll();
                            Collections.reverse(posts);
                            for (Post post : posts) {
                                String str = post.getContent();
                                String first200Chars;
                                if (str.length() <= 200) {
                                    first200Chars = str;
                                } else {
                                    first200Chars = str.substring(0, 200);
                                }
                        %>
                        <div class="status-field-container write-post-container">
                            <div class="user-profile-box">
                                <div class="user-profile">
                                    <img src="images copy/profile-pic.png" alt="">
                                    <div>
                                        <p><%=AccountService.getAccountById(post.getIdA()).getName()%>
                                        </p>
                                        <small><%=post.getCreated_at()%>
                                        </small>
                                    </div>
                                </div>
                                <div>
                                    <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                                </div>
                            </div>
                            <div class="status-field" style="margin-bottom: 20px;">
                                <a style="text-decoration: none; color: #6a6a6a!important;">
                                <%--
                                Usecase comment
                                2. chuyển đến trang chi tiết bài đăng
                                --%>
                                <a href="post-detail.jsp?postId=<%=post.getId()%>" style="text-decoration: none; color: #6a6a6a!important;">
                                    <p><%=first200Chars%>
                                        <a href="#"> Xem thêm</a></p>
                                </a>
                                <a href="post-detail.jsp?postId=<%=post.getId()%>">
                                    <img src="<%=post.getImg()%>" alt="Ảnh bài đăng">
                                </a>

                            </div>
                            <div class="post-reaction">
                                <div class="activity-icons">
                                    <div><img src="images copy/like-blue.png" alt="">120</div>
                                    <div><img src="images copy/comments.png" alt="">52</div>
                                    <div><img src="images copy/share.png" alt="">35</div>
                                </div>
                                <div class="post-profile-picture">
                                    <img src="images copy/profile-pic.png " alt=""> <i class=" fas fa-caret-down"></i>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                    <button type="button" class="btn-LoadMore" onclick="LoadMoreToggle()">Load More</button>
                </div>
                <!--  -->


            </div>
            <div class="col-md-4 sidebar">
                <aside>
                    <div class="aside-body">
                        <figure class="ads">
                            <a href="post-detail.jsp">
                                <img src="images/ad.png">
                            </a>
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
                                    <a href="post-detail.jsp">
                                        <img src="images/news/img12.jpg">
                                    </a>
                                </figure>
                                <div class="details">
                                    <h1><a href="post-detail.jsp">Lorem Ipsum Dolor Sit Amet Consectetur Adipisicing Elit</a>
                                    </h1>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                        tempor incididunt ut labore et dolore magna aliqua.
                                    </p>
                                    <div class="detail">
                                        <div class="time">December 26, 2016</div>
                                        <div class="category"><a href="post.jsp">Lifestyle</a></div>
                                    </div>
                                </div>
                            </div>
                        </article>
                        <div class="line"></div>
                        <article class="article-mini">
                            <div class="inner">
                                <figure>
                                    <a href="post-detail.jsp">
                                        <img src="images/news/img05.jpg">
                                    </a>
                                </figure>
                                <div class="padding">
                                    <h1><a href="post-detail.jsp">Duis aute irure dolor in reprehenderit in voluptate
                                        velit</a></h1>
                                    <div class="detail">
                                        <div class="category"><a href="post.jsp">Lifestyle</a></div>
                                        <div class="time">December 22, 2016</div>
                                    </div>
                                </div>
                            </div>
                        </article>
                        <article class="article-mini">
                            <div class="inner">
                                <figure>
                                    <a href="post-detail.jsp">
                                        <img src="images/news/img02.jpg">
                                    </a>
                                </figure>
                                <div class="padding">
                                    <h1><a href="post-detail.jsp">Fusce ullamcorper elit at felis cursus suscipit</a></h1>
                                    <div class="detail">
                                        <div class="category"><a href="post.jsp">Travel</a></div>
                                        <div class="time">December 21, 2016</div>
                                    </div>
                                </div>
                            </div>
                        </article>
                        <article class="article-mini">
                            <div class="inner">
                                <figure>
                                    <a href="post-detail.jsp">
                                        <img src="images/news/img13.jpg">
                                    </a>
                                </figure>
                                <div class="padding">
                                    <h1><a href="post-detail.jsp">Duis aute irure dolor in reprehenderit in voluptate
                                        velit</a></h1>
                                    <div class="detail">
                                        <div class="category"><a href="post.jsp">International</a></div>
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
        </div>
    </div>
</section>

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
                                    <a href="post-detail.jsp">
                                        <img src="images/news/img12.jpg" alt="Sample Article">
                                    </a>
                                </figure>
                                <div class="padding">
                                    <h1><a href="post-detail.jsp">Donec consequat lorem quis augue pharetra</a></h1>
                                </div>
                            </div>
                        </article>
                        <article class="article-mini">
                            <div class="inner">
                                <figure>
                                    <a href="post-detail.jsp">
                                        <img src="images/news/img14.jpg" alt="Sample Article">
                                    </a>
                                </figure>
                                <div class="padding">
                                    <h1><a href="post-detail.jsp">eu dapibus risus aliquam etiam ut venenatis</a></h1>
                                </div>
                            </div>
                        </article>
                        <article class="article-mini">
                            <div class="inner">
                                <figure>
                                    <a href="post-detail.jsp">
                                        <img src="images/news/img15.jpg" alt="Sample Article">
                                    </a>
                                </figure>
                                <div class="padding">
                                    <h1><a href="post-detail.jsp">Nulla facilisis odio quis gravida vestibulum </a></h1>
                                </div>
                            </div>
                        </article>
                        <article class="article-mini">
                            <div class="inner">
                                <figure>
                                    <a href="post-detail.jsp">
                                        <img src="images/news/img16.jpg" alt="Sample Article">
                                    </a>
                                </figure>
                                <div class="padding">
                                    <h1><a href="post-detail.jsp">Proin venenatis pellentesque arcu vitae </a></h1>
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
<script src="dropify/js/dropify.min.js">
</script>
<script>
    $('.dropify').dropify();

    function show() {
        var box = document.getElementById('show');
        box.style.display = 'flex';
    }

    function closeNew() {

        var box = document.getElementById('show');
        box.style.display = 'none';

    }

    function post(idA) {
        var content = document.getElementById("content").value;
        var img = document.getElementById("img").value;


        var xhr = new XMLHttpRequest();
        xhr.open("GET", "PostController?idA=" + idA + "&img=" + encodeURIComponent(img) + "&command=post&content=" + encodeURIComponent(content), true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                alert("Đăng bài thành công, chờ duyệt!");
                load();
            }
        };
        xhr.send();

    }

    function load() {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "PostController?command=load", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                document.getElementById("list_post").innerHTML = this.responseText;
            }
        };
        xhr.send();
    }

    function single(id) {
        window.location.href = "post-detail.jsp?postId=" + id;
    }
</script>
</body>
</html>