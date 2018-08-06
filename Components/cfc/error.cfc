<!---
	--- NewCFComponent
	--- --------------
	---
	--- author: mindfire
	--- date:   7/18/18
	--->
<cfcomponent accessors="true" output="false" persistent="false">


	<!--- logs error data --->

		<cffunction name="logError" output="false" access="public" returnType="void">

			<cfargument name="type" type="string" required="true">
			<cfargument name="message" type="string" required="true">

				 <cflog type="Error"
				file="HMSError"
				text="Exception error --
				   	  Exception type: #arguments.type#
					  Message: #arguments.message#"
					  >

		</cffunction>

		<!--- change patients status --->

		<cffunction name="changeStatus" output="true" access="remote" returnType="string" >
			<cfargument name="id" type="string" required="true">
			<cftry>

					<cfset patientId = numberFormat(id)>

					<cfquery name="status">

						UPDATE [Patient].[patients]
							 SET [statusID] = <cfif  #GetUserRoles()# EQ 'admin'>
							 					 <cfqueryparam value="4" CFSQLType='CF_SQL_INTEGER'> ,
							 				  <cfelse>
							 				  	 <cfqueryparam value="3" CFSQLType='CF_SQL_INTEGER'> ,
							 				  </cfif>
							 [estimatedDischargeDate] =<cfqueryparam value="#DateFormat(Now())#" CFSQLType='CF_SQL_DATE'>
							 WHERE [PatientID] = <cfqueryparam value="#patientId#" CFSQLType='CF_SQL_INTEGER'>
					</cfquery>
					<cfreturn true>
				<cfcatch>
					<cfset logerror=application.errorHMS.logError('#cfcatch.Type#','"#cfcatch.cause.message#"')>
				</cfcatch>
			</cftry>
		</cffunction>


		<!--- Logout the User and delete the record FROM login table --->

		<cffunction name="logout" output="false" access="remote" returnType="boolean" returnFormat="json">
			<cftry>
				<cflock timeout=20 scope="Session" type="Readonly">
					<cfquery name="checkQuery" >
	  							 DELETE FROM
										[login]
										WHERE [sessionid]=<cfqueryparam value = '#Session.sessionid#' cfsqltype = 'CF_SQL_VARCHAR'>;
							</cfquery>
					<cflogout />
					<cfreturn true/>
				</cflock>
				<cfcatch>
					<p>
						Logout Error
					</p>
				</cfcatch>
			</cftry>
		</cffunction>


		<cffunction name="resetPassword" output="true" access="remote" returnType="boolean" returnFormat="json">

				<cfargument name="username" type="string" required="true">
				<cfargument name="password" type="string" required="true">

				<cftry>

					<cfset getID=application.doctor.getID("#arguments.username#")>
					<cfquery name="exists">

						SELECT [doctorID]
						      ,[accessDate]
						  FROM [dbo].[forgotPassword]
						  WHERE [doctorID] = <cfqueryparam value="#getID.doctorID#" CFSQLType='CF_SQL_INTEGER'>

					</cfquery>

					<cfset datedifference = DateDiff("h","#Now()#", "#exists.accessDate#")>
					<cfdump var="#datedifference#">
					<cfif #datedifference# LT "24">
						<cfset var newpass = application.dataManipulation.returnHashPassword('#arguments.password#','SHA1')>

						<cfquery name="passwordChange">

							UPDATE [Doctor].[doctorInformation]
								SET [password] = <cfqueryparam value = '#newpass#' cfsqltype = 'CF_SQL_VARCHAR'>
								WHERE
								[doctorID] = <cfqueryparam value = '#getID.doctorID#' cfsqltype = 'CF_SQL_INTEGER'>

						</cfquery>

						<cfquery name="deleteRecord">

							DELETE FROM [dbo].[forgotPassword]
     							 WHERE [doctorID] = <cfqueryparam value = '#getID.doctorID#' cfsqltype = 'CF_SQL_INTEGER'>

						</cfquery>
						<cfreturn true/>
					</cfif>
						<cfreturn false>
					<cfcatch>

					</cfcatch>


				</cftry>


		</cffunction>









</cfcomponent>
