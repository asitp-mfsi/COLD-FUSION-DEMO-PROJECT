
$(document).ready(function() {
    $('#dataTable').DataTable( {
    	dom: 'Bfrtip',
    	buttons: [
            {
                extend: 'pdfHtml5',
                orientation: 'landscape',
                pageSize: 'LEGAL'
            }
        ]
    } );
    
    $("#editForm").hide();
    
} );


function getPatient(id)
{
	$.ajax({
		 url:"../cfc/admin.cfc",
		 data: {
			 method : "getPatientDetails",
			 id : id
			 },
		 dataType: "json",
		 
		 type:"POST",
			 success: function(data){
				 console.log(data);
				 if(data==false){
					    return false;
				 }
				 else
					 {
					 	$("#showDataTable").hide();
					 	$("#editForm").show();
					 	
					 	$("#firstName").val(data[0]);
					 	$("#middleName").val(data[1]);
					 	$("#lastName").val(data[2]);
					 	$("#dob").val(data[3]);
					 	if (data[4] == "male") {
							$("#gender").val("male");
						} else {
							$("#gender").val("female");
						}
					 	$("#disease").val(data[5]);
					 	$("#admittedDate").val(data[6]);
					 	$("#mobile").val(data[7]);
					 	$("#mobilealternate").val(data[8]);
					 	$("#email").val(data[9]);
					 	$("#line1").val(data[10]);
					 	$("#line2").val(data[11]);
					 	$("#city").val(data[12]);
					 	$("#state").val(data[13]);
					 	$("#country").val(data[14]);
					 	$("#zip").val(data[15]);
					 	$("#id").val(id);
					 	
					 }
				 },
			error: function(data){
				return false;
			}
	});
	

		
		
}

