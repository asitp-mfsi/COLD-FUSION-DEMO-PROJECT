	<!-- Modal -->

<!DOCTYPE html>
<html>
<head>
<title>We Care a Medical Category Flat Bootstrap Responsive website Template | Home :: w3layouts</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="We Care Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
	Smartphone Compatible web template, free WebDesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<link href="../../Components/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="../css/style.css" type="text/css" rel="stylesheet" media="all">
<link rel="stylesheet" href="../../Components/css/flexslider.css" type="text/css" media="screen" />


<!-- js -->
<script src="../js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<!-- start-smooth-scrolling-->
<script type="text/javascript" src="../js/move-top.js"></script>
<script type="text/javascript" src="../js/easing.js"></script>
<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){
				event.preventDefault();

		$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
</script>
<!--//end-smooth-scrolling-->
</head>
<body>
	<!--header-->
	<div class="header">
		<nav class="navbar navbar-default">
			<div class="container">
				<div class="navbar-header navbar-left">
					<h1><a href="adminHomePage.cfm"><img src="images/logo.png" alt="">We Care</a></h1>
				</div>
				<!--navigation-->
				<div class="header-text navbar-left">
					<p>Lorem Ipsum is simply dummy text of the printing and typesetting<p>
				</div>
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<div class="header-right">
					<div class="top-nav-text">

					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-left">
							<li class="active"><a href="../doctorHomePage.cfm"><span>H</span><span>O</span><span>M</span><span>E</span></a></li>
							</ul>
						<div class="clearfix"> </div>
					</div><!--//navigation-->
				</div>
				<div class="clearfix"> </div>
			</div>
		</nav>
	</div>
	<!--//header-->
	<cfset id = #getAuthUser()# >
	<cfset getID=application.doctor.getID(id)>
	<cfoutput>
	<input type="hidden" id="idDoctor" value="#getID.doctorID#">
	</cfoutput>
    <div class="changePassword">

	      <form action="" class="registration_form" >

		       <div class="form-group">
				     <div class="form-icon">
					      <img src="../images/password.png" id="form-icon-id">
					       <label for="password">Old Password</label>
					 </div>
					        <input class="form-control" type="password" name="password" id="oldPasswordLogin" value="" placeholder="********" required />
			  </div>
			  <div class="theErrorDivID"></div>

			  <div class="form-group">
				     <div class="form-icon">
					      <img src="../images/password.png" id="form-icon-id">
					       <label for="password">New Password</label>
					 </div>
					        <input class="form-control" type="password" name="password" id="password" value="" placeholder="********" required />
			  </div>
			  <div class="form-group">
				     <div class="form-icon">
					      <img src="../images/password.png" id="form-icon-id">
					       <label for="passwordRepeat">Re-enter New Password</label>
					 </div>
					        <input class="form-control" type="password" name="passwordRepeat" id="passwordRepeat" value="" placeholder="********" required />
			  </div>
			  <div id="loginbutton">
					 <input class="btn btn--form loginFormButton" type="button"   value="SAVE" onclick="return passwordChange()" />
			  </div>

		       </div>
	      </form>
      </div>
<div class="copy-right">
		<div class="container">
			<div class="clearfix"> </div>
			<p>© 2016 We care . All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
		</div>
	</div>
	<!--//copy-right-->
	<!--smooth-scrolling-of-move-up-->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear'
			};
			*/

			$().UItoTop({ easingType: 'easeOutQuart' });

		});
	</script>
	<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	<!--//smooth-scrolling-of-move-up-->
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/additional-methods.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/changePassword.js"></script>
</body>
</html>

