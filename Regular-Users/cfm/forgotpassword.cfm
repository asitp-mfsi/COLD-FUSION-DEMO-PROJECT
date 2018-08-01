

 <div class="modal fade" id="forgotPasswordModal" role="dialog">
    <div class="modal-dialog">
    <div class="loginForm">

	      <form action=""  method="post">

			  <div class="form-group">
				  <div class="form-icon">
				  		 <img src="../images/user.jpg" id="form-icon-id">
		        		<label for="fusers">USER</label>
		        	</div>
		        			<select class="form-control" name="fusers" id="fusers">
		 						<option value="doctor" >Doctor</option>
							</select>
		      </div>
		      <div class="form-group">
			      <div class="form-icon">

				      <img src="../images/username.png" id="form-icon-id">
				      <label for="fusername"> Username</label>
				  </div>
				        <input class="form-control" type="text" name="fusername" id="fusername" placeholder="" value="" required />
			  </div>
			  <div class="theErrorDivID"></div>
			  <div class="errorMessage"></div>

			  <div id="loginbutton">
					 <input class="btn btn--form loginFormButton" type="button"   value="SEND VERIFICATION LINK" onclick="forgotPassword()" />
			  </div>


		       </div>


	      </form>
      </div>
    </div>
  </div>


