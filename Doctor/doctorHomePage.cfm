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
<link href="../Components/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" media="all">
<link rel="stylesheet" href="../Components/css/flexslider.css" type="text/css" media="screen" />


<!-- js -->
<script src="js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<!-- start-smooth-scrolling-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
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
	<cfset id = #getAuthUser()# >
	<cfset getID=application.doctor.getID(id)>
	<cfset getdata=application.doctor.getData(#getID.doctorID#)>
	<!--header-->
	<div class="header">
		<nav class="navbar navbar-default">
			<div class="container">
				<div class="navbar-header navbar-left">
					<h1><a href="adminHomePage.cfm"><img src="images/logo.png" alt="">We Care</a></h1>
				</div>
				<!--navigation-->

					<div class="header-right">
					<div class="top-nav-text">

					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-left">
							<li  ><a  class="link link--yaku" href="cfm/myprofile.cfm"><span>MY</span><span>-</span><span>PR</span><span>OF</span><span>IL</span><span>E</span></a></li>
							<li  ><a  class="link link--yaku" onclick="Logout()"><span>L</span><span>O</span><span>G</span><span>O</span><span>U</span><span>T</span></a></li>
							<li  ><a  class="link link--yaku" href="cfm/changePassword.cfm" ><span>CH</span><span>AN</span><span>GE</span><span>-</span><span>PA</span><span>SS</span><span>WO</span><span>RD</span></a></li>
						</ul>
						<div class="clearfix"> </div>
					</div><!--//navigation-->
				</div>
				<div class="clearfix"> </div>
			</div>
		</nav>
	</div>
	<!--//header-->
					<div class="doctorName">
						<cfoutput>
						<h3><span class="labelDoctor">WELCOME -</span> #getID.doctorname#</h3>
						<input type="hidden" value="#getID.doctorID#" id="docID">
						</cfoutput>
					</div>

    <table id="dataTable" class="table table-bordered table-striped Doctortable" >
        <thead>
            <tr class="info">

				<th>Patient ID</th>
                <th>Name</th>
                <th>Disease</th>
                <th>Admitted Date</th>
				<th>Estimated Discharge Date</th>
                <th>Status</th>
				<th>Status Change</th>
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
						<cfif #status# EQ 'DISCHARGED'>
							<tr onclick="getPatient(#PatientID#)" class ="clickToEdit warning"
										data-href="editPatient.cfm" value="#PatientID#">
						<cfelseif #status# EQ 'READY TO DISCHARGE'>
							<tr onclick="getPatient(#PatientID#)" class ="clickToEdit success"
										data-href="editPatient.cfm" value="#PatientID#">
						<cfelse>
							<tr onclick="getPatient(#PatientID#)" class ="clickToEdit"
										data-href="editPatient.cfm" value="#PatientID#">
						</cfif>
								<td>PID-#PatientID#</td>
				                <td>#PATIENTNAME#</td>
								<td>#disease#</td>
				                <td>#dateFormat(admittedDate,"dd-mm-yyyy")#</td>
				                <td>#dateFormat(estimatedDischargeDate,"dd-mm-yyyy")#</td>
				                <td>#status#</td>
				                <td class="statusChange">
					                 <cfif #status# NEQ 'Discharged' AND #status# NEQ 'READY TO DISCHARGE'>
						                 <a class="btn btn-sm btn-warning">
							                 <span class="glyphicon glyphicon-pencil"  onclick="statusChange(#PatientID#)">
											 </span>
										 </a>
									 </cfif>
								</td>
				                <td>  <cfset nameDoctor = "">
									  <cfloop query="getdata">

										  <cfif #PatientID# EQ #ID# AND #DoctorID# NEQ #getID.doctorid#>

										  	<cfset nameDoctor = #DoctorName# & " <br> " & #nameDoctor#>
										  </cfif>

									  </cfloop>
								 	  #nameDoctor#
									  <cfset prev= next>
								</cfif>		 </td>

				</tr>
		</cfloop>

			</cfoutput>




		</tbody>

    </table>





	<!--copy-right-->
	<div class="copy-right">
		<div class="container">
			<div class="clearfix"> </div>
			<p>© 2016 We care . All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
		</div>
	</div>
	<!--//copy-right-->
	<!--smooth-scrolling-of-move-up-->

	</script>
	<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	<!--//smooth-scrolling-of-move-up-->
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/additional-methods.js"></script>
    <script src="js/bootstrap.js"></script>
	 <script src="../Components/js/logout.js"></script>
	<script src="js/profile.js"></script>
	<script src="js/statusChange.js"></script>
	<script src="js/changePassword.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>
	<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>



</body>
</html>