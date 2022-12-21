<?php include('includes/header.php')?>
<?php include('../includes/session.php')?>


<?php
	if(isset($_POST['apply']))
	{
	$empid=$session_id;
	$request_type=$_POST['request_type'];
	$fromdate=date('d-m-Y', strtotime($_POST['date_from']));
	$todate=date('d-m-Y', strtotime($_POST['date_to']));
	$description=$_POST['description'];  
	$status=0;
	$isread=0;
	$maintenance_request_limit=$_POST['maintenance_request_limit'];
	$datePosting = date("Y-m-d");

	if($fromdate > $todate)
	{
	    echo "<script>alert('End Date should be greater than Start Date');</script>";
	  }
	elseif($maintenance_request_limit <= 0)
	{
	    echo "<script>alert('WORKING DAYS EXCEEDED, REQUEST FAILED');</script>";
	  }

	else {
		
		$DF = date_create($_POST['date_from']);
		$DT = date_create($_POST['date_to']);

		$diff =  date_diff($DF , $DT );
		$num_days = (1 + $diff->format("%a"));

		$sql="INSERT INTO requests(requestType,ToDate,FromDate,Description,Status,IsRead,empid,num_days,PostingDate) VALUES(:request_type,:fromdate,:todate,:description,:status,:isread,:empid,:num_days,:datePosting)";
		$query = $dbh->prepare($sql);
		$query->bindParam(':request_type',$request_type,PDO::PARAM_STR);
		$query->bindParam(':fromdate',$fromdate,PDO::PARAM_STR);
		$query->bindParam(':todate',$todate,PDO::PARAM_STR);
		$query->bindParam(':description',$description,PDO::PARAM_STR);
		$query->bindParam(':status',$status,PDO::PARAM_STR);
		$query->bindParam(':isread',$isread,PDO::PARAM_STR);
		$query->bindParam(':empid',$empid,PDO::PARAM_STR);
		$query->bindParam(':num_days',$num_days,PDO::PARAM_STR);
		$query->bindParam(':datePosting',$datePosting,PDO::PARAM_STR);
		$query->execute();
		$lastInsertId = $dbh->lastInsertId();
		if($lastInsertId)
		{
			echo "<script>alert('Maintenance Request Successfull.');</script>";
			echo "<script type='text/javascript'> document.location = 'maintenance_history.php'; </script>";
		}
		else 
		{
			echo "<script>alert('Something went wrong. Please try again');</script>";
		}

	}

}

?>

<body>

	<?php include('includes/navbar.php')?>

	<?php include('includes/right_sidebar.php')?>

	<?php include('includes/left_sidebar.php')?>

	<div class="mobile-menu-overlay"></div>

	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="pb-20">
			<div class="min-height-200px">
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>Maintenance Application</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.php">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">Make A Request</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<div style="margin-left: 50px; margin-right: 50px;" class="pd-20 card-box mb-30">
					<div class="clearfix">
						<div class="pull-left">
							<h4 class="text-blue h4">Staff Form</h4>
							<p class="mb-20"></p>
						</div>
						
					</div>
					<div class="wizard-content">
						<form method="post" action="">
							<section>

								<?php if ($role_id = 'Student'): ?>
								<?php $query= mysqli_query($conn,"select * from tblemployees where emp_id = '$session_id'")or die(mysqli_error());
									$row = mysqli_fetch_array($query);
								?>
						
								<div class="row">
									<div class="col-md-6 col-sm-12">
										<div class="form-group">
											<label >Full Name </label>
											<input name="firstname" type="text" class="form-control wizard-required" required="true" readonly autocomplete="off" value="<?php echo $row['FirstName']; ?>">
										</div>
									</div>
									<div class="col-md-6 col-sm-12">
										<div class="form-group">
											<label >Building and Office Number </label>
											<input name="lastname" type="text" class="form-control" readonly required="true" autocomplete="off" value="<?php echo $row['LastName']; ?>">
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-6 col-sm-12">
										<div class="form-group">
											<label>Email Address</label>
											<input name="email" type="text" class="form-control" required="true" autocomplete="off" readonly value="<?php echo $row['EmailId']; ?>">
										</div>
									</div>
									<div class="col-md-6 col-sm-12">
										<div class="form-group">
											<label>Remaining Requests </label>
											<input name="maintenance_request_limit" type="text" class="form-control" required="true" autocomplete="off" readonly value="<?php echo $row['swift_hostel']; ?>">
										</div>
									</div>
									<?php endif ?>
								</div>
								<div class="row">
								
									<div class="col-md-12 col-sm-12">
										<div class="form-group">
											<label>Request Type :</label>
											<select name="request_type" class="custom-select form-control" required="true" autocomplete="off">
											<option value="">Select Request Type...</option>
											<?php $sql = "SELECT  requestType from requestType";
											$query = $dbh -> prepare($sql);
											$query->execute();
											$results=$query->fetchAll(PDO::FETCH_OBJ);
											$cnt=1;
											if($query->rowCount() > 0)
											{
											foreach($results as $result)
											{   ?>                                            
											<option value="<?php echo htmlentities($result->requestType);?>"><?php echo htmlentities($result->requestType);?></option>
											<?php }} ?>
											</select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-8 col-sm-12">
										<div class="form-group">
											<label>Description of Issue :</label>
											<textarea id="textarea1" name="description" class="form-control" required length="150" maxlength="150" required="true" autocomplete="off"></textarea>
										</div>
									</div>
								</div>
								<br>
								


								<br>
								<div> <label><b>Provide 3 consecutive days when you are Available for Maintenance by Selecting Dates from the Date Picker Below.<b></label></div><br>
								<div class="row">
									<div class="col-md-6 col-sm-12">
										<div class="form-group">
											<label>Starting Date :</label>
											<input name="date_from" type="text" class="form-control date-picker" required="true" autocomplete="off">
										</div>
									</div>
									<div class="col-md-6 col-sm-12">
										<div class="form-group">
											<label>Ending Date :</label>
											<input name="date_to" type="text" class="form-control date-picker" required="true" autocomplete="off">
										</div>
									</div>
								</div>
								<div id="center_button">
    							<button style="border-radius: 20px; background-color: #d0c8fb;
        text-align: center;
        font-size: 28px;
        padding: 20px;
        width: 200px;
        -webkit-transition: all 0.5s;
        -moz-transition: all 0.5s;
        -o-transition: all 0.5s;
        transition: all 0.5s;
        cursor: pointer;
        margin: 5px;" onclick="location.href='../upload_image/index.php'">Upload image of Issue</button>
								</div>
								<div class="row">
									<div class="col-md-4 col-sm-12">
										<div class="form-group">
											<label style="font-size:16px;"><b></b></label>
											<div class="modal-footer justify-content-center">
												<button class="btn btn-primary" name="apply" id="apply" data-toggle="modal">Apply&nbsp;Request</button>
											</div>
										</div>
									</div>
								</div>
							</section>
						</form>
					</div>
				</div>
				<!-- <Label> <b> <i>Upload picture of related issue[note: the maximum size should not exceed 10 MB]</i></b></Label>
						


			</div>
			
		</div>
	</div>
	<!-- js -->
	<?php include('includes/scripts.php')?>
</body>

</html>