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








</cfcomponent>
