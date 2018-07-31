<!---
	--- NewCFComponent
	--- --------------
	---
	--- author: mindfire
	--- date:   7/18/18
	--->
<cfcomponent accessors="true" output="false" persistent="false">


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
			<cfset local.returnValue = false>
			<cfset local.passkey = application.dataManipulation.returnHashPassword('#arguments.password#','SHA1')>

			<cfquery name="emailQuery">
	    		SELECT [email] FROM [userInformation] ;
			</cfquery>

			<cfif #emailQuery.recordCount# LT 1 >

				<cfset addressID = application.dataManipulation.storeAddress('#arguments.country#',
																			 '#arguments.line1#',
																			 '#arguments.line2#',
																			 '#arguments.city#',
																			 '#arguments.state#',
																			 '#arguments.zip#',
																			 '0')>

				<cfset addID = numberFormat(#addressID#)>


					<cfquery name="myQueryInformation" >
		   				 INSERT INTO [userInformation]
		   				 						   ([firstName]
										           ,[middleName]
										           ,[lastName]
										           ,[email]
										           ,[password]
										           ,[phoneNumber]
										           ,[phoneNumberAlternate]
										           ,[addressID])
										            VALUES(
										            <cfqueryparam value = '#arguments.firstName#' CFSQLType = 'CF_SQL_VARCHAR'>,
   				 									<cfqueryparam value = '#arguments.middleName#' CFSQLType = 'CF_SQL_VARCHAR' null="#not len(arguments.middleName)#">,
   				 									<cfqueryparam value = '#arguments.lastName#' CFSQLType = 'CF_SQL_VARCHAR'>,
   				 									<cfqueryparam value = '#arguments.email#' CFSQLType = 'CF_SQL_VARCHAR'>,
   				 									<cfqueryparam value = '#local.passkey#' CFSQLType = 'CF_SQL_VARCHAR'>,
   				 									<cfqueryparam value = '#arguments.mobile#' CFSQLType = 'CF_SQL_VARCHAR'>,
   				 									<cfqueryparam value = '#arguments.mobileAlternate#' CFSQLType = 'CF_SQL_VARCHAR' null="#not len(arguments.mobileAlternate)#">,
   				 									<cfqueryparam value = '#addID#' CFSQLType = 'CF_SQL_INTEGER'>
													);
					</cfquery>

				<cfset local.returnValue = true />

			<cfelse>

				<cfset local.returnValue = false/>

			</cfif>
				<cfreturn #local.returnValue# />
			<cfcatch>
				<cfset logerror=application.errorHMS.logError('#cfcatch.Type#','"#cfcatch.cause.message#"')>
			</cfcatch>



		</cftry>


	</cffunction>


	<!--- Check Login Credentials and Log in the user if credentials are valid --->

	<cffunction name = "checkLoginCreadentials" output = "false" access = "remote" returnType="string" returnFormat="json">

		<cfargument name="email" type="string" required="true" >
		<cfargument name="password" type="string" required="true" >
		<cfargument name="user" type="string" required="true" >
		<cftry>
			<cfset local.returnValue = false/>
			<cfset local.passkey = application.dataManipulation.returnHashPassword('#arguments.password#','SHA1')>
			<cfset isValidUser = false>
			<cfif arguments.user EQ 'admin'>

				<cfquery name="emailQuery" >

		   			 SELECT [email] ,
		   			 		[password]
		   			 		FROM
		   			 		[userInformation]
		   			 	    WHERE
		   			 		[email] = <cfqueryparam value = '#arguments.email#' CFSQLType = 'CF_SQL_VARCHAR'>
		   			 		AND
							[password] = <cfqueryparam value = '#local.passkey#' CFSQLType = 'CF_SQL_VARCHAR'>;
				</cfquery>
				<cfif emailQuery.recordCount EQ 1>
					<cfset isValidUser = true>
				</cfif>

			<cfelse>


				<cfquery name="emailQueryDoctor" >

		   			 SELECT [emailID] ,
		   			 		[password]
		   			 		FROM
		   			 		[Doctor].[doctorInformation]
		   			 		WHERE
		   			 		[emailID] = <cfqueryparam value = '#arguments.email#' CFSQLType = 'CF_SQL_VARCHAR'>
		   			 		AND
							[password] = <cfqueryparam value = '#local.passkey#' CFSQLType = 'CF_SQL_VARCHAR'>;
				</cfquery>
				<cfif emailQueryDoctor.recordCount EQ 1>
					<cfset isValidUser = true>
				</cfif>


			</cfif>

			<cfif  #isValidUser# EQ true >

					<cflock timeout=20 scope="Session" type="Readonly">

						<cfset local.idSession = #Session.sessionid#>

					</cflock>

						<cfquery name="loginQuery" >

	  							 SELECT [username]
	  							 FROM
	  							 [login]
	  							 WHERE
				  				 [username] =<cfqueryparam value = '#arguments.email#' CFSQLType = 'CF_SQL_VARCHAR'>;
						</cfquery>
						<cfif #loginQuery.recordCount# EQ 0 >


										<cfquery >
  				 							INSERT INTO
											[login]
											([username]
           									,[sessionid])
											VALUES
													(
													 <cfqueryparam value = '#arguments.email#' CFSQLType = 'CF_SQL_VARCHAR'>,
													 <cfqueryparam value = '#local.idSession#' CFSQLType = 'CF_SQL_VARCHAR'>
													 );
										</cfquery>
										<cflogin>
										<cfloginuser name = "#arguments.email#"
													 password = "#local.passkey#"
													 roles =  "#arguments.user#">
										</cflogin>



							<cfset local.returnValue = true />
						<cfelse>
										<cflogout/>
										<cfquery >
  				 							UPDATE [login] SET
												   [sessionid] = <cfqueryparam value = '#local.idSession#' CFSQLType = 'CF_SQL_VARCHAR'>
														WHERE username = <cfqueryparam value = '#arguments.email#' CFSQLType = 'CF_SQL_VARCHAR'>;
										</cfquery>
										<cflogin>
										<cfloginuser name = "#arguments.email#"
													 password = "#local.passkey#"
													 roles =  "#arguments.user#">
										</cflogin>

							<cfset local.returnValue = true />
						</cfif>
						<cfelse>
							<cfset local.returnValue = false/>
					</cfif>
					<cfreturn #local.returnValue# />
				<cfcatch>

					<cfset logerror=application.errorHMS.logError('#cfcatch.Type#','"#cfcatch.cause.message#"')>

				</cfcatch>


		</cftry>
	</cffunction>


</cfcomponent>
