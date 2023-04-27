<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ page import="qbh.forum.com.vn.controller.NewsControll" %>--%>
<%@ page import="qbh.forum.com.vn.model.News" %>
<%@ page import="java.util.List" %>
<%@ page import="qbh.forum.com.vn.service.NewsService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
  <html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="description" content="Website Hỗ trợ đăng bài may mặc">
		<!-- Shareable -->
		<meta property="og:title" content="Website Hỗ trợ đăng bài may mặc" />
		
		<title>Bài viết &mdash; Nhóm 12</title>
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
		<!-- iCheck -->
		<link rel="stylesheet" href="scripts/icheck/skins/all.css">
		<!-- Custom style -->
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/skins/all.css">
		<link rel="stylesheet" href="css/demo.css">
	</head>

	<body>
	<jsp:include page="header.jsp"></jsp:include>

		<section class="search">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<aside>
							<h2 class="aside-title">Search</h2>
							<div class="aside-body">
								<p>Search with other keywords or use filters for more accurate results.</p>
								<form>
									<div class="form-group">
										<div class="input-group">
											<input type="text" name="q" class="form-control" placeholder="Type something ..." value="hello">
											<div class="input-group-btn">
												<button class="btn btn-primary">
													<i class="ion-search"></i>
												</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</aside>
						<aside>
							<h2 class="aside-title">Filter</h2>
							<div class="aside-body">
								<form class="checkbox-group">
									<div class="group-title">Date</div>
									<div class="form-group">
										<label><input type="radio" name="date" checked> Anytime</label>
									</div>
									<div class="form-group">
										<label><input type="radio" name="date"> Today</label>
									</div>
									<div class="form-group">
										<label><input type="radio" name="date"> Last Week</label>
									</div>
									<div class="form-group">
										<label><input type="radio" name="date"> Last Month</label>
									</div>
									<br>
									<div class="group-title">Categories</div>
									<div class="form-group">
										<label><input type="checkbox" name="category" checked> All Categories</label>
									</div>
									<div class="form-group">
										<label><input type="checkbox" name="category"> Lifestyle</label>
									</div>
									<div class="form-group">
										<label><input type="checkbox" name="category"> Travel</label>
									</div>
									<div class="form-group">
										<label><input type="checkbox" name="category"> Computer</label>
									</div>
									<div class="form-group">
										<label><input type="checkbox" name="category"> Film</label>
									</div>
									<div class="form-group">
										<label><input type="checkbox" name="category"> Sport</label>
									</div>
								</form>
							</div>
						</aside>
					</div>
					<div class="col-md-9">
						<div class="nav-tabs-group">
							<ul class="nav-tabs-list">
								<li class="active"><a href="#">All</a></li>
								<li><a href="#">Latest</a></li>
								<li><a href="#">Popular</a></li>
								<li><a href="#">Trending</a></li>
								<li><a href="#">Videos</a></li>
							</ul>
							<div class="nav-tabs-right">
								<select class="form-control">
									<option>Limit</option>
									<option>10</option>
									<option>20</option>
									<option>50</option>
									<option>100</option>
								</select>
							</div>
						</div>
						<div class="search-result">
							Search results for keyword "hello" found in 5,200 posts.
						</div>
						<div class="row">
<%--							<% List<News> a= NewsService.getData();--%>
<%--								for(News u:a){%>--%>
	<%
		List<News> newsList = NewsService.getData();

// create a set to store the IDs of the articles that have been displayed

		for (News u : newsList) {
	%>

<%--							<c:forEach items="${newsList}" var="u">--%>
							<article class="col-md-12 article-list">
								<div class="inner">
									<figure>
										<a href="single.jsp">
<%--											<img src="images/news/img11.jpg">--%>
											<img src='img_new\<c:out value="<%=u.getImage()%>"/>' alt="<c:out value="<%=u.getImage() %>"/>">
<%--								<img src='img_new\<c:out value="${p.codecate}"/>/<c:out value="${p.image}"/>'--%>
<%--								  alt="<c:out value="${p.image}"/>">--%>
										</a>
									</figure>
									<div class="details">
										<div class="detail">
											<div class="category">
<%--												<a href="#">Film</a>--%>
													<a href="#"><%=u.getCategory()%></a>
											</div>
<%--											<time>December 19, 2016</time>--%>
											<time><%=u.getTime()%></time>
										</div>
										<h1><a href="single.jsp"><%=u.getTitle()%></a></h1>
<%--										<h1><a href="single.jsp">Donec consequat arcu at ultrices sodales quam erat aliquet diam</a></h1>--%>
<%--										<p>--%>
<%--										Donec consequat, arcu at ultrices sodales, quam erat aliquet diam, sit amet interdum libero nunc accumsan nisi.--%>
<%--										</p>--%>
										<p><%=u.getContent()%></p>
										<footer>
<%--											<a href="#" class="love"><i class="ion-android-favorite-outline"></i> <div>273</div></a>--%>
											<a class="btn btn-primary more" href="single.jsp">
												<div>More</div>
												<div><i class="ion-ios-arrow-thin-right"></i></div>
											</a>
										</footer>
									</div>
								</div>

							</article>

							<%}%>
						</div>

<%--						</c:forEach>--%>
						<div class="col-md-12 text-center">
							<ul class="pagination">
								<li class="prev"><a href="#"><i class="ion-ios-arrow-left"></i></a></li>
								<li class="active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">...</a></li>
								<li><a href="#">97</a></li>
								<li class="next"><a href="#"><i class="ion-ios-arrow-right"></i></a></li>
							</ul>
							<div class="pagination-help-text">
								Showing 8 results of 776 &mdash; Page 1
							</div>
						</div>
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
								<a href="page.jsp" class="btn btn-magz white">Về chúng tôi <i class="ion-ios-arrow-thin-right"></i></a>
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
								<a href="#" class="btn btn-magz white btn-block">See All <i class="ion-ios-arrow-thin-right"></i></a>
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
											<svg><rect width="0" height="0"/></svg>
											<i class="ion-social-facebook"></i>
										</a>
									</li>
									<li>
										<a href="#" class="twitter">
											<svg><rect width="0" height="0"/></svg>
											<i class="ion-social-twitter-outline"></i>
										</a>
									</li>
									<li>
										<a href="#" class="youtube">
											<svg><rect width="0" height="0"/></svg>
											<i class="ion-social-youtube-outline"></i>
										</a>
									</li>
									<li>
										<a href="#" class="googleplus">
											<svg><rect width="0" height="0"/></svg>
											<i class="ion-social-googleplus"></i>
										</a>
									</li>
									<li>
										<a href="#" class="instagram">
											<svg><rect width="0" height="0"/></svg>
											<i class="ion-social-instagram-outline"></i>
										</a>
									</li>
									<li>
										<a href="#" class="tumblr">
											<svg><rect width="0" height="0"/></svg>
											<i class="ion-social-tumblr"></i>
										</a>
									</li>
									<li>
										<a href="#" class="dribbble">
											<svg><rect width="0" height="0"/></svg>
											<i class="ion-social-dribbble"></i>
										</a>
									</li>
									<li>
										<a href="#" class="linkedin">
											<svg><rect width="0" height="0"/></svg>
											<i class="ion-social-linkedin"></i>
										</a>
									</li>
									<li>
										<a href="#" class="skype">
											<svg><rect width="0" height="0"/></svg>
											<i class="ion-social-skype"></i>
										</a>
									</li>
									<li>
										<a href="#" class="rss">
											<svg><rect width="0" height="0"/></svg>
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
		<script>var $target_end=$(".best-of-the-week");</script>
		<script src="scripts/jquery-number/jquery.number.min.js"></script>
		<script src="scripts/owlcarousel/dist/owl.carousel.min.js"></script>
		<script src="scripts/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
		<script src="scripts/easescroll/jquery.easeScroll.js"></script>
		<script src="scripts/sweetalert/dist/sweetalert.min.js"></script>
		<script src="scripts/icheck/icheck.min.js"></script>
		<script src="scripts/toast/jquery.toast.min.js"></script>
		<script src="js/demo.js"></script>
		<script>$("input").iCheck({
      checkboxClass: 'icheckbox_square-red',
      radioClass: 'iradio_square-red',
      cursor: true
		});</script>
		<script src="js/e-magz.js"></script>
	</body>
 </html>