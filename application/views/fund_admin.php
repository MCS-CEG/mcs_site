<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>MCS Fund Management</title>  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">  
  <link rel="stylesheet" href="<?php echo base_url();?>assets/css/alumni_event.css"> 
</head>
<body bgcolor="#90D474">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MCS Fund Management</title>

        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
     
    </head>
    <body>
      <form action="fund_insert" method="post">      
        <h1>MCS Fund Management</h1>        
        <fieldset>
          <legend><span class="number">1</span>Events Details</legend>
          <label for="name">Event Name:</label>
          <input type="text" id="name" name="event_name" required/>  
          <label for="bio">Event Description:</label>
          <textarea id="bio" name="event_desc" required></textarea> 
          <label for="bio">Event Date:</label>
          <input type="date" name="event_date" required></textarea> 
          <label for="name">Total Cost:</label>
          <input type="text" id="total_cost" name="total_cost" required/>  
          <label for="name">Add PDF:</label>
          <input type="file" id="event_pdf" name="event_pdf" required/> <br/><br/>
          <label for="name">Add Event Image:</label>
          <input type="file" id="event_img" name="event_img" required/>          
        </fieldset>        
        <button name= "submit" type="submit">Add Event</button>
      </form>
      
    </body>
</html>
  
  
</body>
</html>