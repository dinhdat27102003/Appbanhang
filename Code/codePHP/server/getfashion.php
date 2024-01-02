<?php
header("content-type: text/html; charset=utf-8")
?>

<?php

$server="localhost";
$user="root";
$pass="";
$database="shop";
$conn = new mysqli($server, $user, $pass,$database);


// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

mysqli_select_db($conn,$database) or die("khong ket noi");
class Main{

}
class Loaisanpham{

}
class Product{

}

    loadcategory($conn);

function loadcategory($conn){
    $sanpham = [];
    $sql="select*from sanpham where idsanpham = 2 or idsanpham = 3 or idsanpham = 1";
    $result=mysqli_query($conn,$sql,0);
    while($row=mysqli_fetch_array($result)){
        $product = new Product();
        $product->id = $row['id'];
        $product->name = $row['tensanpham'];
        $product->price = $row['giasanpham'];
        $product->image = $row['hinhanhsanpham'];
        $product->description = $row['motasanpham'];
        $product->idloaisp = $row['idsanpham'];
        array_push($sanpham,$product);

    }
    $main = new Main();
    $main->sanpham=$sanpham;
    echo json_encode($main,true);
}

