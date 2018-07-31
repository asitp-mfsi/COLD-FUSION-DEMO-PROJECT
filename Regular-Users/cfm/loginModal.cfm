	<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    <div class="loginForm">

	      <form action="../../Admin/adminHomePage.cfm" onsubmit="return onSubmitForm()" method="post">

			  <div class="form-group">
				  <div class="form-icon">
				  		 <img src="../images/username.png" id="form-icon-id">
		        		<label for="user">USER</label>
		        	</div>
		        			<select class="form-control" name="users" id="users">

		  						<option value="admin">Admin</option>
		 						<option value="doctor" >Doctor</option>
							</select>
		      </div>
		      <div class="form-group">
			      <div class="form-icon">

				      <img src="../images/username.png" id="form-icon-id">
				      <label for="username"> Username</label>
				  </div>
				        <input class="form-control" type="text" name="username" id="usernameLogin" placeholder="james@bond1" required />
			  </div>
			  <div class="theErrorDivID"></div>

			  <div class="form-group">
				     <div class="form-icon">
					      <img src="../images/password.png" id="form-icon-id">
					       <label for="password">Password</label>
					 </div>
					        <input class="form-control" type="password" name="password" id="passwordLogin" placeholder="********" required />
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