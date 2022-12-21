<?php
	$conn = mysqli_connect("localhost", "root", "", "db_download");
	
	if(!$conn){
		die("Error: Failed to connect to database!");
	}
?>