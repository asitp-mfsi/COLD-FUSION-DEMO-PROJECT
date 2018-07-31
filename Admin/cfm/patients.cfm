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
							<li class="active"><a href="patients.cfm" ><span>P</span><span>A</span><span>T</span><span>I</span><span>E</span><span>N</span><span>T</span><span>S</span></a>
							<li><a href="doctors.cfm" class="link link--yaku"><span>D</span><span>O</span><span>C</span><span>T</span><span>O</span><span>R</span><span>S</span></a></li>
							<li><a href="#" class="dropdown-toggle link link--yaku" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span>A</span><span>D</span><span>D</span></a>
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


    <!--- patients data --->
	<cfset getdata=application.dataManipulation.getData()>

	<table id="dataTable" class="table table-bordered table-striped Doctortable" >
        <thead>
            <tr class="info">

				<th>Patient ID</th>
                <th>Name</th>
                <th>Disease</th>
                <th>Admitted Date</th>
                <th>Status</th>
                <th>Associated Doctor</th>
            </tr>
        </thead>
		<tbody>

			<cfoutput>
			<cfset prev=0>

			<cfloop query="getdata">

					<cfset next = #PatientID# >
					<cfif next NEQ prev>
						<cfset ID=#PatientID#>
							<tr class ="clickToEdit" data-href="editPatient.cfm" value="#PatientID#">
								<td>#PatientID#</td>
				                <td>#PATIENTNAME#</td>
								<td>#disease#</td>
				                <td>#dateFormat(admittedDate,"dd-mm-yyyy")#</td>
				                <td>#status#</td>
				                <td>  <cfset nameDoctor = "">
									  <cfloop query="getdata">

										  <cfif #PatientID# EQ #ID#>

										  	<cfset nameDoctor = #DoctorName# & " <br> " & #nameDoctor#>

										  </cfif>

									  </cfloop>
								 	  #nameDoctor#
									  <cfset prev= next>
									  </cfif> </td>

								</tr>
				</cfloop>

			</cfoutput>
		</tbody>

    </table>




	<!--copy-right-->
	<div class="copy-right">
		<div class="container">
			<div class="clearfix"> </div>
			<p>� 2016 We care . All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
		</div>
	</div>
	<!--//copy-right-->
	<!--smooth-scrolling-of-move-up-->

	</script>
	<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1"> </span></a>
	<!--//smooth-scrolling-of-move-up-->
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->




    <script src="../js/bootstrap.js"></script>
    <script src="../js/getPatients.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>


</body>
</html>

</cfif>