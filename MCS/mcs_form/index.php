<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap Multi Step Registration Form Template</title>
        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/css/form-elements.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
    </head>
    <body>
		<!-- Top menu -->
		<nav class="navbar navbar-inverse navbar-no-bg" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#top-navbar-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
			</div>
		</nav>

        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	
                        	<form role="form" action="student_insert.php" method="post" class="registration-form">
                        		
                        		<fieldset>
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>Step 1 / 3</h3>
		                            		<p>Tell us who you are:</p>
		                        		</div>
		                        		<div class="form-top-right">
		                        			<i class="fa fa-user"></i>
		                        		</div>
		                            </div>
		                            <div class="form-bottom">
				                    	<div class="form-group">
				                    		<label class="sr-only" for="form-first-name">First Name</label>
				                        	<input type="text" name="firstname" placeholder="First Name..." class="form-first-name form-control" id="form-first-name">
				                        </div>
							<div class="form-group">
				                    		<label class="sr-only" for="form-first-name">Last Name</label>
				                        	<input type="text" name="lastname" placeholder="Last Name..." class="form-first-name form-control" id="form-first-name">
				                        </div>
<div class="form-group">
				                    		<label class="sr-only" for="form-first-name">DOB</label>
				                        	<input type="date" name="dob" placeholder="DOB" class="form-first-name form-control" id="form-first-name">
				                        </div>
							<div class="form-group">
				                    		<label class="sr-only" for="form-first-name">Mobile Number</label>
				                        	<input type="text" name="mobile_no" placeholder="Mobile Number..." class="form-first-name form-control" id="form-first-name">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-last-name">Hometown</label>
				                        	<input type="text" name="hometown" placeholder="Hometown..." class="form-last-name form-control" id="form-last-name">
				                        </div>
							<div class="form-group">
				                        	<label class="sr-only" for="form-last-name">Pincode</label>
				                        	<input type="text" name="pincode" placeholder="Pincode..." class="form-last-name form-control" id="form-last-name">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-about-yourself">Address</label>
				                        	<textarea name="address" placeholder="Address..." 
				                        				class="form-about-yourself form-control" id="form-about-yourself"></textarea>
				                        </div>
							<div class="form-group">
				                        	<label class="sr-only" for="form-last-name">Blood Group</label>
<select name="blood_group" class="form-last-name form-control" id="blood_group" onchange="changeFunc();">
<option class="form-control" id="Blood Group" disabled selected hidden>Blood Group...</option>
<option class="form-control" id="A+">A+</option>
<option class="form-control" id="A-">A-</option>
<option class="form-control" id="B+">B+</option>
<option class="form-control" id="B-">B-</option>
<option class="form-control" id="O+">O+</option>
<option class="form-control" id="O-">O-</option>
<option class="form-control" id="AB+">AB+</option>
<option class="form-control" id="AB-">AB-</option>
</select>

				                        </div>
							<div class="form-group">
				                        	<label class="sr-only" for="form-about-yourself">Hobby</label>
				                        	<textarea name="hobby" placeholder="Hobby..." 
				                        				class="form-about-yourself form-control" id="form-about-yourself"></textarea>
				                        </div>
														<div class="form-group">
				                        	<label class="sr-only" for="form-last-name">Gender</label>
<select name="gender" class="form-last-name form-control" id="gender" onchange="changeFunc1();">
<option class="form-control" id="Gender" disabled selected hidden>Gender...</option>
<option class="form-control" id="Male">Male</option>
<option class="form-control" id="Female">Female</option>
<option class="form-control" id="Transgender">Transgender</option>
</select>

				                        </div>
							<div class="form-group">
				                        	<label class="sr-only" for="form-last-name">Current Batch</label>
<select name="current_batch" class="form-last-name form-control" id="current_batch" onchange="changeFunc2();">
<option class="form-control" id="Current_Batch" disabled selected hidden>Current Batch...</option>
<?php
for($i=2001 ; $i <= date("Y");$i++)
{
echo "<option class='form-control'>".$i."</option>";
}
?>
</select>

				                        </div>							
				                        <button type="button" class="btn btn-next" onclick="checknull()">Next</button>
				                    </div>
			                    </fieldset>			                    
			                    <fieldset>
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>Step 2 / 3</h3>
		                            		<p>Your School Life:</p>
		                        		</div>
		                        		<div class="form-top-right">
		                        			<i class="fa fa-key"></i>
		                        		</div>
		                            </div>
		                            <div class="form-bottom">
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-email">
10th Percentage</label>
				                        	<input type="text" name="percentage_10" placeholder="10th Percentage..." class="form-email form-control" id="form-email">
				                        </div>
							<div class="form-group">
<select name="10thMedium_of_Instruction" class="form-last-name form-control" id="10thMedium_of_Instruction" onchange="changeFunc3();">
<option class="form-control" id="10thMedium_of_Instruction" disabled selected hidden>10th Medium of Instruction...</option>
<option class="form-control" id="English Medium">English</option>
<option class="form-control" id="Tamil Medium">Tamil</option>
<option class="form-control" id="Other Medium">Others</option>
</select>
</div>
<div class="form-group">
<select name="10thBoard" class="form-last-name form-control" id="10thBoard" onchange="changeFunc4();">
<option class="form-control" id="10thBoard" disabled selected hidden>10th Board...</option>
<option class="form-control" id="State_Board">State Board</option>
<option class="form-control" id="CBSE">CBSE</option>
<option class="form-control" id="Others">Others</option>
</select>
				                        </div>
<div class="form-group">
				                        	<label class="sr-only" for="form-email">
12th Percentage</label>
				                        	<input type="text" name="percentage_12" placeholder="12th Percentage..." class="form-email form-control" id="form-email">
				                        </div>
							<div class="form-group">
<select name="12thMedium_of_Instruction" class="form-last-name form-control" id="12thMedium_of_Instruction" onchange="changeFunc5();">
<option class="form-control" id="12thMedium_of_Instruction" disabled selected hidden>12th Medium of Instruction...</option>
<option class="form-control" id="English Medium">English</option>
<option class="form-control" id="Tamil Medium">Tamil</option>
<option class="form-control" id="Other Medium">Others</option>
</select>
</div>
<div class="form-group">
<select name="12thBoard" class="form-last-name form-control" id="12thBoard" onchange="changeFunc6();">
<option class="form-control" id="Board" disabled selected hidden>12th Board...</option>
<option class="form-control" id="State_Board">State Board</option>
<option class="form-control" id="CBSE">CBSE</option>
<option class="form-control" id="Others">Others</option>
</select>
				                        </div>
				                        <button type="button" class="btn btn-previous">Previous</button>
				                        <button type="button" onclick="checknull1()" class="btn btn-next">Next</button>
				                    </div>
			                    </fieldset>
			                    
			                    <fieldset>
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>Step 3 / 3</h3>
		                            		<p>Welcome to CEG:</p>
		                        		</div>
		                            </div>
		                            <div class="form-bottom">
				                    		<div class="form-group">
<select name="Branch" class="form-last-name form-control" id="Branch" onchange="changeFunc7();">
<option class="form-control" id="Branch" disabled selected hidden>Branch...</option>
<option class="form-control" id="CS">Computer Science</option>
<option class="form-control" id="IT">Information Technology</option>
</select>
</div>
<div class="form-group">
<select name="Sem" class="form-last-name form-control" id="Sem" onchange="changeFunc8();">
<option class="form-control" id="Board" disabled selected hidden>Sem...</option>
<option class="form-control" id="1">1</option>
<option class="form-control" id="2">2</option>
<option class="form-control" id="3">3</option>
<option class="form-control" id="4">4</option>
<option class="form-control" id="5">5</option>
<option class="form-control" id="6">6</option>
<option class="form-control" id="7">7</option>
<option class="form-control" id="8">8</option>
<option class="form-control" id="9">9</option>
<option class="form-control" id="10">10</option>
</select>
				                        </div>			                        
				                        <button type="button" class="btn btn-previous">Previous</button>
				 <button type="submit" class="btn" onclick="checknull2()">Sign me up!</button>
				                    </div>
			                    </fieldset>
		                    
		                    </form>
		                    
                        </div><!-- Javascript -->
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/retina-1.1.0.min.js"></script>
        <script src="assets/js/scripts.js"></script>        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->
                    </div>
                </div>
            </div>
            
        </div>


        

    </body>

</html>
<script type="text/javascript">
function checknull()
{var e = document.getElementById("blood_group");
var strUser = e.options[e.selectedIndex].value;
if(strUser=="Blood Group...")
{
document.getElementById("blood_group").style.border="3px solid #19B9E7";  
}
var e1 = document.getElementById("gender");
var strUser1 = e1.options[e1.selectedIndex].value;
if(strUser1=="Gender...")
{
document.getElementById("gender").style.border="3px solid #19B9E7";  
}
var e2 = document.getElementById("current_batch");
var strUser2 = e2.options[e2.selectedIndex].value;
if(strUser2=="Current Batch...")
{
document.getElementById("current_batch").style.border="3px solid #19B9E7";  
}
}
function checknull1()
{
var e5 = document.getElementById("10thMedium_of_Instruction");
var strUser5 = e5.options[e5.selectedIndex].value;
if(strUser5=="10th Medium of Instruction...")
{
document.getElementById("10thMedium_of_Instruction").style.border="3px solid #19B9E7";  
}
var e4 = document.getElementById("10thBoard");
var strUser4 = e4.options[e4.selectedIndex].value;
if(strUser4=="10th Board...")
{
document.getElementById("10thBoard").style.border="3px solid #19B9E7";  
}
var e1 = document.getElementById("12thMedium_of_Instruction");
var strUser1 = e1.options[e1.selectedIndex].value;
if(strUser1=="12th Medium of Instruction...")
{
document.getElementById("12thMedium_of_Instruction").style.border="3px solid #19B9E7";  
}
var e2 = document.getElementById("12thBoard");
var strUser2 = e2.options[e2.selectedIndex].value;
if(strUser2=="12th Board...")
{
document.getElementById("12thBoard").style.border="3px solid #19B9E7";  
}
}
function checknull2()
{
var e1 = document.getElementById("Branch");
var strUser1 = e1.options[e1.selectedIndex].value;
if(strUser1=="Branch...")
{
document.getElementById("Branch").style.border="3px solid #19B9E7";  
}
var e2 = document.getElementById("Sem");
var strUser2 = e2.options[e2.selectedIndex].value;
if(strUser2=="Sem...")
{
document.getElementById("Sem").style.border="3px solid #19B9E7";  
}
}
function changeFunc()
{
document.getElementById("blood_group").style.border="3px solid #DCDCDC";  
}
function changeFunc1()
{
document.getElementById("gender").style.border="3px solid #DCDCDC";  
}
function changeFunc2()
{
document.getElementById("current_batch").style.border="3px solid #DCDCDC";  
}
function changeFunc3()
{
document.getElementById("10thMedium_of_Instruction").style.border="3px solid #DCDCDC";  
}
function changeFunc4()
{
document.getElementById("10thBoard").style.border="3px solid #DCDCDC";  
}
function changeFunc5()
{
document.getElementById("12thMedium_of_Instruction").style.border="3px solid #DCDCDC";  
}
function changeFunc6()
{
document.getElementById("12thBoard").style.border="3px solid #DCDCDC";  
}
function changeFunc7()
{
document.getElementById("Branch").style.border="3px solid #DCDCDC";  
}
function changeFunc8()
{
document.getElementById("Sem").style.border="3px solid #DCDCDC";  
}
</script>
<style>
select.form-control:focus {
border-color:#19B9E7; 
}
</style>