function Logout()
{
	$.ajax({
		 url:"../Components/cfc/error.cfc",
			 data: {
				 method : "logout",
				 },
			 dataType: "json",
			 async:true,
			 type:"POST",
				 success: function(data){

						 window.open('../Regular-Users/cfm/index.cfm','_self');
					 },
				 error: function(data){
					 	return false;
				 }
					 });
	return false;
}


function statusChange(id)
{
   	$.ajax({
		 url:"cfc/doctor.cfc",
		 data: {
			 method : "changeStatus",
			 id : id
			 },
		 type:"POST",
		 success: function(data){
				 location.reload();
			 },
		error: function(data){
			return false;
		}
	});
}