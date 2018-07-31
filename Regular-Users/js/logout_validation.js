function Logout()
{
	$.ajax({
		 url:"NewCFComponent.cfc",
			 data: {
				 method : "logout",
				 },
			 dataType: "json",
			 async:true,
			 type:"POST",
				 success: function(data){

						 window.open('login.cfm','_self');
					 }
					 });
	return false;
}