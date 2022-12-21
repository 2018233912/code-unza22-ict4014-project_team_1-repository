<?php
	require_once 'conn.php';
	
	if(ISSET($_POST['upload'])){
		$image_name = $_FILES['image']['name'];
		$image_temp = $_FILES['image']['tmp_name'];
		$allowed_ext = array("jpeg", "jpg", "gif", "png");
		$exp = explode(".", $image_name);
		$ext = end($exp);
		$name = date("Y-m-d h-i-s").".".$ext;
		$path = "uploads/".$name;
		if(in_array($ext, $allowed_ext)){
			if(move_uploaded_file($image_temp, $path)){
				mysqli_query($conn, "INSERT INTO `image` VALUES('', '$name', '$path')") or die(mysqli_error());
				header("location: index.php");
			}
		}else{
			echo "<script>alert('Invalid image format')</script>";
		}
	}
?>