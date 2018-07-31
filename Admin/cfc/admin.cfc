<cfcomponent accessors="true" output="false" persistent="false">

	<!--- check validity of email and add doctor --->

	<cffunction name = "checkValidity" output = "false" access = "remote" returnType="string" returnFormat="json">
		<cfargument name="firstName" type="string" required="true">
		<cfargument name="middleName" type="string" required="false">
		<cfargument name="lastName" type="string" required="true">
		<cfargument name="dob" type="string" required="true">
		<cfargument name="specialization" type="string" required="true">
		<cfargument name="gender" type="string" required="true">
		<cfargument name="joiningdate" type="string" required="true">
		<cfargument name="password" type="string" required="false">
		<cfargument name="yearsOfExperience" type="string" required="true">
		<cfargument name="email" type="string" required="true">
		<cfargument name="mobile" type="string" required="true">
		<cfargument name="mobileAlternate" type="string" required="false">
		<cfargument name="country" type="string" required="true" >
		<cfargument name="line1" type="string" required="true">
		<cfargument name="line2" type="string" required="false">
		<cfargument name="city" type="string" required="true">
		<cfargument name="state" type="string" required="true">
		<cfargument name="zip" type="string" required="true">
		<cfargument name="id" type="string" required="false">
		<cfargument name="functionality" type="string" required="true">
		<cftry>
			<cfset var returnValue = false/>
			<cfif #functionality# NEQ 'update'>
			<cfset var passkey = application.dataManipulation.returnHashPassword('#arguments.password#','SHA1')>
				<cfquery name="emailQuery">
		    		SELECT emailID FROM Doctor.doctorInformation WHERE
		    						emailID=<cfqueryparam value = '#arguments.email#' cfsqltype = 'CF_SQL_VARCHAR'> ;
				</cfquery>
				<cfif #emailQuery.recordCount# LT 1 >
					<cfset var addressID = application.dataManipulation.storeAddress('#arguments.country#',
																				 '#arguments.line1#',
																				 '#arguments.line2#',
																				 '#arguments.city#',
																				 '#arguments.state#',
																				 '#arguments.zip#',
																				 '0')>
					<cfset var addID = numberFormat(#addressID#)>
					<cfquery name="myQueryInfo">
		   				 INSERT INTO [Doctor].[doctorInformation]
		   				 	   ([firstName]
					           ,[middleName]
					           ,[lastName]
					           ,[dob]
					           ,[gender]
					           ,[specialization]
					           ,[yearsOfExperience]
					           ,[addressID]
					           ,[phoneNumber]
					           ,[phoneNumberAlternate]
					           ,[emailID]
					           ,[password]
					           ,[joiningdate])
					            VALUES(
					             <cfqueryparam value = '#arguments.firstName#' cfsqltype = 'CF_SQL_VARCHAR'>
								,<cfqueryparam value = '#arguments.middleName#' cfsqltype = 'CF_SQL_VARCHAR' null="#not len(arguments.middleName)#">
								,<cfqueryparam value = '#arguments.lastName#' cfsqltype = 'CF_SQL_VARCHAR'>
								,<cfqueryparam value = '#arguments.dob#' cfsqltype = 'CF_SQL_VARCHAR'>
								,<cfqueryparam value = '#arguments.gender#' cfsqltype = 'CF_SQL_VARCHAR'>
								,<cfqueryparam value = '#arguments.specialization#' cfsqltype = 'CF_SQL_VARCHAR'>
								,<cfqueryparam value = '#arguments.yearsOfExperience#' cfsqltype = 'CF_SQL_VARCHAR'>
								,<cfqueryparam value = '#addID#' cfsqltype = 'CF_SQL_INTEGER'>
								,<cfqueryparam value = '#arguments.mobile#' cfsqltype = 'CF_SQL_VARCHAR'>
								,<cfqueryparam value = '#arguments.mobilealternate#' cfsqltype = 'CF_SQL_VARCHAR' null="#not len(arguments.mobilealternate)#">
								,<cfqueryparam value = '#arguments.email#' cfsqltype = 'CF_SQL_VARCHAR'>
								,<cfqueryparam value = '#passkey#' cfsqltype = 'CF_SQL_VARCHAR'>
								,<cfqueryparam value = '#arguments.joiningdate#' cfsqltype = 'CF_SQL_VARCHAR'>);
					</cfquery>

					<cfset returnValue = true />
				<cfelse>
					<cfset returnValue = false/>
				</cfif>
			<cfelse>
				<cfquery name="getAddressID">
		    		SELECT [addressId]
		    				FROM [Doctor].[doctorInformation]
		    				WHERE [doctorID] = <cfqueryparam value = '#id#' cfsqltype = 'CF_SQL_INTEGER'> ;
				</cfquery>
					<cfset var addressID = application.dataManipulation.storeAddress('#arguments.country#',
																			 '#arguments.line1#',
																			 '#arguments.line2#',
																			 '#arguments.city#',
																			 '#arguments.state#',
																			 '#arguments.zip#',
																			 '#getAddressID.addressId#')>
				<cfquery name="myQueryInfo">
	   				 UPDATE [Doctor].[doctorInformation] SET
 				 						[firstName] = <cfqueryparam value = '#arguments.firstName#' cfsqltype = 'CF_SQL_VARCHAR'>,
	   				 					[middleName] = <cfqueryparam value = '#arguments.middleName#' cfsqltype = 'CF_SQL_VARCHAR' null="#not len(arguments.middleName)#">,
	   				 		            [lastName] = <cfqueryparam value = '#arguments.lastName#' cfsqltype = 'CF_SQL_VARCHAR'>,
	   				 				    [dob] = <cfqueryparam value = '#arguments.dob#' cfsqltype = 'CF_SQL_VARCHAR'>,
	   				 					[gender] = <cfqueryparam value = '#arguments.gender#' cfsqltype = 'CF_SQL_VARCHAR'>,
	   				 					[specialization] = <cfqueryparam value = '#arguments.specialization#' cfsqltype = 'CF_SQL_VARCHAR'>,
	   				 					[yearsOfExperience] =  <cfqueryparam value = '#arguments.yearsOfExperience#' cfsqltype = 'CF_SQL_VARCHAR'>,
	   				 					[addressID] = <cfqueryparam value = '#getAddressID.addressId#' cfsqltype = 'CF_SQL_INTEGER'>,
	   				 					[phoneNumber] = <cfqueryparam value = '#arguments.mobile#' cfsqltype = 'CF_SQL_VARCHAR'>,
	   				 					[phoneNumberAlternate] = <cfqueryparam value = '#arguments.mobilealternate#' cfsqltype = 'CF_SQL_VARCHAR' null="#not len(arguments.mobilealternate)#">,
	   				 					[emailID] = <cfqueryparam value = '#arguments.email#' cfsqltype = 'CF_SQL_VARCHAR'>,
	   				 					[joiningdate] = <cfqueryparam value = '#arguments.joiningdate#' cfsqltype = 'CF_SQL_VARCHAR'>
 				           			 WHERE [doctorID] = <cfqueryparam value = '#id#' cfsqltype = 'CF_SQL_INTEGER'>;
				</cfquery>
				<cfset returnValue = true />
			</cfif>
			<cfreturn #returnValue# >
			<cfcatch>
				<p>Database error</p>
			</cfcatch>
		</cftry>
	</cffunction>

	<!--- Get Data of Patients --->

	<cffunction name="getData" output="false" access="public" returnType="query">
		<cftry>
			<cfquery name="getdataPatients" >
   			 SELECT [Patient].[patients].[patientID] ,
   			        concat ([Patient].[patients].[firstName],' ',[Patient].[patients].[middleName],' ',[Patient].[patients].[lastName]) AS PatientName ,Patient.patients.disease,Patient.patients.admittedDate,
					[Patient].[patients].[estimatedDischargeDate] ,
				    [Patient].[patientStatus].[status] ,
				    concat( [Doctor].[doctorInformation].[firstName], ' ',[Doctor].[doctorInformation].[middleName],' '
				    ,[Doctor].[doctorInformation].[lastName]) AS DoctorName   FROM [Patient].[patientStatus]
				    INNER JOIN [Patient].[patients]
					ON [Patient].[patients].[statusID] = [Patient].[patientStatus].[statusID]
					INNER JOIN [Patient].[associatedDoctor]
					ON [Patient].[patients].[patientID] = [Patient].[associatedDoctor].[patientID]
					INNER JOIN [Doctor].[doctorInformation]
					ON [Patient].[associatedDoctor].[doctorID] = [Doctor].[doctorInformation].[doctorID]
					ORDER BY [Patient].[patients].[patientID] DESC
		</cfquery>

			<cfreturn getdataPatients/>
			<cfcatch>
				<cfset logerror=application.errorHMS.logError('#cfcatch.Type#','"#cfcatch.cause.message#"')>
			</cfcatch>
		</cftry>
	</cffunction>

	<!--- Get data of Patients to be discharged --->

	<cffunction name="getReadyToDischargePatients" output="false" access="public" returnType="query">
		<cftry>
			<cfquery name="getdataPatients" >
		   			 SELECT [Patient].[patients].[patientID] ,
   			        concat ([Patient].[patients].[firstName],' ',[Patient].[patients].[middleName],' ',[Patient].[patients].[lastName]) AS PatientName ,Patient.patients.disease,Patient.patients.admittedDate,
					[Patient].[patients].[estimatedDischargeDate] ,
				    [Patient].[patientStatus].[status] ,
				    concat( [Doctor].[doctorInformation].[firstName], ' ',[Doctor].[doctorInformation].[middleName],' '
				    ,[Doctor].[doctorInformation].[lastName]) AS DoctorName   FROM [Patient].[patientStatus]
				    INNER JOIN [Patient].[patients]
					ON [Patient].[patients].[statusID] = [Patient].[patientStatus].[statusID]
					INNER JOIN [Patient].[associatedDoctor]
					ON [Patient].[patients].[patientID] = [Patient].[associatedDoctor].[patientID]
					INNER JOIN [Doctor].[doctorInformation]
					ON [Patient].[associatedDoctor].[doctorID] = [Doctor].[doctorInformation].[doctorID]
					WHERE [Patient].[patients].[statusID] = <cfqueryparam value="3" cfsqltype = "CF_SQL_INTEGER">
			</cfquery>
			<cfreturn getdataPatients/>
			<cfcatch>
				<cfset logerror=application.errorHMS.logError('#cfcatch.Type#','"#cfcatch.cause.message#"')>
			</cfcatch>
		</cftry>
	</cffunction>

	<!--- Get data of Doctor to display --->

	<cffunction name="getDoctorData" output="false" access="public" returnType="query">
		<cftry>
			<cfquery name="getdatadoctor" >
	   		 	SELECT [doctorID],
	   		 		   [firstName],
	   		 		   [middleName],
	   		 		   [lastName],
	   		 		   [specialization]
	   		 		   FROM
	   		 		   [Doctor].[doctorInformation]
	   		 		   ORDER BY
	   		 		   [DoctorID]
	   		 		   ASC
			 </cfquery>
			<cfreturn getdatadoctor/>
			<cfcatch>
				<cfset logerror=application.errorHMS.logError('#cfcatch.Type#','"#cfcatch.cause.message#"')>
			</cfcatch>
		</cftry>
	</cffunction>

	<!--- Get names of Doctor to show in option field --->

	<cffunction name="getDoctorNameID" output="false" access="public" returnType="query">
		<cftry>
			<cfquery name="getdatadoctor" >
	   		 	SELECT [doctorID],
	   		 		   concat([firstName],' ',[middleName],' ',[lastName]) AS fullname
	   		 		   FROM [Doctor].[doctorInformation]
			 </cfquery>
			<cfreturn getdatadoctor/>
			<cfcatch>
				<cfset logerror=application.errorHMS.logError('#cfcatch.Type#','"#cfcatch.cause.message#"')>
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
		<cfargument name="id" type="string" required="false">
		<cfargument name="functionality" type="string" required="true">


		<cftry>
			<cfset var returnValue = false/>
			<cfset local.estDischargeDate = ''>
			<cfif #arguments.functionality# NEQ 'update'>

				<cfquery name="emailQuery">
		    		SELECT [emailID]
		    				 FROM [Patient].[patients]
		    				  WHERE [emailID] = <cfqueryparam value = '#arguments.email#' cfsqltype = 'CF_SQL_VARCHAR'> ;
				</cfquery>
			<cfset DoctorID = ListToArray(selectedValues)>
			<cfset DoctorIDLen = arraylen(DoctorID)>
			<cfif #emailQuery.recordCount# LT 1 >
				<cfset addressID = application.dataManipulation.storeAddress('#arguments.country#',
																			 '#arguments.line1#',
																			 '#arguments.line2#',
																			 '#arguments.city#',
																			 '#arguments.state#',
																			 '#arguments.zip#',
																			 '0')>
				<cfset addID = numberFormat(#addressID#)>
				<cfquery name="myQueryInformation" result="patientID" >
	   				 INSERT INTO [Patient].[patients]
	   				 	   ([firstName]
				           ,[middleName]
				           ,[lastName]
				           ,[dob]
				           ,[gender]
				           ,[disease]
				           ,[admittedDate]
				           ,[phoneNumber]
				           ,[alternatePhoneNumber]
				           ,[emailID]
				           ,[addressID]
				           ,[statusID]
				           ,[estimatedDischargeDate])
				           VALUES(
				           <cfqueryparam value = '#arguments.firstName#' cfsqltype = 'CF_SQL_VARCHAR'>,
                           <cfqueryparam value = '#arguments.middleName#' cfsqltype = 'CF_SQL_VARCHAR' null="#not len(arguments.middleName)#">,
                           <cfqueryparam value = '#arguments.lastName#' cfsqltype = 'CF_SQL_VARCHAR'>,
                           <cfqueryparam value = '#arguments.dob#' cfsqltype = 'CF_SQL_DATE'>,
                           <cfqueryparam value = '#arguments.gender#' cfsqltype = 'CF_SQL_VARCHAR'>,
                           <cfqueryparam value = '#arguments.disease#' cfsqltype = 'CF_SQL_VARCHAR'>,
                           <cfqueryparam value = '#arguments.admittedDate#' cfsqltype = 'CF_SQL_DATE'>,
                           <cfqueryparam value = '#arguments.mobile#' cfsqltype = 'CF_SQL_VARCHAR'>,
                           <cfqueryparam value = '#arguments.mobilealternate#' cfsqltype = 'CF_SQL_VARCHAR' null="#not len(arguments.middleName)#">,
                           <cfqueryparam value = '#arguments.email#' cfsqltype = 'CF_SQL_VARCHAR'>,
                           <cfqueryparam value = '#addID#' cfsqltype = 'CF_SQL_INTEGER'>,
                           <cfqueryparam value = '2' cfsqltype = 'CF_SQL_INTEGER'>,
                           <cfqueryparam value = '#local.estDischargeDate#' cfsqltype = 'CF_SQL_DATE' null="#not len(local.estDischargeDate)#"> );
				</cfquery>
				<cfset patientIDNumber = numberFormat(#patientID.identitycol#)>
				<cfloop FROM = "1" to = "#DoctorIDLen#" index="i">
					<cfquery name="myQueryDoctor" result ="associatedID">
						 INSERT INTO
						 	[Patient].[associatedDoctor]
						 	 ([patientID]
          					 ,[doctorID])
						 	 VALUES(
						 	 <cfqueryparam value = '#patientIDNumber#' cfsqltype = 'CF_SQL_INTEGER'>,
						     <cfqueryparam value = '#DoctorID[i]#' cfsqltype = 'CF_SQL_INTEGER'>);
					</cfquery>
				</cfloop>
				<cfset returnValue = true />
			<cfelse>
				<cfset returnValue = false/>
			</cfif>
			<cfelse>

				<cfquery name="getAddressID">
		    		SELECT addressId FROM Patient.patients WHERE PatientID=
		    							<cfqueryparam value = '#id#' cfsqltype = 'CF_SQL_INTEGER'> ;
				</cfquery>

					<cfset addressID = application.dataManipulation.storeAddress('#arguments.country#',
																			 '#arguments.line1#',
																			 '#arguments.line2#',
																			 '#arguments.city#',
																			 '#arguments.state#',
																			 '#arguments.zip#',
																			 '#getAddressID.addressId#')>

				<cfquery name="updatePatientInformation">
					UPDATE Patient.patients SET firstName = <cfqueryparam value = '#firstName#' cfsqltype = 'CF_SQL_VARCHAR'>,
		   				                        middleName = <cfqueryparam value = '#middleName#' cfsqltype = 'CF_SQL_VARCHAR' null="#not len(arguments.middleName)#">,
		   				                        lastName = <cfqueryparam value = '#lastName#' cfsqltype = 'CF_SQL_VARCHAR'>,
		   				                        dob = <cfqueryparam value = '#dob#' cfsqltype = 'CF_SQL_VARCHAR'>,
		   				                        gender = <cfqueryparam value = '#gender#' cfsqltype = 'CF_SQL_VARCHAR'>,
		   				                        disease = <cfqueryparam value = '#disease#' cfsqltype = 'CF_SQL_VARCHAR'>,
		   				                        admittedDate = <cfqueryparam value = '#admittedDate#' cfsqltype = 'CF_SQL_DATE'>,
		   				                        phoneNumber = <cfqueryparam value = '#mobile#' cfsqltype = 'CF_SQL_VARCHAR'>,
		   				                        alternatePhoneNumber = <cfqueryparam value = '#mobilealternate#' cfsqltype = 'CF_SQL_VARCHAR' null="#not len(arguments.middleName)#">,
		   				                        emailID = <cfqueryparam value = '#email#' cfsqltype = 'CF_SQL_VARCHAR'>
	   				           			 WHERE PatientID = <cfqueryparam value = '#id#' cfsqltype = 'CF_SQL_INTEGER'>;

	   			</cfquery>

				<cfset returnValue = true />
			</cfif>
			<cfreturn #returnValue# />
			<cfcatch>
				<cfset var logerror=application.errorHMS.logError('#cfcatch.Type#','"#cfcatch.cause.message#"')>
			</cfcatch>
		</cftry>
	</cffunction>

	<!--- Edit Patient Details --->

	<cffunction name= "getPatientDetails" output="true" access="remote" returnType="array" returnFormat="json" >
		<cfargument name="id" type="string" required="true">
		<cftry>
			<cfquery name="detailsOfPatient">
			SELECT [Patient].[patients].[firstName],
	       [Patient].[patients].[middleName],
		   [Patient].[patients].[lastName],
		   [Patient].[patients].[dob],
		   [Patient].[patients].[gender],
		   [Patient].[patients].[disease],
		   [Patient].[patients].[admittedDate],
		   [Patient].[patients].[phoneNumber],
		   [Patient].[patients].[alternatePhoneNumber],
		   [Patient].[patients].[emailID],
		   [address].[LineNo1],
		   [address].[LineNo2],
		   [address].[city],
		   [address].[state],
		   [address].[country],
		   [address].[zipcode]

		   FROM [Patient].[patients]
		   INNER JOIN
		   [address]
		   ON
		   [Patient].[patients].[addressID]=[address].[addressID]
		   WHERE [Patient].[patients].[PatientID]=#id#
		</cfquery>
			<cfset patientArray = arraynew(1)>
			<CFLOOP QUERY="detailsOfPatient">
				<cfset ArrayAppend(patientArray,firstName )/>
				<cfset ArrayAppend(patientArray,middleName ) />
				<cfset ArrayAppend(patientArray,lastName ) />
				<cfset ArrayAppend(patientArray,dateFormat(dob,'yyyy-mm-dd')  )/>
				<cfset ArrayAppend(patientArray,gender ) />
				<cfset ArrayAppend(patientArray,disease ) />
				<cfset ArrayAppend(patientArray,dateFormat(admittedDate,'yyyy-mm-dd') ) />
				<cfset ArrayAppend(patientArray,phoneNumber ) />
				<cfset ArrayAppend(patientArray,alternatePhoneNumber ) />
				<cfset ArrayAppend(patientArray,emailID ) />
				<cfset ArrayAppend(patientArray,LineNo1 ) />
				<cfset ArrayAppend(patientArray,LineNo2 ) />
				<cfset ArrayAppend(patientArray,city ) />
				<cfset ArrayAppend(patientArray,state ) />
				<cfset ArrayAppend(patientArray,country ) />
				<cfset ArrayAppend(patientArray,zipcode ) />

			</CFLOOP>


			<cfreturn patientArray />
			<cfcatch>
				<cfset logerror=application.errorHMS.logError('#cfcatch.Type#','"#cfcatch.cause.message#"')>
			</cfcatch>
		</cftry>
	</cffunction>

	<!--- get doctor details --->

	<cffunction name= "getDoctorDetails" output="false" access="remote" returnType="array" returnFormat="json" >
		<cfargument name="id" type="string" required="true">
		<cftry>
			<cfquery name="detailsOfDoctor">
				SELECT [Doctor].[doctorInformation].[firstName],
		       [Doctor].[doctorInformation].[middleName],
			   [Doctor].[doctorInformation].[lastName],
			   [Doctor].[doctorInformation].[dob],
			   [Doctor].[doctorInformation].[gender],
			   [Doctor].[doctorInformation].[specialization],
			   [Doctor].[doctorInformation].[joiningdate],
			   [Doctor].[doctorInformation].[phoneNumber],
			   [Doctor].[doctorInformation].[phoneNumberAlternate],
			   [Doctor].[doctorInformation].[emailID],
			   [Doctor].[doctorInformation].[password],
			   [Doctor].[doctorInformation].[yearsOfExperience],
			   [address].[LineNo1],
			   [address].[LineNo2],
			   [address].[city],
			   [address].[state],
			   [address].[country],
			   [address].[zipcode]

			   FROM [Doctor].[doctorInformation]
			   INNER JOIN
			   [address]
			   ON
			   [Doctor].[doctorInformation].[addressID]=[address].[addressID]
			   WHERE [Doctor].[doctorInformation].[doctorID]=#id#
			</cfquery>
				<cfset doctorArray = arraynew(1)>
				<CFLOOP QUERY="detailsOfDoctor">
					<cfset ArrayAppend(doctorArray,firstName )/>
					<cfset ArrayAppend(doctorArray,middleName ) />
					<cfset ArrayAppend(doctorArray,lastName ) />
					<cfset ArrayAppend(doctorArray,dateFormat(dob,'yyyy-mm-dd')  )/>
					<cfset ArrayAppend(doctorArray,gender ) />
					<cfset ArrayAppend(doctorArray,specialization ) />
					<cfset ArrayAppend(doctorArray,dateFormat(joiningdate,'yyyy-mm-dd') ) />
					<cfset ArrayAppend(doctorArray,phoneNumber ) />
					<cfset ArrayAppend(doctorArray,phoneNumberAlternate ) />
					<cfset ArrayAppend(doctorArray,emailID ) />
					<cfset ArrayAppend(doctorArray,password ) />
					<cfset ArrayAppend(doctorArray,yearsOfExperience ) />
					<cfset ArrayAppend(doctorArray,LineNo1 ) />
					<cfset ArrayAppend(doctorArray,LineNo2 ) />
					<cfset ArrayAppend(doctorArray,city ) />
					<cfset ArrayAppend(doctorArray,state ) />
					<cfset ArrayAppend(doctorArray,country ) />
					<cfset ArrayAppend(doctorArray,zipcode ) />

				</CFLOOP>

				<cfreturn doctorArray />
				<cfcatch>
					<cfset logerror=application.errorHMS.logError('#cfcatch.Type#','"#cfcatch.cause.message#"')>
				</cfcatch>
		</cftry>
	</cffunction>

	<!--- hash password --->

	<cffunction name="returnHashPassword" access="public" returntype="string">

		<cfargument name="password" type="string" required="true">
		<cfargument name="hashAlgorithm" type="string" required="true">

		<cftry>

			<cfreturn HASH("#password#","#hashAlgorithm#")/>

			<cfcatch>
				<cfset logerror=application.errorHMS.logError('#cfcatch.Type#','"#cfcatch.cause.message#"')>
			</cfcatch>

		</cftry>

	</cffunction>

	<!--- address store --->

	<cffunction name="storeAddress" output="true" access="public" returntype="string" returnFormat="json">
		<cfargument name="country" type="string" required="true" >
		<cfargument name="line1" type="string" required="true">
		<cfargument name="line2" type="string" required="false">
		<cfargument name="city" type="string" required="true">
		<cfargument name="state" type="string" required="true">
		<cfargument name="zip" type="string" required="true">
		<cfargument name="id" type="string" required="false">

		<cftry>
			<cfif #arguments.id# EQ '0'>

				<cfquery name="myQueryAddress" result="addressID" >
	   				 INSERT INTO [address]
	   				   ([LineNo1]
			           ,[LineNo2]
			           ,[city]
			           ,[state]
			           ,[country]
			           ,[zipcode])
		                VALUES(
            			  <cfqueryparam value = '#arguments.line1#' cfsqltype = 'CF_SQL_VARCHAR'>,
						  <cfqueryparam value = '#arguments.line2#' cfsqltype = 'CF_SQL_VARCHAR' null="#not len(arguments.line2)#">,
						  <cfqueryparam value = '#arguments.city#' cfsqltype = 'CF_SQL_VARCHAR'>,
						  <cfqueryparam value = '#arguments.state#' cfsqltype = 'CF_SQL_VARCHAR'>,
						  <cfqueryparam value = '#arguments.country#' cfsqltype = 'CF_SQL_VARCHAR'>,
						  <cfqueryparam value = '#arguments.zip#' cfsqltype = 'CF_SQL_VARCHAR'>);
				</cfquery>
				<cfreturn #addressID.identitycol#/>

			<cfelse>
				<cfquery name="updateAddress">
	   				 UPDATE [address] SET LineNo1 = <cfqueryparam value = '#line1#' cfsqltype = 'CF_SQL_VARCHAR'>,
	   				                      LineNo2 = <cfqueryparam value = '#line2#' cfsqltype = 'CF_SQL_VARCHAR' null="#not len(arguments.line2)#">,
	   				                      city =  <cfqueryparam value = '#city#' cfsqltype = 'CF_SQL_VARCHAR'>,
	   				                      state = <cfqueryparam value = '#state#' cfsqltype = 'CF_SQL_VARCHAR'>,
	   				                      country = <cfqueryparam value = '#country#' cfsqltype = 'CF_SQL_VARCHAR'>,
	   				                      zipcode = <cfqueryparam value = '#zip#' cfsqltype = 'CF_SQL_VARCHAR'>
	   				                      WHERE addressID = <cfqueryparam value = '#arguments.id#' cfsqltype = 'CF_SQL_INTEGER'>
				</cfquery>
				<cfreturn true/>
			</cfif>
			<cfcatch>
				<cfset logerror=application.errorHMS.logError('#cfcatch.Type#','"#cfcatch.cause.message#"')>
			</cfcatch>
		</cftry>
	</cffunction>

</cfcomponent>
