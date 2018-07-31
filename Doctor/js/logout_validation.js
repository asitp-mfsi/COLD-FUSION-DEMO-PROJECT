function Logout()
{
	$.ajax({
		 url:"cfc/NewCFComponent.cfc",
			 data: {
				 method : "logout",
				 },
			 dataType: "json",
			 async:true,
			 type:"POST",
				 success: function(data){

						 window.open('../Regular-Users/index.cfm','_self');
					 }
					 });
	return false;
}