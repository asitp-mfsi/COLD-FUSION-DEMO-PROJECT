<!---
	--- NewCFComponent
	--- --------------
	---
	--- author: mindfire
	--- date:   7/18/18
	--->
<cfcomponent accessors="true" output="false" persistent="false">

	<!--- get doctor id --->

	<cffunction name="getID" output="false" access="public" returnType="query">

			<cfargument name="doctorEmailId" type="string" required="true">
			<cftry>
				<cfquery name="getDoctor">
					SELECT [doctorID] ,
					  CONCAT( [Doctor].[doctorInformation].[firstName], ' ',[Doctor].[doctorInformation].[middleName],' ',[Doctor].[doctorInformation].[lastName])
					  AS DoctorName
					  FROM [Doctor].[doctorInformation]
					  WHERE [emailID] = <cfqueryparam value='#doctorEmailId#' cfsqltype="CF_sql_varchar">
				</cfquery>

				<cfreturn "#getDoctor#" />

				<cfcatch>
				</cfcatch>
			</cftry>


</cffunction>

	<!--- get doctor data --->

		<cffunction name="getData" output="false" access="public" returnType="query">

			<cfargument name="doctorId" type="string" required="true">
		<cftry>

		 	<cfquery name="getdataPatients" >
						SELECT [Patient].[patients].[patientID] ,
						CONCAT ([Patient].[patients].[firstName],' ',[Patient].[patients].[middleName],' ',[Patient].[patients].lastName)
						AS PatientName ,
						[Patient].[patients].[disease],
						[Patient].[patients].[admittedDate],
						[Patient].[patients].[estimatedDischargeDate] ,
					    [Patient].[patientStatus].[status] ,
					    CONCAT( [Doctor].[doctorInformation].[firstName], ' ',[Doctor].[doctorInformation].[middleName],' ',[Doctor].[doctorInformation].[lastName])
					    AS DoctorName , [Doctor].[doctorInformation].[doctorID]
					    FROM [Patient].[patientStatus]
					    INNER JOIN [Patient].[patients]
						ON [Patient].[patients].[statusID] = [Patient].[patientStatus].[statusID]
						INNER JOIN [Patient].[associatedDoctor]
						ON [Patient].[patients].[patientID] = [Patient].[associatedDoctor].[patientID]
						INNER JOIN [Doctor].[doctorInformation]
						ON [Patient].[associatedDoctor].[doctorID] = [Doctor].[doctorInformation].[doctorID]
						WHERE [Patient].[associatedDoctor].[patientID] in
						(SELECT [Patient].[associatedDoctor].[patientID] FROM [Patient].[associatedDoctor] WHERE
						 [doctorID] =  <cfqueryparam value='#doctorID#' cfsqltype="CF_sql_integer">)
			</cfquery>

				<cfreturn getdataPatients />

			<cfcatch>
				<cfset logerror=application.errorHMS.logError('#cfcatch.Type#','"#cfcatch.cause.message#"')>
			</cfcatch>
		</cftry>

</cffunction>



	<!--- profile details --->
	<cffunction name="getDoctorDetails" output="false" access="public" returnType="query" returnFormat="json">

		<cfargument name="id" type="string" required="true">
		<cftry>
			<cfquery name="details">
				SELECT [doctorID],
				      concat([firstName],' '
				      ,[middleName],' '
				      ,[lastName]) AS fullName
				      ,[dob]
				      ,[gender]
				      ,[specialization]
				      ,[yearsOfExperience]
				      ,[phoneNumber]
				      ,[phoneNumberAlternate]
				      ,[emailID]
				      ,[joiningdate]
				      ,[address].[LineNo1]
				      ,[address].[LineNo2]
				      ,[address].[city]
				      ,[address].[state]
				      ,[address].[country]
				      ,[address].[zipcode]
  					  FROM
					  [Doctor].[doctorInformation]
					  INNER JOIN
					  [address]
					  ON
					  [Doctor].[doctorInformation].[addressID] = [address].[addressID]
					  WHERE [doctorID] = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer">

			</cfquery>
			<cfreturn details />
			<cfcatch>
				<p>Error</p>
			</cfcatch>
		</cftry>
	</cffunction>


	<cffunction name="changePassword" output="false" access="remote" returnType="string" returnFormat="json">
		<cfargument name="oldPassword" type="string" required="true">
		<cfargument name="newPassword" type="string" required="true">
		<cfargument name="id" type="string" required="true">

		<cftry>
			<cfset var oldpass = application.dataManipulation.returnHashPassword('#arguments.oldPassword#','SHA1')>
			<cfset var newpass = application.dataManipulation.returnHashPassword('#arguments.newPassword#','SHA1')>




			<cfquery name="checkpassword">
				SELECT [doctorID]
					FROM [Doctor].[doctorInformation]
					WHERE
					[password] = <cfqueryparam value = '#oldpass#' cfsqltype = 'CF_SQL_VARCHAR'>
					AND
					[doctorID] = <cfqueryparam value = '#arguments.id#' cfsqltype = 'CF_SQL_INTEGER'>
			</cfquery>

			<cfif #checkpassword.recordcount# EQ 1>

				<cfquery name="passwordChange">

					UPDATE [Doctor].[doctorInformation]
						SET [password] = <cfqueryparam value = '#newpass#' cfsqltype = 'CF_SQL_VARCHAR'>
						WHERE
						[doctorID] = <cfqueryparam value = '#arguments.id#' cfsqltype = 'CF_SQL_INTEGER'>

				</cfquery>

				<cfreturn true />

			</cfif>

			<cfreturn false />

			<cfcatch>

			</cfcatch>
		</cftry>

	</cffunction>
</cfcomponent>
