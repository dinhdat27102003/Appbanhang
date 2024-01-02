<?php
include"connect.php";
$namee = $_POST['name'];
$pass = $_POST['pass'];
if(strlen($namee)>0 && strlen($pass)>0){
    $query = "select*from account where name='$namee'";
    if(mysqli_num_rows(mysqli_query($conn,$query))==0){
        $insert = "INSERT INTO account(id,name,password) VALUES (null,'$namee','$pass')";
        if(mysqli_query($conn,$insert)){
            echo "ok";
        }else{
        }
    }
    else{
        echo"false";
    }
    /*$query = "INSERT INTO account(id,name,password) VALUES (null,'$namee','$pass')";
    if(mysqli_query($conn,$query)){
        echo "ok";
    }
    else{
        echo"that bai";
    }*/
}else{
    echo"ktra lai du lieu";
}
?>