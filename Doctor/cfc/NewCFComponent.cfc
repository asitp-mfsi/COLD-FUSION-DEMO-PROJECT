<!---
	--- NewCFComponent
	--- --------------
	---
	--- author: mindfire
	--- date:   7/18/18
	--->
<cfcomponent accessors="true" output="true" persistent="false">
	<cffunction name = "checkValidity" output = "true" access = "remote" returnType="boolean" returnFormat="json">
		<cfargument name="email" type="any" required="true" >
		<cfargument name="firstName" type="any" required="true" >
		<cfargument name="lastName" type="any" required="true" >
		<cfargument name="password" type="any" required="true" >
		<cfargument name="mobile" type="any" required="true" >
		<cfargument name="country" type="any" required="true" >
		<cfquery name="emailQuery">
    select email from user_information where email='#arguments.email#';
	</cfquery>
		<cfif #emailQuery.recordCount# LT 1 >
			<cfquery name="myQuery" >
    insert into user_information values('#arguments.firstName#','#arguments.lastName#','#arguments.email#','#arguments.password#','#arguments.mobile#','#arguments.country#');
	</cfquery>
			<cfreturn true/>
		<cfelse>
			<cfreturn false/>
		</cfif>
	</cffunction>



	<cffunction name = "checkLoginCreadentials" output = "true" access = "remote" returnType="boolean" returnFormat="json">
		<cfargument name="email" type="any" required="true" >
		<cfargument name="password" type="any" required="true" >
		<cfquery name="emailQuery" >
   			 select * from user_information where email='#arguments.email#' and password='#arguments.password#';
		</cfquery>
				<cfif #emailQuery.recordCount# EQ 1 >
						 <cfquery name="loginQuery" >
   							 select * from login where username='#arguments.email#';
						</cfquery>
						<cfif #loginQuery.recordCount# EQ 0 >
										<cflock timeout=20 scope="Session" type="Readonly">
										<cfquery >
  				 							insert into login values ('#arguments.email#','#Session.sessionid#');
										</cfquery>
										<cflogin>
										<cfloginuser name = "#arguments.email#"
														password = "#arguments.password#"
														roles =  "user">
										</cflogin>
										<!--- <cfdump var="#session#"><cfdump var="#cookie#"><cfabort> --->

										<cfset var isUserLoggedIn = true>
								</cflock>


								 <cfreturn true/>
						<cfelse>
								<cfreturn false/>
						</cfif>
				<cfreturn false/>
				<cfelse>
				<cfreturn false/>
				</cfif>
	</cffunction>



	<cffunction name="logout" output="true" access="remote" returnType="boolean" returnFormat="json">

					<cflock timeout=20 scope="Session" type="Readonly">
					<cfquery name="checkQuery" >
  				 delete from login where sessionid='#Session.sessionid#';
			</cfquery>
			<cfset var isUserLoggedIn = false>
			<cflogout />

					<cfreturn true/>
				</cflock>




	</cffunction>


<cffunction name="getData" output="true" access="public" returnType="query">

	 <cfquery name="getdataPatients" >
   			 select PatientID,firstName,middleName,lastName,disease,admittedDate,status,associatedDoctor1,associatedDoctor2,associatedDoctor3,associatedDoctor4 from Patient.patients
						</cfquery>

						<cfreturn getdataPatients />
</cffunction>


<cffunction name="getDoctorData" output="true" access="public" returnType="query">

	 <cfquery name="getdatadoctor" >
   							 select doctorID,firstName,middleName,lastName,specialization from Doctor.doctor_information
	</cfquery>

			<cfreturn getdatadoctor />
				</cffunction>

</cfcomponent>
