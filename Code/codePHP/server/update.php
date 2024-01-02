<?php
include"connect.php";
$name = $_POST['name'];
$pass = $_POST['pass'];
if(strlen($name)>0 && strlen($pass)>0){
    $query = "select*from account where name='$name'";
    if(mysqli_num_rows(mysqli_query($conn,$query))>0){
        $update = "update account set password = '$pass' where name = '$name'";
        if(mysqli_query($conn,$update)){
            echo "ok";
        }else{
        }
    }
    else{
        echo"false";
    }
}else{
    echo"ktra lai du lieu";
}
?>