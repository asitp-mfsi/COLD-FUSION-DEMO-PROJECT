function Logout()
{
	$.ajax({
		 url:"cfc/admin.cfc",
			 data: {
				 method : "logout",
				 },
			 dataType: "json",
			 async:true,
			 type:"POST",
				 success: function(data){

						 window.open('../Regular-Users/cfm/index.cfm','_self');
					 }
					 });
	return false;
}