$(document).ready(function() {
    $('#dataTable').DataTable( {
    	dom: 'Bfrtip',
    	buttons: [
            {
                extend: 'pdfHtml5',
                orientation: 'landscape',
                pageSize: 'LEGAL'
            }
        ],
    	columnDefs: [
        { type: 'date-dd-mmm-yyyy', targets: 0 }
      ]
    } );
    
    
} );

function statusChange(id)
{
	console.log(id);
   	$.ajax({
   		url:"../../Components/cfc/error.cfc",
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