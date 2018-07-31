<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<cfif NOT IsUserLoggedIn()>

	<cflocation url="../../Regular-Users/cfm/index.cfm"
			addToken ="No">
<cfelse>
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
					<h1><a href="adminHomePage.cfm"><img src="../images/logo.png" alt="">We Care</a></h1>
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
							<li ><a href="../adminHomePage.cfm"><span>H</span><span>O</span><span>M</span><span>E</span></a></li>
							<li ><a href="patients.cfm" class="link link--yaku" ><span>P</span><span>A</span><span>T</span><span>I</span><span>E</span><span>N</span><span>T</span><span>S</span></a>
							<li><a href="doctors.cfm" class="link link--yaku"><span>D</span><span>O</span><span>C</span><span>T</span><span>O</span><span>R</span><span>S</span></a></li>
							<li class="active"><a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span>A</span><span>D</span><span>D</span></a>
								<ul class="dropdown-menu">
									<li><a class="hvr-bounce-to-bottom" href="addPatients.cfm">add new patient</a></li>
									<li><a class="hvr-bounce-to-bottom" href="addDoctors.cfm">add new doctor</a></li>
								</ul>
							</li>
						</ul>
						<div class="clearfix"> </div>
					</div><!--//navigation-->
				</div>
				<div class="clearfix"> </div>
			</div>
		</nav>
	</div>
	<!--//header-->
	<div id="commentADD">

		<h1>New Doctor</h1>

	</div>


  <!--- Form to add new Doctor --->
  <div class="container__child signup__form">
    <form action="addDoctorGateway.cfm" class="registration_form" method="post" onsubmit="return check_Signup_Validation()">
		<div class="float-left-first-8">
			<div class="form-group">
		        <label for="firstName">First Name</label>
		        <input class="form-control" type="text" name="firstName" id="firstName" placeholder="james" required />
		    </div>
			<div class="form-group">
       			 <label for="middleName">Middle Name</label>
       			 <input class="form-control" type="text" name="middleName" id="middleName" placeholder=""  />
     	    </div>
			<div class="form-group">
			     <label for="lastName">Last Name</label>
			     <input class="form-control" type="text" name="lastName" id="lastName" placeholder="bond" required />
			</div>
			<div class="form-group">
       			 <label for="dob">DOB</label>
        		 <input class="form-control" type="date" name="dob" id="dob" required />
     	    </div>
			<div class="form-group">
       			 <label for="gender">Gender</label>
				 <br>
		         <select class="form-control" name="gender">
		  			<option value="male" >Male</option>
		 			 <option value="female" >Female</option>
		  			<option value="other" >Other</option>
				 </select>
      		</div>
			<div class="form-group">
		        <label for="specialization">Specialization</label>
		        <input class="form-control" type="text" name="specialization" id="specialization" placeholder="" required />
		      </div>
					<div class="form-group">
		        <label for="joiningdate">Joining Date</label>
		        <input class="form-control" type="date" name="joiningdate" id="joiningdate" required />
		      </div>


			<div class="form-group">
		        <label for="mobile">Phone Number</label>
		        <input class="form-control" type="text" name="mobile" id="mobile" placeholder="1234567890" required />
		      </div>
				<div class="form-group">
		        <label for="mobilealternate">Phone Number(Alternate)</label>
		        <input class="form-control" type="text" name="mobilealternate" id="mobilealternate" placeholder="1234567890"  />
		      </div>
				</div>
			<div class="float-right-second-8">

		      <div class="form-group">
		        <label for="email">Email</label>
		        <input class="form-control" type="text" name="email" id="email" placeholder="james.bond@spectre.com"  required />
		      </div>
			 <div class="form-group">
		        <label for="password">Password</label>
		        <input class="form-control" type="password" name="password" id="password" placeholder=""  required />
		      </div>
			<div class="form-group">
		        <label for="yearsOfExperience">Years Of Experience</label>
		        <input class="form-control" type="text" name="yearsOfExperience" id="yearsOfExperience" required />
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
				<div class="theErrorDivID"></div>
			</div>

    </form>

  </div>





	<!--copy-right-->
	<div class="copy-right">
		<div class="container">
			<div class="clearfix"> </div>
			<p>© 2016 We care . All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
		</div>
	</div>
	<!--//copy-right-->
	<!--smooth-scrolling-of-move-up-->

	<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	<!--//smooth-scrolling-of-move-up-->
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/additional-methods.js"></script>
    <script src="../js/bootstrap.js"></script>
	<script src="../js/signupvalidation.js"></script>
</body>
</html>

</cfif>