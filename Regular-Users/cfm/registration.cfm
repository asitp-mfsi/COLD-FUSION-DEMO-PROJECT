<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
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
<link href="../css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="../css/style.css" type="text/css" rel="stylesheet" media="all">

<link rel="stylesheet" href="../css/flexslider.css" type="text/css" media="screen" />


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
					<h1><a href="../index.cfm"><img src="../images/logo.png" alt="">We Care</a></h1>
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
							<li class="link link--yaku"><a href="index.cfm"><span>H</span><span>O</span><span>M</span><span>E</span></a></li>
							<li><a href="gallery.cfm" class="link link--yaku"><span>G</span><span>A</span><span>L</span><span>L</span><span>E</span><span>R</span><span>Y</span><span></span></a>
							<li><a href="contact.cfm" class="link link--yaku"><span>C</span><span>O</span><span>N</span><span>T</span><span>A</span><span>C</span><span>T</span> <span>U</span><span>S</span></a></li>
							<li class="sign link link--yaku active"><a href="registration.cfm"><span>S</span><span>I</span><span>G</span><span>N</span><span> U</span><span>P</span></a></li>
						</ul>
						<div class="clearfix"> </div>
					</div><!--//navigation-->
				</div>
				<div class="clearfix"> </div>
			</div>
		</nav>
	</div>
	<!--//header-->


  <!--- Sign Up Form --->
  <div class="container__child signup__form">
	    <form action="" class="registration_form" method="post" onsubmit="return check_Signup_Validation()">
				<div class="left-side">
						<div class="form-group">
				        <label for="firstName">First Name</label>
				        <input class="form-control" type="text" name="firstName" id="firstName" placeholder="" required />
				    </div>
					<div class="form-group">
				        <label for="middleName">Middle Name</label>
				        <input class="form-control" type="text" name="middleName" id="middleName" placeholder="" required />
				    </div>
					<div class="form-group">
				        <label for="lastName">Last Name</label>
				        <input class="form-control" type="text" name="lastName" id="lastName" placeholder="" required />
				    </div>
				    <div class="form-group">
				        <label for="email">Email</label>
				        <input class="form-control" type="text" name="email" id="email" placeholder=""  required />
				      </div>
				      <div class="form-group">
				        <label for="password">Password</label>
						<div class="PasswordVisible">
				        <input class="form-control" type="password" name="password" id="password" placeholder="" required />
						<img src="../images/eye.png" id="input_img" height="25px" width="30px" onclick="convertPassword('password')" title="show your password">
						</div>
				      </div>
				      <div class="form-group">
				        <label for="passwordRepeat">Repeat Password</label>
						<div>
				        <input class="form-control" type="password" name="passwordRepeat" id="passwordRepeat" placeholder="" required />
						<img src="../images/eye.png" id="input_img" height="25px" width="30px" onclick="convertPassword('passwordRepeat')" title="show your password">
				     </div>
					 </div>
					<div class="form-group">
				        <label for="mobile">Phone Number</label>
				        <input class="form-control" type="text" name="mobile" id="mobile" placeholder="" required />
				      </div>
			</div>
			<div class="right-side">
					<div class="form-group">
				        <label for="mobilealternate">Phone Number (Alternate)</label>
				        <input class="form-control" type="text" name="mobilealternate" id="mobilealternate" placeholder=""  />
				      </div>
					<div class="form-group">
				        <label for="line1">Address Line 1</label>
				        <input class="form-control" type="text" name="line1" id="line1" placeholder="" required />
				      </div>
					<div class="form-group">
				        <label for="line2">Address Line 2</label>
				        <input class="form-control" type="text" name="line2" id="line2" placeholder=""  />
				      </div>
					<div class="form-group">
				        <label for="city">City</label>
				        <input class="form-control" type="text" name="city" id="city" placeholder="" required />
				      </div>
					<div class="form-group">
				        <label for="state">State</label>
				        <input class="form-control" type="text" name="state" id="state" placeholder="" required />
				      </div>
					<div class="form-group">
				        <label for="country">Country</label>
				        <input class="form-control" type="text" name="country" id="country" placeholder="" required />
				      </div>
					<div class="form-group">
				        <label for="zip">Zip-Code</label>
				        <input class="form-control" type="text" name="zip" id="zip" placeholder="" required />
				      </div>
					</div>

					<div id="signupbutton">
				            <input class="btn btn--form SignupFormButton" type="submit" value="Register" />
							<div class="theErrorDivID">
					</div>
			</div>

	    </form>

  </div>








	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/additional-methods.js"></script>
	<script src="../js/signupvalidation.js"></script>

    <script src="../js/bootstrap.js"></script>
</body>
</html>