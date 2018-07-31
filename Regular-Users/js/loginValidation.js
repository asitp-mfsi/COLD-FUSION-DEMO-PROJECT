


$(document).ready(function() {
	$("#myModal").trigger("reset");
});




function onSubmitForm()
{
	var emailLogin=$("#usernameLogin").val();
	var passwordLogin=$("#passwordLogin").val();
	var user=$("#users :selected").val();
	
	console.log(user=="admin");

	$.ajax({
		 url:"../cfc/User.cfc",
			 data: {
				 method : "checkLoginCreadentials",
				 email : emailLogin,
				 password : passwordLogin,
				 user : user,
				 },
			 dataType: "json",
			 type:"POST",
				 success: function(data){
					 if(data==false){
					 $(".theErrorDivID").html("**Username or password is incorrect / You may be already logged in");
					 return false;
					 }
					 else if(user == "admin")
						 {
						 $(".theErrorDivID").html("");
						 window.open("../../Admin/adminHomePage.cfm","_self")
						 }
					 else
						 {
						 $(".theErrorDivID").html("");
						 window.open("../../Doctor/doctorHomePage.cfm","_self")
						 }
					 },
					 error:function(data){
					 	$(".theErrorDivID").html("Error Occured");
					 	return false;
					 }
					 });
	return false;
}
function convertPassword(id)
{
    var pass = $("#"+id);
    if (pass.is(":password")){
        pass.attr("type","text");
   }
   else{
        pass.attr("type","password");
   }
}

