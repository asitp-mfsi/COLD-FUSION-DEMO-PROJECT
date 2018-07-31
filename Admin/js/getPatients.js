
$(document).ready(function()
		{
	
					$('#dataTable').DataTable();

					$(".clickToEdit").click(function() {
									var tableData = $(this).children("td").map(function() {
								        return $(this).text();
								    }).get();
									console.log(tableData[0]);
									var idD=tableData[0];
									 $.ajax({
										 url:"../cfc/admin.cfc",
											 data: {
												 method : "getPatientDetails",
												 id : idD
											 },
											 dataType: "json",
											 type:"POST",
												 success: function(response){
													 console.log(response);
													 datarecord=response;
													 if(data==false)
													 {
													 	
													 }
													 else
													 {
														 console.log(response);
													 }
												 },
												 error: function(data){
													 	$(".theErrorDivID").html("Error Occured");
												 }
									});
									//window.location = $(this).data("href");
								});
		});