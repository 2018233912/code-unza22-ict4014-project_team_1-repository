<?php
	require_once 'conn.php';
	
	if(ISSET($_REQUEST['image_id'])){
		$image = $_REQUEST['image_id'];
		$query = mysqli_query($conn, "SELECT * FROM `image` WHERE `img_id` = '$image'") or die(mysqli_error());
		$fetch = mysqli_fetch_array($query);
		
		header("Content-Disposition: attachment; filename=".$fetch['image']);
		header("Content-Type: application/octet-stream;");
		readfile("uploads/".$fetch['image']);
	}
?>