<?php
include"connect.php";
$name = $_POST['name'];
$pass = $_POST['pass'];
if(strlen($name)>0 && strlen($pass)>0){
    $query = "select*from account where name='$name' and password= '$pass'";
    if(mysqli_num_rows(mysqli_query($conn,$query))==1){
        echo "ok";
    }
    else{
        echo"that bai";
    }
}else{
    echo"ktra lai du lieu";
}
?>