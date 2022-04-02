<?php
require('connect.php');
$makeQuery ="SELECT * FROM  ebook ORDER BY id DESC";
$statement =$conn->prepare($makeQuery);
$statement->execute();
$myArray =array();
while($resultFrom = $statement->fetch()){
    array_push($myArray,array( 'id'=>$resultFrom['id'],
                              'pdffile'=>$resultFrom['pdffile'],
                              'pdfname'=>$resultFrom['pdfname']));
}
echo json_encode($myArray);
?>
