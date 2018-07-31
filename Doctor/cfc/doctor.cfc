<!---
	--- NewCFComponent
	--- --------------
	---
	--- author: mindfire
	--- date:   7/18/18
	--->
<cfcomponent accessors="true" output="false" persistent="false">

	<!--- get doctor id --->

	<cffunction name="getID" output="false" access="public" returnType="string">

			<cfargument name="doctorEmailId" type="string" required="true">
			<cftry>
				<cfquery name="getDoctor">
					SELECT [doctorID]
							FROM [Doctor].[doctorInformation]
							WHERE [emailID] = <cfqueryparam value='#doctorEmailId#' cfsqltype="CF_sql_varchar">
				</cfquery>

				<cfreturn "#getDoctor.doctorID#" />

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



	<!--- change patients status --->

	<cffunction name="changeStatus" output="false" access="remote" returnType="string" >
		<cfargument name="id" type="string" required="true">
		<cftry>
				<cfset patientId = numberFormat(id)>
				<cfquery name="status">

					UPDATE [Patient].[patients]
						 SET [statusID] = <cfqueryparam value="3" CFSQLType='CF_SQL_INTEGER'>
						 WHERE [PatientID] = <cfqueryparam value="#patientId#" CFSQLType='CF_SQL_INTEGER'>
				</cfquery>
				<cfreturn true>
			<cfcatch>
				<cfset logerror=application.errorHMS.logError('#cfcatch.Type#','"#cfcatch.cause.message#"')>
			</cfcatch>
		</cftry>
	</cffunction>



</cfcomponent>
