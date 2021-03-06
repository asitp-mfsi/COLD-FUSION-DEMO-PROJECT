$(document).ready(function()
		{

			$.validator.addMethod("notEqualToZero",function(value,element)
			{
				return this.optional(element)
				||value!=="000000";
			},"It cannot contain only zeroes");

			$.validator.addMethod("sameDigit",function(value,element)
			{
				return this.optional(element)
				||!(/(\d)\1{9}/.test(value));
			},"Invalid Number");

			$.validator.addMethod("checkPassword",function(value,element)
			{
				return this.optional(element)
				||/^(?=.*\d)(?=.*[a-zA-Z])(?=.*\W).{8,}$/.test(value);
			},"It must contain a number , an alphabet and a special character .");

			$.validator.addMethod("checkadd",function(value,element)
			{
					return this.optional(element)
					||(/^([A-Za-z0-9])*([A-Za-z0-9\s\_\-\,\/\:\;])*$/.test(value));
			},"Invalid Address");

			$(".registration_form").validate({
				rules:{
					firstName:{
						required:true,
						pattern:"^[a-zA-Z]+$"
						},
						middleName:{
							required:false,
							pattern:"^[a-zA-Z]+$"
							},
						lastName:{
							required:true,
							pattern:"^[a-zA-Z]+$"
							},
						email:{
							required:true,
							email:true
							},
						password:{
							required:true,
							checkPassword:true
							},
						passwordRepeat:{
							required:true,
							equalTo:"#password"
						},
						mobile:{
							required:true,
							pattern:"^\\d{10}$",
							sameDigit:true
						},
						mobilealternate:{
							pattern:"^\\d{10}$",
							sameDigit:true
						},
						line1:{
							required:true,
							checkadd:true
						},
						line2:{
							checkadd:true
						},
						city:{
							required:true,
							pattern:"^([a-zA-Z]+|[a-zA-Z]+\s[a-zA-Z]+)$"
						},
						state:{
							required:true,
							pattern:"^([a-zA-Z]+|[a-zA-Z]+\s[a-zA-Z]+)$"
						},
						country:{
							required:true,
							pattern:"^([a-zA-Z]+|[a-zA-Z]+\s[a-zA-Z]+)$"
						},
						zip:{
							required:true,
							pattern:"^\\d{6}",
							notEqualToZero:true
						}


				},
				messages:{
					firstName:{
							pattern:"This field is required and only letters are allowed . No white space ."
					},
					middleName:{
							pattern:"This field is required and only letters are allowed . No white space ."
					},
					lastName:{
							pattern:"This field is required and only letters are allowed . No white space ."
					},
					mobile:{
							pattern:"Enter a 10 digit phone number"
					},
					zip:{
							pattern:"Enter a 6 digit zip-code"
					},
					email:{
							email:"abc@domain.com"
					}


				}
			});
			if(!$(".registration_form").valid())
				$(".registration_form").addClass("error");
			else
				$(".registration_form").removeClass("error");
		});

function convertPassword(id)
{
    var pass = $("#"+id);
    if (pass.is(":password"))
	{
        pass.attr("type","text");
    }
    else
	{
        pass.attr("type","password");
    }
}

function check_Signup_Validation()
{
	var validator = $(".registration_form").valid();
	var email=$("#email").val();
	var firstName=$("#firstName").val();
	var middleName=$("#middleName").val();
	var lastName=$("#lastName").val();
	var registerPassword=$("#password").val();
	var mobile=$("#mobile").val();
	var mobileAlternate=$("#mobilealternate").val();
	var line1=$("#line1").val();
	var line2=$("#line2").val();
	var city=$("#city").val();
	var state=$("#state").val();
	var country=$("#country").val();
	var zip=$("#zip").val();
	var datarecord=false;
	if(validator==true && email!=""){
	 $.ajax({
		 url:"../cfc/User.cfc",
			 data: {
				 method : "checkValidity",
				 email : email,
				 firstName : firstName,
				 lastName : lastName,
				 password : registerPassword,
				 mobile : mobile,
				 middleName : middleName,
				 mobileAlternate : mobileAlternate,
				 line1 : line1,
				 line2 : line2,
				 city : city,
				 state : state,
				 country : country,
				 zip : zip
			 },
			 dataType: "json",
			 type:"POST",
				 success: function(data){
					 datarecord=data;
					 if(data==false)
					 {
					 	$(".theErrorDivID").html("**Email ID already exists / contact admin ");
					 }
					 else
					 {
						 $(".theErrorDivID").html("");
						 window.open('../cfm/index.cfm','_self');
					 }
				 },
				 error: function(data){
					 	$(".theErrorDivID").html("Error Occured");
				 }
	});
	return (validator===datarecord);
	}
	else
	{
	  return false;
	}

}
