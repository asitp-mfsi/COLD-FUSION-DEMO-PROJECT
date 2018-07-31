	<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    <div class="loginForm">

	      <form action="../../Doctor/doctorHomePage.cfm" onsubmit="return onSubmitForm()" method="post">

			  <div class="form-group">
				  <div class="form-icon">
				  		 <img src="../images/user.jpg" id="form-icon-id">
		        		<label for="user">USER</label>
		        	</div>
		        			<select class="form-control" name="users" id="users">

		  						<option value="admin">Admin</option>
		 						<option value="doctor" >Doctor</option>
							</select>
		      </div>
		       <div class="form-group">
				     <div class="form-icon">
					      <img src="../images/password.png" id="form-icon-id">
					       <label for="password">Password</label>
					 </div>
					        <input class="form-control" type="password" name="password" id="oldPasswordLogin" value="" placeholder="********" required />
			  </div>
			  <div class="theErrorDivID"></div>

			  <div class="form-group">
				     <div class="form-icon">
					      <img src="../images/password.png" id="form-icon-id">
					       <label for="password">Password</label>
					 </div>
					        <input class="form-control" type="password" name="password" id="newPasswordLogin" value="" placeholder="********" required />
			  </div>
			  <div id="loginbutton">
					 <input class="btn btn--form loginFormButton" type="submit"   value="Login" />
			  </div>

		       </div>
	      </form>
      </div>
    </div>
  </div>

	<script src="../js/loginValidation.js"></script>