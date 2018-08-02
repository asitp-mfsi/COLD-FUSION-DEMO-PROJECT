<!---
  --- Application
  --- -----------
  ---
  --- author: mindfire
  --- date:   7/19/18
  --->
<cfcomponent  output="false" >

<cfset This.name="CFProject110">
<cfset This.sessionManagement="Yes">
<cfset This.clientmanagement="Yes" >
<cfset This.sessiontimeout=#CreateTimeSpan(0,0,20,0)#>
<cfset this.datasource="CFDataSource">

	<cffunction
	        name="OnApplicationStart"
	        returntype="boolean">
		    <cftry>
				<cfset application.dataManipulation = createObject(
				"component","Admin.cfc.admin")/>

				<cfset application.doctor = createObject(
				"component","Doctor.cfc.doctor")/>

				<cfset application.errorHMS = createObject(
				"component","Components.cfc.error")/>


		        <cfreturn true />
		    <cfcatch>
				<cfreturn false />
			</cfcatch>
			</cftry>
    </cffunction>


	<cffunction
			name="onMissingTemplate">
		<cfargument name="targetPage" type="string" required=true/>

		<cftry>

		<cflog type="error" text="Missing template: #Arguments.targetPage#">

			<cfoutput>
			<h3>#Arguments.targetPage# could not be found.</h3>
			<p>You requested a non-existent ColdFusion page.<br />
			Please check the URL.</p>
			</cfoutput>
			<cfreturn true />

		<cfcatch>
		<cfreturn false />
		</cfcatch>
		</cftry>
	</cffunction>

	<cffunction
			name="onRequestStart">
		<cfargument name="requestname" required=true/>
		<cftry>
			<cfset var resultValue = true >

			<cfif find( "Admin", #requestname# ) OR find( "admin", #requestname# ) >
				<cfif IsUserLoggedIn() AND #GetUserRoles()# EQ 'admin'>
					<cfset resultValue = true >
					<cfelse>
					<cfset resultValue = false >
				</cfif>
			<cfelseif find( "Doctor", #requestname# )>
				<cfif IsUserLoggedIn() AND #GetUserRoles()# EQ 'doctor'>
					<cfset resultValue = true >
					<cfelse>
					<cfset var resultValue = false >
				</cfif>
			</cfif>
			<cfif resultvalue EQ true>
				<cfreturn #resultValue#/>
			<cfelse>
				<cflocation url="/Regular-Users/cfm/index.cfm" addtoken="No">
			</cfif>

		<cfcatch>
				<cfreturn false/>
		</cfcatch>
		</cftry>

</cffunction>

	<cffunction
			name="onError">
			<cfargument name="Exception" required=true/>
			<cfargument name="EventName" type="String" required=true/>
		<cftry>
			<cflog type="Error"
				file="HMSError"
				text="Exception error --
				   	  Exception type: #error.type#
					  Template: #error.template#,
					  Remote Address: #error.remoteAddress#,
					  HTTP Reference: #error.HTTPReferer#
					  Diagnostics: #error.diagnostics#">

			<cfcatch>
			</cfcatch>
		</cftry>
	</cffunction>


</cfcomponent>



