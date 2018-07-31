
$(document).ready(function()
	{
	console.log("hey");
		$.validator.addMethod("checkPassword",function(value,element)
				{
					return this.optional(element)
					||/^(?=.*\d)(?=.*[a-zA-Z])(?=.*\W).{8,}$/.test(value);
				},"It must contain a number , an alphabet and a special character .");
		
		$(".registration_form").validate({
			rules:{
				oldPasswordLogin:{
					required:true
				},
				password:{
					required:true,
					checkPassword:true
					},
				passwordRepeat:{
					required:true,
					equalTo:"#password"
				}
			}
		});
		if(!$(".registration_form").valid())
			$(".registration_form").addClass("error");
		else
			$(".registration_form").removeClass("error");
	});




function passwordChange()
{
	
	var password = $("#oldPasswordLogin").val();
	var newpassword = $("#password").val();
	var id=$("#idDoctor").val();
	console.log(password);
   	$.ajax({
   		url:"../cfc/doctor.cfc",
		 data: {
			 method : "changePassword",
			 oldPassword : password,
			 newPassword : newpassword,
			 id : id
			 },
		 datatype:"JSON",
		 type:"POST",
		 success: function(data){
			 	 if(data==true){
				 alert("Password Changed successfully");
				 window.open("../doctorHomePage.cfm","_self");
				 return true;
			 	 }
			 	 else
			 		 {
			 		 	$(".theErrorDivID").html("Password Incorrect");
			 		 	return false;
			 		 }
			 },
		error: function(data){
			
			return false;
		}
	});
}