<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
	</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<a class="navbar-brand" href="https://sourcecodester.com">Sourcecodester</a>
		</div>
	</nav>
	<div class="col-md-3"></div>	
	<div class="col-md-6 well">
		<h3 class="text-primary">PHP - Drag And Drop Image Download</h3>
		<hr style="border-top:1px dotted #ccc;"/>
		<form method="POST" action="upload.php" enctype="multipart/form-data">
			<div class="form-inline">
				<input type="file" class="form-control" name="image" required="required"/>
				<button class="btn btn-primary" name="upload"><span class="glyphicon glyphicon-upload"></span> Upload</button>
			</div>
		</form>
		<br />
		<div class="col-md-4" style="border:1px SOLID #ccc;" ondrop="drop(event)" ondragover="dragOver(event)">
			<img src="images/download.png" height="200"/>
		</div>
		<div class="col-md-8" style="padding:10px;">
			<?php
				require 'conn.php';
				
				$query = mysqli_query($conn, "SELECT * FROM `image`") or die(mysqli_error());
				while($fetch = mysqli_fetch_array($query)){
			?>
				<img src="<?php echo $fetch['location']?>" id="<?php echo $fetch['img_id']?>" height="100" width="100" style="float:left; margin:10px;" draggable="true" ondragstart="drag(event)"/>
			<?php
				}
			?>
		</div>
	</div>
<script src="js/script.js"></script>	
</body>	
</html>