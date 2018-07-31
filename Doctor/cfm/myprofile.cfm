<!--

Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<!--- <cfoutput>#GetUserRoles()#</cfoutput> --->


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
							<li ><a href="../doctorHomePage.cfm"><span>H</span><span>O</span><span>M</span><span>E</span></a></li>
							<li  class="active"><a  href="myprofile.cfm"><span>MY</span><span>-</span><span>PR</span><span>OF</span><span>IL</span><span>E</span></a></li>
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
	<cfset getdata=application.doctor.getDoctorDetails(#getID.doctorID#)>

	<cfoutput query="getdata">

	 <div class="container__child signup__form">
    <form action="doctors.cfm" class="registration_form" method="post" onsubmit="return checkDoctorsValidation('create')">
		<div class="float-left-first-8">
		<div class="profileDetails">
			<h1>DETAILS</h1>
			</div>
			<div class="form-group">
		        <label for="firstName">Name :</label>
		        <span class="info">#fullName#</span>
		    </div>
			<div class="form-group">
       			 <label for="dob">DOB :</label>
        		 <span class="info">#dob#</span>
     	    </div>
			<div class="form-group">
       			 <label for="gender">Gender :</label>
				 <span class="info">#gender#</span>
      		</div>
			<div class="form-group">
		        <label for="specialization">Specialization :</label>
		        <span class="info">#specialization#</span>
		      </div>
					<div class="form-group">
		        <label for="joiningdate">Joining Date :</label>
		        <span class="info">#joiningdate#</span>
		      </div>


			<div class="form-group">
		        <label for="mobile">Phone Number :</label>
		        <span class="info">#phoneNumber#</span>
		      </div>
				<div class="form-group">
		        <label for="mobilealternate">Phone Number(Alternate) :</label>
		        <span class="info">#phoneNumberAlternate#</span>
		      </div>
		      <div class="form-group">
		        <label for="email">Email :</label>
		        <span class="info">#emailID#</span>
		      </div>
			<div class="form-group">
		        <label for="yearsOfExperience">Years Of Experience :</label>
		        <span class="info">#yearsOfExperience#</span>
		      </div>
				</div>
			<div class="float-right-second-8">

			<div class="profileDetails">
			<h1>ADDRESS</h1>
			</div>
			<div class="form-group">
		        <label for="line1">Address Line 1 :</label>
		        <span class="info">#LineNo1#</span>
		      </div>
				<div class="form-group">
		        <label for="line2">Address Line 2 :</label>
		        <span class="info">#LineNo2#</span>
		      </div>
			<div class="form-group">
		        <label for="city">City :</label>
		        <span class="info">#city#</span>
		      </div>
			<div class="form-group">
		        <label for="state">State :</label>
		       <span class="info">#state#</span>
		      </div>
			<div class="form-group">
		        <label for="country">Country :</label>
		        <span class="info">#country#</span>
		      </div>
			<div class="form-group">
		        <label for="zip">Zip-Code :</label>
		        <span class="info">#zipcode#</span>
		      </div>
			</div>

		</cfoutput>

	<!--copy-right-->
	<div class="copy-right">
		<div class="container">
			<div class="clearfix"> </div>
			<p>© 2016 We care . All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
		</div>
	</div>
	<!--//copy-right-->
	<!--smooth-scrolling-of-move-up-->

	<!--//smooth-scrolling-of-move-up-->
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../js/bootstrap.js"></script>
	<script src="../js/logout.js"></script>
</body>
</html>