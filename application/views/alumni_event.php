<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>MCS Events</title>  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">  
  <link rel="stylesheet" href="<?php echo base_url();?>assets/css/alumni_event.css"> 
  <style>
  .pre{word-spacing: 65px;}
  </style>
</head>
<body bgcolor="#90D474">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up Form</title>
        <link rel="stylesheet" href="css/normalize.css">
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/main.css">
    </head>
    <body>
      <form action="alumni_event_insert" method="post">      
        <h1>MCS Events</h1>        
        <fieldset>
          <legend><span class="number">1</span>Events Details</legend>
          <label for="name">Event Name:</label>
          <input type="text" id="name" name="event_name" required/>          
          <label>Type of Event:</label>
          <input type="radio" id="1" value="Technical" name="event_type"><label for="under_13" class="light">Technical Event</label><br>
          <input type="radio" id="2" value="Literary" name="event_type"><label for="over_13" class="light">Literary Event</label>
        </fieldset>        
        <fieldset>
          <legend><span class="number">2</span>About Your Event</legend>
          <label for="bio">Event Description:</label>
          <textarea id="bio" name="event_desc" required></textarea>       
          <label>Event is for which year?</label>
          <div class="pre">
          <input type="checkbox" id="development" value="I" name="event_year[]"><label class="light" for="development">I</label>
          <input type="checkbox" id="development" value="II" name="event_year[]"><label class="light" for="development">II</label>
          <input type="checkbox" id="development" value="III" name="event_year[]"><label class="light" for="development">III</label>
          <input type="checkbox" id="development" value="IV" name="event_year[]"><label class="light" for="development">IV</label>
          <input type="checkbox" id="development" value="V" name="event_year[]"><label class="light" for="development">V</label>
        </div>
        </fieldset>
        <label for="name">Expected Time Interval:</label>
        <label for="name">From:</label>
          <input type="Date" id="from_date" name="exp_start_date" required/>
          <label for="name">To:</label>
          <input type="Date" id="end_date" name="exp_end_date" required/>
        <button name = "submit" type="submit">Add Event</button>
      </form>
      
    </body>
</html>
  
  
</body>
</html>