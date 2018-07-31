$(document).ready(function() {
    $('#dataTable').DataTable();
    
} );

function statusChange(id)
{
   	$.ajax({
   		url:"../Components/cfc/error.cfc",
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