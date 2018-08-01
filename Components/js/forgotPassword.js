
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
				username:{
					required:true,
					email:true
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
	
	if($(".registration_form").valid()){
	
	var username = $("#username").val();
	var password = $("#password").val();
   	$.ajax({
   		url:"../cfc/error.cfc",
		 data: {
			 method : "resetPassword",
			 username : username,
			 password : password
			 },
		 datatype:"JSON",
		 type:"POST",
		 success: function(data){
			 	 if(data){
					 alert("Password Changed successfully");
					 $(".invalidAccess").html("");
					 $(".homePage").html("<a href='http://localhost:82/Regular-Users/cfm/index.cfm'>Home Page</a>");
					 return true;
			 	 }
			 	 else
			 		 {
			 		 	$(".invalidAccess").html("Invalid Access");
			 		 	return false;
			 		 }
			 },
		error: function(data){
			
			return false;
		}
	});
	}
}