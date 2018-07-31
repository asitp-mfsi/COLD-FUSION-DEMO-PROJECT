
<cfcomponent accessors="true" output="false" persistent="false">

	<!--- check validity of email and add doctor --->
	<cffunction name = "checkValidity" output = "false" access = "remote" returnType="string" returnFormat="json">

		<cfargument name="form" type="struct" required="true">


		<cftry>
			<cfquery name="emailQuery">
	    		select emailID from Doctor.doctorInformation where
	    						emailID=<cfqueryPARAM value = '#form.email#' CFSQLType = 'CF_SQL_VARCHAR'> ;
			</cfquery>

			<cfif #emailQuery.recordCount# LT 1 >
				<cfquery name="myQueryAddress" result="addressID" >
	   				 insert into [address] values(<cfqueryPARAM value = '#form.line1#' CFSQLType = 'CF_SQL_VARCHAR'>,
												  <cfqueryPARAM value = '#form.line2#' CFSQLType = 'CF_SQL_VARCHAR'>,
												  <cfqueryPARAM value = '#form.city#' CFSQLType = 'CF_SQL_VARCHAR'>,
												  <cfqueryPARAM value = '#form.state#' CFSQLType = 'CF_SQL_VARCHAR'>,
												  <cfqueryPARAM value = '#form.country#' CFSQLType = 'CF_SQL_VARCHAR'>,
												  <cfqueryPARAM value = '#form.zip#' CFSQLType = 'CF_SQL_VARCHAR'>);
				</cfquery>

				<cfset addID = numberFormat(#addressID.identitycol#)>


				<cfquery name="myQueryInformation" >
	   				 insert into Doctor.doctorInformation values(<cfqueryPARAM value = '#form.firstName#' CFSQLType = 'CF_SQL_VARCHAR'>
	   				 											,<cfqueryPARAM value = '#form.middleName#' CFSQLType = 'CF_SQL_VARCHAR'>
	   				 											,<cfqueryPARAM value = '#form.lastName#' CFSQLType = 'CF_SQL_VARCHAR'>
	   				 											,<cfqueryPARAM value = '#form.dob#' CFSQLType = 'CF_SQL_VARCHAR'>
	   				 											,<cfqueryPARAM value = '#form.gender#' CFSQLType = 'CF_SQL_VARCHAR'>
	   				 											,<cfqueryPARAM value = '#form.specialization#' CFSQLType = 'CF_SQL_VARCHAR'>
	   				 											,<cfqueryPARAM value = '#form.yearsOfExperience#' CFSQLType = 'CF_SQL_VARCHAR'>
	   				 											,<cfqueryPARAM value = '#addID#' CFSQLType = 'CF_SQL_INTEGER'>
	   				 											,<cfqueryPARAM value = '#form.mobile#' CFSQLType = 'CF_SQL_VARCHAR'>
	   				 											,<cfqueryPARAM value = '#form.mobilealternate#' CFSQLType = 'CF_SQL_VARCHAR'>
	   				 											,<cfqueryPARAM value = '#form.email#' CFSQLType = 'CF_SQL_VARCHAR'>
	   				 											,<cfqueryPARAM value = '#form.password#' CFSQLType = 'CF_SQL_VARCHAR'>
	   				 											,<cfqueryPARAM value = '#form.joiningdate#' CFSQLType = 'CF_SQL_VARCHAR'>);
				</cfquery>

				<cfreturn true/>

			<cfelse>

				<cfreturn false/>

			</cfif>

			<cfcatch type="database">

				<p>Database Error</p>

			</cfcatch>

		</cftry>

	</cffunction>


    <!--- Logout the User and delete the record from login table --->
	<cffunction name="logout" output="true" access="remote" returnType="boolean" returnFormat="json">


		<cftry>
					<cflock timeout=20 scope="Session" type="Readonly">
						<cfquery name="checkQuery" >
  							 delete from login where sessionid=<cfqueryPARAM value = '#Session.sessionid#'
														CFSQLType = 'CF_SQL_VARCHAR'>;
						</cfquery>
						<cfset var isUserLoggedIn = false>
						<cflogout />

						<cfreturn true/>
					</cflock>

					<cfcatch>
						<p>Logout Error</p>
					</cfcatch>

		</cftry>




	</cffunction>

    <!--- Get Data of Patients --->
    <cffunction name="getData" output="true" access="public" returnType="query">

	<cftry>
		 <cfquery name="getdataPatients" >
	   			 select Patient.patients.patientID , concat (Patient.patients.firstName,' ',Patient.patients.middleName,' ',
						Patient.patients.lastName) as PatientName ,Patient.patients.disease,Patient.patients.admittedDate,
					    Patient.patientStatus.[status] ,
					    concat( Doctor.doctorInformation.firstName, ' ',Doctor.doctorInformation.middleName,' '
					    ,Doctor.doctorInformation.lastName) as DoctorName   from Patient.patientStatus
					    inner join Patient.patients
						on Patient.patients.statusID = Patient.patientStatus.statusID
						inner join Patient.associatedDoctor
						on Patient.patients.patientID = Patient.associatedDoctor.patientID
						inner join Doctor.doctorInformation
						on Patient.associatedDoctor.doctorID = Doctor.doctorInformation.doctorID
		</cfquery>

		<cfreturn getdataPatients/>

		<cfcatch>
			<p>Retrieval Error</p>
		</cfcatch>

	</cftry>

</cffunction>

	<!--- Get data of Patients to be discharged --->
    <cffunction name="getReadyToDischargePatients" output="true" access="public" returnType="query">

		<cftry>
			 <cfquery name="getdataPatients" >
		   			 select Patient.patients.patientID , concat (Patient.patients.firstName,' ',Patient.patients.middleName,' ',
						    Patient.patients.lastName) as PatientName ,Patient.patients.disease,Patient.patients.admittedDate,
						    Patient.patientStatus.[status] ,  concat( Doctor.doctorInformation.firstName
							, ' ',Doctor.doctorInformation.middleName,' ',Doctor.doctorInformation.lastName) as DoctorName
						    from Patient.patientStatus
						    inner join Patient.patients
							on Patient.patients.statusID = Patient.patientStatus.statusID
							inner join Patient.associatedDoctor
							on Patient.patients.patientID = Patient.associatedDoctor.patientID
							inner join Doctor.doctorInformation
							on Patient.associatedDoctor.doctorID = Doctor.doctorInformation.doctorID
							where Patient.patients.statusID = <cfqueryPARAM value="3" CFSQLType = "CF_SQL_INTEGER">
			</cfquery>

			<cfreturn getdataPatients/>

			<cfcatch>
				<p>Retrieval Error</p>
			</cfcatch>

		</cftry>

</cffunction>

    <!--- Get data of Doctor to display --->
	<cffunction name="getDoctorData" output="true" access="public" returnType="query">

		<cftry>
			 <cfquery name="getdatadoctor" >
	   		 	select doctorID,firstName,middleName,lastName,specialization from Doctor.doctorInformation
			 </cfquery>

			 <cfreturn getdatadoctor/>

			 <cfcatch>
				<p>Retrieval error</p>
			</cfcatch>

		</cftry>
	</cffunction>


    <!--- Get names of Doctor to show in option field --->
	<cffunction name="getDoctorNameID" output="true" access="public" returnType="query">

		<cftry>
			 <cfquery name="getdatadoctor" >
	   		 	select doctorID,concat(firstName,' ',middleName,' ',lastName) as fullname from Doctor.doctorInformation
			 </cfquery>

			 <cfreturn getdatadoctor/>

			 <cfcatch>
				<p>Retrieval Error</p>
			</cfcatch>
		</cftry>
	</cffunction>

    <!---  Add Patient --->
    <cffunction name = "addPatient" output = "true" access = "remote" returnType="string" returnFormat="json">

		<cfargument name="firstName" type="string" required="true">
		<cfargument name="middleName" type="string" required="false">
		<cfargument name="lastName" type="string" required="true">
		<cfargument name="dob" type="string" required="true">
		<cfargument name="disease" type="string" required="true">
		<cfargument name="gender" type="string" required="true">
		<cfargument name="admittedDate" type="string" required="true">
		<cfargument name="email" type="string" required="true">
		<cfargument name="mobile" type="string" required="true">
		<cfargument name="mobileAlternate" type="string" required="true">
		<cfargument name="country" type="string" required="true" >
		<cfargument name="line1" type="string" required="true">
		<cfargument name="line2" type="string" required="false">
		<cfargument name="city" type="string" required="true">
		<cfargument name="state" type="string" required="true">
		<cfargument name="zip" type="string" required="true">
		<cfargument name="selectedValues" type="string" required="true">

		<cftry>

				<cfquery name="emailQuery">
		    		select emailID from Patient.patients where emailID=<cfqueryPARAM value = '#arguments.email#' CFSQLType = 'CF_SQL_VARCHAR'> ;
				</cfquery>

				<cfset DoctorID = ListToArray(selectedValues)>
				<cfset DoctorIDLen = arraylen(DoctorID)>

				<cfif #emailQuery.recordCount# LT 1 >

				<cfquery name="myQueryAddress" result="addressID" >
	   				 insert into [address] values(<cfqueryPARAM value = '#form.line1#' CFSQLType = 'CF_SQL_VARCHAR'>,
	   				                              <cfqueryPARAM value = '#form.line2#' CFSQLType = 'CF_SQL_VARCHAR'>,
	   				                              <cfqueryPARAM value = '#form.city#' CFSQLType = 'CF_SQL_VARCHAR'>,
	   				                              <cfqueryPARAM value = '#form.state#' CFSQLType = 'CF_SQL_VARCHAR'>,
	   				                              <cfqueryPARAM value = '#form.country#' CFSQLType = 'CF_SQL_VARCHAR'>,
	   				                              <cfqueryPARAM value = '#form.zip#' CFSQLType = 'CF_SQL_VARCHAR'>);
				</cfquery>

				<cfset addID = numberFormat(#addressID.identitycol#)>

				<cfquery name="myQueryInformation" result="patientID" >
	   				 insert into Patient.patients values(<cfqueryPARAM value = '#form.firstName#' CFSQLType = 'CF_SQL_VARCHAR'>,
	   				                                     <cfqueryPARAM value = '#form.middleName#' CFSQLType = 'CF_SQL_VARCHAR'>,
	   				                                     <cfqueryPARAM value = '#form.lastName#' CFSQLType = 'CF_SQL_VARCHAR'>,
	   				                                     <cfqueryPARAM value = '#form.dob#' CFSQLType = 'CF_SQL_VARCHAR'>,
	   				                                     <cfqueryPARAM value = '#form.gender#' CFSQLType = 'CF_SQL_VARCHAR'>,
	   				                                     <cfqueryPARAM value = '#form.disease#' CFSQLType = 'CF_SQL_VARCHAR'>,
	   				                                     <cfqueryPARAM value = '#form.admittedDate#' CFSQLType = 'CF_SQL_VARCHAR'>,
	   				                                     <cfqueryPARAM value = '#form.mobile#' CFSQLType = 'CF_SQL_VARCHAR'>,
	   				                                     <cfqueryPARAM value = '#form.mobilealternate#' CFSQLType = 'CF_SQL_VARCHAR'>,
	   				                                     <cfqueryPARAM value = '#form.email#' CFSQLType = 'CF_SQL_VARCHAR'>,
	   				                                     <cfqueryPARAM value = '#addID#' CFSQLType = 'CF_SQL_INTEGER'>,
	   				                                     <cfqueryPARAM value = '2' CFSQLType = 'CF_SQL_INTEGER'>);
				</cfquery>

				<cfset patientIDNumber = numberFormat(#patientID.identitycol#)>


				<cfloop from = "1" to = "#DoctorIDLen#" index="i">

					<cfquery name="myQueryDoctor" result ="associatedID">
						 insert into  Patient.associatedDoctor values(<cfqueryPARAM value = '#patientIDNumber#' CFSQLType = 'CF_SQL_INTEGER'>,
						                                              <cfqueryPARAM value = '#DoctorID[i]#' CFSQLType = 'CF_SQL_INTEGER'>);
					</cfquery>

				</cfloop>

				<cfreturn true/>

			<cfelse>

				<cfreturn false/>

			</cfif>

			<cfcatch type="database">

				<p>Database Error</p>

			</cfcatch>

		</cftry>

	</cffunction>



    <cffunction name= "getPatientDetails" output="true" access="remote" returnType="array" >

	<cfargument name="id" type="string" required="true">
	<cftry>
		<cfquery name="detailsOfPatient">
			select Patient.patients.firstName,
	       Patient.patients.middleName,
		   Patient.patients.lastName,
		   Patient.patients.dob,
		   Patient.patients.gender,
		   Patient.patients.disease,
		   Patient.patients.admittedDate,
		   Patient.patients.phoneNumber,
		   Patient.patients.alternatePhoneNumber,
		   Patient.patients.emailID,
		   [address].LineNo1,
		   [address].LineNo2,
		   [address].city,
		   [address].[state],
		   [address].country,
		   [address].zipcode

		   from Patient.patients
		   inner join
		   [address]
		   on
		   Patient.patients.addressID=[address].addressID
		   where Patient.patients.PatientID=#id#
		</cfquery>

		<cfset patientArray = arraynew(1)>

		<CFLOOP QUERY="detailsOfPatient">
				<cfset temp = structNew() />
				<cfset temp.firstName = firstName />
				<cfset temp.middleName = middleName />
				<cfset temp.lastName = lastName />
				<cfset temp.dob = dateFormat(dob,'dd-mmm-yyyy') />
				<cfset temp.gender = gender />
				<cfset temp.disease = disease />
				<cfset temp.admittedDate = dateFormat(admittedDate,'dd-mmm-yyyy') />
				<cfset temp.phoneNumber = phoneNumber />
				<cfset temp.alternatePhoneNumber = alternatePhoneNumber />
				<cfset temp.emailID = emailID />
				<cfset temp.LineNo1 = LineNo1 />
				<cfset temp.LineNo2 = LineNo2 />
				<cfset temp.city = city />
				<cfset temp.state = state />
				<cfset temp.country = country />
				<cfset temp.zipcode = zipcode />
				<cfset ArrayAppend(patientArray,temp )>
			</CFLOOP>


		<cfreturn patientArray >

		<cfcatch>
			<p>Database ERROR</p>
		</cfcatch>

	</cftry>

</cffunction>





</cfcomponent>
