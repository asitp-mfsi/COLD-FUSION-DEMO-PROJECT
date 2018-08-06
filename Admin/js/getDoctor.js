
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
    
    $("#editForm").hide();
    
} );
function getDoctors(id)
{
	console.log(id);
	$.ajax({
		 url:"../cfc/admin.cfc",
		 data: {
			 method : "getDoctorDetails",
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
					 	$("#specialization").val(data[5]);
					 	$("#joiningdate").val(data[6]);
					 	$("#mobile").val(data[7]);
					 	$("#mobilealternate").val(data[8]);
					 	$("#email").val(data[9]);
					 	$("#yearsOfExperience").val(data[11]);
					 	$("#line1").val(data[12]);
					 	$("#line2").val(data[13]);
					 	$("#city").val(data[14]);
					 	$("#state").val(data[15]);
					 	$("#country").val(data[16]);
					 	$("#zip").val(data[17]);
					 	$("#id").val(id);
					 	
					 }
				 },
			error: function(data){
				return false;
			}
	});
	

		
		
}

