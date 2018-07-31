

<cfquery name="getAssociatedDocor">
		select Patient.patients.PatientID , concat( Doctor.doctorInformation.firstName
							, ' ',Doctor.doctorInformation.middleName,' ',Doctor.doctorInformation.lastName)
							as DoctorName from Patient.patients left join Patient.associatedDoctor on Patient.patients.PatientID=Patient.associatedDoctor.PatientID
							left join Doctor.doctorInformation on Patient.associatedDoctor.doctorID = Doctor.doctorInformation.doctorID
</cfquery>

<cfset faq = ArrayNew(1)>


<cfset prev=0>
<cfset count=1>
<sfset name>
<cfoutput query="getAssociatedDocor">


	<cfset next=#patientID#>
	<cfif prev NEQ next>
		<cfset faq[count]= #patientID# >
		<cfset prev = next>
		<cfset arrayappend(faq , #DoctorName# , "true")>
		<cfset count=count+1>

		<cfelse>
		<cfset arrayappend(faq , #DoctorName# , "true" )>

	</cfif>
 </cfoutput>

<cfdump var="#faq#">
