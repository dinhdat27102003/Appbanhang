<?php
$host="localhost";
$username="root";
$password="";
$database="shop";

$conn=mysqli_connect($host,$username,$password,$database);
mysqli_query($conn,'set names"utf8"');

?>