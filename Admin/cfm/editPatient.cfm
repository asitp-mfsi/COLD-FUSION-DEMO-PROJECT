

  <!--- Form to add new Patient --->
  <div class="container__child signup__form">
    <form action="" class="registration_form" method="post" onsubmit="return check_Signup_Validation('update')">
		<div class="float-left-first-8">
				<div class="form-group">
		        <label for="firstName">First Name</label>
		        <input class="form-control" type="text" name="firstName" id="firstName" placeholder="" required />
		      </div>
			  <div class="form-group">
		        <label for="middleName">Middle Name</label>
		        <input class="form-control" type="text" name="middleName" id="middleName" placeholder=""  />
		      </div>
			  <div class="form-group">
		        <label for="lastName">Last Name</label>
		        <input class="form-control" type="text" name="lastName" id="lastName" placeholder="" required />
		      </div>
				<div class="form-group">
		        <label for="dob">DOB</label>
		        <input class="form-control" type="date" name="dob" id="dob" required />
		      </div>
				<div class="form-group">
		        <label for="gender">Gender</label>
				<br>
		        <select class="form-control" name="gender" id="gender">
		  			<option value="male">Male</option>
		 			 <option value="female" >Female</option>
		  			<option value="other">Other</option>
				</select>
		      </div>
			  <div class="form-group">
		        <label for="disease">Disease</label>
		        <input class="form-control" type="text" name="disease" id="disease" placeholder="" required />
		      </div>
				<div class="form-group">
		        <label for="admittedDate">Admitted Date</label>
		        <input class="form-control" type="date" name="admittedDate" id="admittedDate" required />
		      </div>


			  <div class="form-group">
		        <label for="mobile">Phone Number</label>
		        <input class="form-control" type="text" name="mobile" id="mobile" placeholder="" required />
		      </div>
		</div>
	<div class="float-right-second-8">
			<div class="form-group">
		        <label for="mobilealternate">Phone Number(Alternate)</label>
		        <input class="form-control" type="text" name="mobilealternate" id="mobilealternate" placeholder=""  />
		      </div>
		      <div class="form-group">
		        <label for="email">Email</label>
		        <input class="form-control" type="text" name="email" id="email" placeholder=""  required />
		      </div>

			 <div class="form-group">
		        <label for="line1">Address Line 1</label>
		        <input class="form-control" type="text" name="line1" id="line1" placeholder="" required />
		      </div>
				<div class="form-group">
		        <label for="line2">Address Line 2</label>
		        <input class="form-control" type="text" name="line2" id="line2" placeholder=""  />
		      </div>
			  <div class="form-group">
		        <label for="city">City</label>
		        <input class="form-control" type="text" name="city" id="city" placeholder="" required />
		      </div>
			  <div class="form-group">
		        <label for="state">State</label>
		        <input class="form-control" type="text" name="state" id="state" placeholder="" required />
		      </div>
			  <div class="form-group">
		        <label for="country">Country</label>
		        <input class="form-control" type="text" name="country" id="country" placeholder="" required />
		      </div>
			 <div class="form-group">
		        <label for="zip">Zip-Code</label>
		        <input class="form-control" type="text" name="zip" id="zip" placeholder="" required />
		      </div>
		      <div class="form-group">
		        <input class="form-control" type="hidden" name="id" id="id" placeholder="" required />
		      </div>

	</div>
	<br>
	<br>
	<br>
	<br>
	<!--- get doctor name in option list --->




       <div id="signupbutton">
            <input class="btn btn--form SignupFormButton" type="submit" value="Register" />
			<div class="theErrorDivID"></div>
		</div>


    </form>

  </div>



