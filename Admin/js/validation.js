$(document).ready(function()
	{
			$.validator.addMethod("notEqualToZero",function(value,element)
			{
				return this.optional(element)
				||value!=="000000";
			},"It cannot contain only zeroes");

			$.validator.addMethod("sameDigit",function(value,element)
			{
				return this.optional(element)
				||!(/(\d)\1{9}/.test(value));
			},"Invalid Number");

			$.validator.addMethod("checkPassword",function(value,element)
			{
				return this.optional(element)
				||/^(?=.*\d)(?=.*[a-zA-Z])(?=.*\W).{8,}$/.test(value);
			},"It must contain a number , an alphabet and a special character .");

			$.validator.addMethod("checkadd",function(value,element)
			{
					return this.optional(element)
					||(/^([A-Za-z0-9])*([A-Za-z0-9\s\_\-\,\/\:\;])*$/.test(value));
			},"Invalid Address");

			$(".registration_form").validate({
				rules:{
						firstName:{
							required:true,
							pattern:"^[a-zA-Z]+$"
						},
						middleName:{
							required:false,
							pattern:"^[a-zA-Z]+$"
							},
						lastName:{
							required:true,
							pattern:"^[a-zA-Z]+$"
							},
						email:{
							required:true,
							email:true
							},
						dob:{
							required:true
						},
						gender:{
							required:true
						},
						disease:{
							required:true
						},
						admittedDate:{
							required:true
						},
						mobile:{
							required:true,
							pattern:"^\\d{10}$",
							sameDigit:true
						},
						mobilealternate:{
							pattern:"^\\d{10}$",
							sameDigit:true
						},
						line1:{
							required:true,
							checkadd:true
						},
						line2:{
							checkadd:true
						},
						city:{
							required:true,
							pattern:"^([a-zA-Z]+|[a-zA-Z]+\s[a-zA-Z]+)$"
						},
						state:{
							required:true,
							pattern:"^([a-zA-Z]+|[a-zA-Z]+\s[a-zA-Z]+)$"
						},
						country:{
							required:true,
							pattern:"^([a-zA-Z]+|[a-zA-Z]+\s[a-zA-Z]+)$"
						},
						zip:{
							required:true,
							pattern:"^\\d{6}",
							notEqualToZero:true
						}


				},
				messages:{
					firstName:{
							pattern:"This field is required and only letters are allowed . No white space ."
					},
					middleName:{
							pattern:"This field is required and only letters are allowed . No white space ."
					},
					lastName:{
							pattern:"This field is required and only letters are allowed . No white space ."
					},
					mobile:{
							pattern:"Enter a 10 digit phone number"
					},
					zip:{
							pattern:"Enter a 6 digit zip-code"
					},
					email:{
							email:"abc@domain.com"
					}


				}
			});
			if(!$(".registration_form").valid())
				$(".registration_form").addClass("error");
			else
				$(".registration_form").removeClass("error");


});
function dobvalidate(id)
{
   var dob=$("#"+id).val();
   var today=new Date();
   var day=Date.parse(dob);
   if(today<=day || isNaN(day)){

	$("#"+id).css({"borderColor":"red"});
	checkOnSubmit=false;

	}
	else
		$("#"+id).css({"borderColor":"white"});	

}



function check_Signup_Validation(toDo)
{
	var validator = $(".registration_form").valid();
	var selectedValues = [];
	var functionality = toDo;
	 $.each($("#associatedDoctor option:selected"), function(){            
		 selectedValues.push($(this).val());
     });
	 
	 	var email=$("#email").val();
		var firstName=$("#firstName").val();
		var middleName=$("#middleName").val();
		var lastName=$("#lastName").val();
		var gender=$("#gender option:selected").val();
		var dob=$("#dob").val();
		var disease=$("#disease").val();
		var admittedDate=$("#admittedDate").val();
		var mobile=$("#mobile").val();
		var mobileAlternate=$("#mobilealternate").val();
		var line1=$("#line1").val();
		var line2=$("#line2").val();
		var city=$("#city").val();
		var state=$("#state").val();
		var country=$("#country").val();
		var zip=$("#zip").val();
		var id=$("#id").val();
		var datarecord=false;
		if(validator==true && email!=""){
		 $.ajax({
			 url:"../cfc/admin.cfc",
				 data: {
					 method : "addPatient",
					 email : email,
					 firstName : firstName,
					 middleName : middleName,
					 lastName : lastName,
					 dob : dob,
					 disease : disease,
					 gender : gender,
					 admittedDate : admittedDate,
					 mobile : mobile,
					 mobileAlternate : mobileAlternate,
					 line1 : line1,
					 line2 : line2,
					 city : city,
					 state : state,
					 country : country,
					 zip : zip,
					 selectedValues : selectedValues.join(),
					 id : id,
					 functionality : functionality
				 },
				 dataType: "json",
				 type:"POST",
					 success: function(data){
						 datarecord=data;
						 if(data==false)
						 {
						 	$(".theErrorDivID").html("**Email ID already exists / contact admin ");
						 }
						 else
						 {
							 $(".theErrorDivID").html("");
							 window.open('../cfm/patients.cfm','_self');
						 }
					 },
					 error: function(data){
						 	$(".theErrorDivID").html("Error Occured");
					 }
		});
		 	return (validator===datarecord);
		}
		else
		{
			return false;
		}	
	
}

function checkDoctorsValidation(toDo)
{
	var validator = $(".registration_form").valid();
	var functionality = toDo;
	 
	 	var email=$("#email").val();
		var firstName=$("#firstName").val();
		var middleName=$("#middleName").val();
		var lastName=$("#lastName").val();
		var gender=$("#gender option:selected").val();
		var dob=$("#dob").val();
		var specialization=$("#specialization").val();
		var joiningdate=$("#joiningdate").val();
		var mobile=$("#mobile").val();
		var mobileAlternate=$("#mobilealternate").val();
		var password=$("#password").val();
		var yearsOfExperience=$("#yearsOfExperience").val();
		var line1=$("#line1").val();
		var line2=$("#line2").val();
		var city=$("#city").val();
		var state=$("#state").val();
		var country=$("#country").val();
		var zip=$("#zip").val();
		var id=$("#id").val();
		var datarecord=false;
		if(validator==true && email!=""){
		 $.ajax({
			 url:"../cfc/admin.cfc",
				 data: {
					 method : "checkValidity",
					 email : email,
					 firstName : firstName,
					 middleName : middleName,
					 lastName : lastName,
					 specialization : specialization,
					 joiningdate : joiningdate,
					 gender : gender,
					 dob : dob,
					 mobile : mobile,
					 password : password,
					 yearsOfExperience : yearsOfExperience,
					 mobileAlternate : mobileAlternate,
					 line1 : line1,
					 line2 : line2,
					 city : city,
					 state : state,
					 country : country,
					 zip : zip,
					 id : id,
					 functionality : functionality
				 },
				 dataType: "json",
				 type:"POST",
					 success: function(data){
						 datarecord=data;
						 if(data==false)
						 {
						 	$(".theErrorDivID").html("**Email ID already exists / contact admin ");
						 }
						 else
						 {
							 $(".theErrorDivID").html("");
							 window.open('../cfm/doctors.cfm','_self');
						 }
					 },
					 error: function(data){
						 	$(".theErrorDivID").html("Error Occured");
					 }
		});
		 	return (validator===datarecord);
		}
		else
		{
			return false;
		}	
	
}

