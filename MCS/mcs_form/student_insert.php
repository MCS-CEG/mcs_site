<?php
mysql_connect("localhost","root","");
mysql_select_db("mcs_final");
$fname=$_POST['firstname'];
$lname=$_POST['lastname'];
$dob=$_POST['dob'];
$mob_no=$_POST['mobile_no'];
$hometown=$_POST['hometown'];
$Pincode=$_POST['pincode'];
$Address=$_POST['address'];
$Blood_Group=$_POST['blood_group'];
$Hobby=$_POST['hobby'];
$gender=$_POST['gender'];
$current_batch=$_POST['current_batch'];
$percentage_10=(float)$_POST['percentage_10'];
$med_10=$_POST['10thMedium_of_Instruction'];
$board_10=$_POST['10thBoard'];
$percentage_12=(float)$_POST['percentage_12'];
$med_12=$_POST['12thMedium_of_Instruction'];
$board_12=$_POST['12thBoard'];
$Branch=$_POST['Branch'];
$Sem=(int)$_POST['Sem'];
echo $fname."<br/>";
$proc="CALL usp_insert_student('2013242018','".$fname."','".$lname."','".$dob."','pressi@gmail.com','".$mob_no."','".$hometown."','".$Pincode."','".$Address."','".$Blood_Group."','".$Hobby."','".$gender."','".$current_batch."','".$Branch."',".$Sem.",".$percentage_10.",'".$med_10."','".$board_10."',".$percentage_12.",'".$med_12."','".$board_12."')";
$result = mysql_query("CALL usp_insert_student('2013242018','".$fname."','".$lname."','".$dob."','pressi@gmail.com','".$mob_no."','".$hometown."','".$Pincode."','".$Address."','".$Blood_Group."','".$Hobby."','".$gender."','".$current_batch."','".$Branch."',".$Sem.",".$percentage_10.",'".$med_10."','".$board_10."',".$percentage_12.",'".$med_12."','".$board_12."')");
echo $gender."<br/>";
echo $proc;
?>

