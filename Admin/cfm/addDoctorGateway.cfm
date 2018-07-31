
<!--- sends data to admin.cfc to store the data of new doctor --->
<cfif NOT IsUserLoggedIn()>

	<cflocation url="../../Regular-Users/cfm/index.cfm"
			addToken ="No">

	<cfelse>

		<cfset getdata=application.dataManipulation.checkValidity(#form#)>

		<cflocation
			url = "doctors.cfm"
			addToken = "no" >

</cfif>