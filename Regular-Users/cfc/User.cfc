<!---
	--- NewCFComponent
	--- --------------
	---
	--- author: mindfire
	--- date:   7/18/18
	--->
<cfcomponent accessors="true" output="true" persistent="false">


	<!--- Check validity of email and sign up the user --->
	<cffunction name = "checkValidity" output = "false" access = "remote" returnType="string" returnFormat="json">

			<cfargument name="email" type="string" required="true" >
			<cfargument name="firstName" type="string" required="true" >
			<cfargument name="middleName" type="string" required="false" >
			<cfargument name="lastName" type="string" required="true" >
			<cfargument name="password" type="string" required="true" >
			<cfargument name="mobile" type="string" required="true" >
			<cfargument name="mobileAlternate" type="string" required="false" >
			<cfargument name="country" type="string" required="true" >
			<cfargument name="line1" type="string" required="true">
			<cfargument name="line2" type="string" required="false">
			<cfargument name="city" type="string" required="true">
			<cfargument name="state" type="string" required="true">
			<cfargument name="zip" type="string" required="true">


		<cftry>

			<cfquery name="emailQuery">
	    		select * from userInformation ;
			</cfquery>

			<cfif #emailQuery.recordCount# LT 1 >

				<cfquery name="myQueryAddress" result="addressID" >
	   				 insert into [address] values(<cfqueryPARAM value = '#arguments.line1#' CFSQLType = 'CF_SQL_VARCHAR'>,
												  <cfqueryPARAM value = '#arguments.line2#' CFSQLType = 'CF_SQL_VARCHAR'>,
												  <cfqueryPARAM value = '#arguments.city#' CFSQLType = 'CF_SQL_VARCHAR'>,
												  <cfqueryPARAM value = '#arguments.state#' CFSQLType = 'CF_SQL_VARCHAR'>,
												  <cfqueryPARAM value = '#arguments.country#' CFSQLType = 'CF_SQL_VARCHAR'>,
												  <cfqueryPARAM value = '#arguments.zip#' CFSQLType = 'CF_SQL_VARCHAR'>);
				</cfquery>

				<cfset addID = numberFormat(#addressID.identitycol#)>


					<cfquery name="myQueryInformation" >
		   				 insert into userInformation values(<cfqueryPARAM value = '#arguments.firstName#' CFSQLType = 'CF_SQL_VARCHAR'>,
		   				 									<cfqueryPARAM value = '#arguments.middleName#' CFSQLType = 'CF_SQL_VARCHAR'>,
		   				 									<cfqueryPARAM value = '#arguments.lastName#' CFSQLType = 'CF_SQL_VARCHAR'>,
		   				 									<cfqueryPARAM value = '#arguments.email#' CFSQLType = 'CF_SQL_VARCHAR'>,
		   				 									<cfqueryPARAM value = '#arguments.password#' CFSQLType = 'CF_SQL_VARCHAR'>,
		   				 									<cfqueryPARAM value = '#arguments.mobile#' CFSQLType = 'CF_SQL_VARCHAR'>,
		   				 									<cfqueryPARAM value = '#arguments.mobileAlternate#' CFSQLType = 'CF_SQL_VARCHAR'>,
		   				 									<cfqueryPARAM value = '#addID#' CFSQLType = 'CF_SQL_INTEGER'>);
					</cfquery>

				<cfreturn true/>

			<cfelse>

				<cfreturn false/>

			</cfif>

			<cfcatch>
				<p>Database Error</p>
			</cfcatch>

		</cftry>


	</cffunction>


	<!--- Check Login Credentials and Log in the user if credentials are valid --->
	<cffunction name = "checkLoginCreadentials" output = "false" access = "remote" returnType="boolean" returnFormat="json">
		<cfargument name="email" type="string" required="true" >
		<cfargument name="password" type="string" required="true" >
		<cftry>
			<cfquery name="emailQuery" >
	   			 select * from userInformation where
	   			 		email=<cfqueryPARAM value = '#arguments.email#'
						CFSQLType = 'CF_SQL_VARCHAR'>  and
						password=<cfqueryPARAM value = '#arguments.password#'
						CFSQLType = 'CF_SQL_VARCHAR'>;
			</cfquery>
			<cfif #emailQuery.recordCount# EQ 1 >
					 <cfquery name="loginQuery" >
  							 select * from login where username=<cfqueryPARAM value = '#arguments.email#'
														CFSQLType = 'CF_SQL_VARCHAR'>;
					</cfquery>
					<cfif #loginQuery.recordCount# EQ 0 >
									<cflock timeout=20 scope="Session" type="Readonly">
										<cfquery >
  				 							insert into login values (<cfqueryPARAM value = '#arguments.email#'
														CFSQLType = 'CF_SQL_VARCHAR'>,
														<cfqueryPARAM value = '#Session.sessionid#'
														CFSQLType = 'CF_SQL_VARCHAR'>);
										</cfquery>
										<cflogin>
										<cfloginuser name = "#arguments.email#"
													 password = "#arguments.password#"
													 roles =  "user">
										</cflogin>

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
				<cfcatch>
					<p>DATABASE ERROR</p>
				</cfcatch>
			</cftry>
	</cffunction>


	<!--- Logout the User and delete the record from login table --->
	<cffunction name="logout" output="false" access="remote" returnType="boolean" returnFormat="json">

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
				<p>DATABASE ERROR</p>
			</cfcatch>

		</cftry>


	</cffunction>


</cfcomponent>
