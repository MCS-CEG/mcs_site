<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Planned Events</title>

      <link rel="stylesheet" href="<?php echo base_url();?>assets/css/card_style.css">
     <!-- <link rel="stylesheet" href="<?php echo base_url();?>assets/css/alumni_event.css"> -->  
</head>

<body>
  <div class="cards">
 <center><h1> Planned Events </h1></center>
<?php 
   for($i=0;$i<count($event_name);$i++)
   {        
   ?>
  <div class="card">
    <img src="<?php echo base_url();?>assets/img/fund.jpg">
    <div class="card-title">
      <a href="#" class="toggle-info btn">
        <span class="left"></span>
        <span class="right"></span>
      </a>
      <h2>
         <center> <?php echo $event_name[$i];?> 
          <small><?php echo "Expected Start Date : ".$exp_start_date[$i];?></small>
          <small><?php echo "Expected End Date : ".$exp_end_date[$i];?></small></center>
      </h2>
    </div>
    <div class="card-flap flap1">
      <div class="card-description">
        <?php echo "<b>Type : </b>".$event_type[$i];?><br/>
        <?php echo "<b>Description: </b>".$event_desc[$i];?><br/>
        <?php echo "<b>Years: </b> ".$event_for[$i];?>
      </div>
      <div class="card-flap flap2">
        <div class="card-actions">
          <a href="#" class="btn">Register</a>
        </div>
      </div>
    </div>
  </div>
<?php 
   }       
   ?>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js'></script>

    <script  src="<?php echo base_url();?>assets/js/index.js"></script>

</body>
</html>