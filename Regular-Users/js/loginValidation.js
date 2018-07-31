function onSubmitForm()
{
	var emailLogin=$("#usernameLogin").val();
	var passwordLogin=$("#passwordLogin").val();

	$.ajax({
		 url:"../cfc/User.cfc",
			 data: {
				 method : "checkLoginCreadentials",
				 email : emailLogin,
				 password : passwordLogin,
				 },
			 dataType: "json",
			 type:"POST",
				 success: function(data){
					 if(data==false){
					 $(".theErrorDivID").html("**Username or password is incorrect / You may be already logged in");
					 return false;
					 }
					 else
						 {
						 $(".theErrorDivID").html("");
						 window.open("../../Admin/adminHomePage.cfm","_self")
						 return true;
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

