function Logout()
{
	console.log("user access");
	$.ajax({
		 url:"../../Components/cfc/error.cfc",
			 data: {
				 method : "logout",
				 },
			 dataType: "json",
			 async:true,
			 type:"POST",
				 success: function(data){

						 window.open('../cfm/index.cfm','_self');
					 }
					 });
	return false;
}