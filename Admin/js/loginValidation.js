

function onSubmitForm()
{
	var emailLogin=$("#usernameLogin").val();
	var passwordLogin=$("#passwordLogin").val();

	$.ajax({
		 url:"../cfc/NewCFComponent.cfc",
			 data: {
				 method : "checkLoginCreadentials",
				 email : emailLogin,
				 password : passwordLogin,
				 },
			 dataType: "json",
			 async:true,
			 type:"POST",
				 success: function(data){
					 if(data==false){
					 $(".theErrorDivID").html("**Username or password is incorrect / You may be already logged in");
					 return true;
					 }
					 else
						 {
						 $(".theErrorDivID").html("");
						 window.open('../index.cfm','_self');
						 }
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
