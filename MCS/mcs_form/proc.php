<?php
mysql_connect("localhost","root","");
mysql_select_db("mcs_final");
$result=mysql_query("
CALL usp_insert_student
('2013242025',
    'sabhari',
'karthik',
'17-11-1995',
'adgmani@gmail.com',
 '8056020198',
'ramnad',
'600116',
'north car street',
'AB+',
'writing',
'male',
'2017',
'Information Technology',
7,
90.5,
'English',
'State board',
92.0,
 'tamil',
'CBSE')");
?>