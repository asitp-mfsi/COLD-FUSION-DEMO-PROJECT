function Logout()
{
	$.ajax({
		 url:"../Components/cfc/error.cfc",
			 data: {
				 method : "logout",
				 },
			 dataType: "json",
			 type:"POST",
				 success: function(data){

						 window.open('../Regular-Users/cfm/index.cfm','_self');
					 },
					 error: function(data){
						 alert("LOGOUT Failed");
					 }
					 });
	return false;
}