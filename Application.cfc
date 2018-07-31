<!---
  --- Application
  --- -----------
  ---
  --- author: mindfire
  --- date:   7/19/18
  --->
<cfcomponent accessors="true" output="false" persistent="true">

<cfset This.name="CFProject33">
<cfset This.sessionManagement="Yes">
<cfset This.clientmanagement="Yes" >
<cfset this.datasource="CFDataSource">

	<cffunction
	        name="OnApplicationStart"
	        returntype="boolean">
			<cfset application.dataManipulation = createObject(
			"component","Admin.cfc.admin")/>


	        <cfreturn true />
    </cffunction>

</cfcomponent>



