function forgotPassword()
{
	var username=$("#fusername").val();
	$.ajax({
		 url:"../cfc/User.cfc",
			 data: {
				 method : "sendLink",
				 username : username
				 },
			 async:true,
			 type:"POST",
				 success: function(data){
					 console.log(data);
					 	if(data=="true"){
					 		console.log("suc");
					 		$(".errorMessage").html("Recovery mail has been sent.");
					 		$(".theErrorDivID").html("");
					 	}
					 	else{
					 		$(".errorMessage").html("");
					 		$(".theErrorDivID").html("Incorrect Username");
					 	}
					 		
					 },
				 error: function(data){
					 	return false;
				 }
					 });
}