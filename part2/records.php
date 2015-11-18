<html>
  <head>
    <title>Patient Records</title>
  </head>
  <body link="#ff6666">
    <font face="Helvetica">
    <h3><a href="index.html">Home</a></h3>
    <h3><font color="#668cff">Acess Patient Records</font></h3>
<?php
  ini_set('display_errors', on);
  error_reporting(E_ALL);
  $host = "db.ist.utl.pt";
  $user = "ist173099";
  $pass = "mile6613";
  $dsn = "mysql:host=$host;dbname=$user";
  try {
    $connection = new PDO($dsn, $user, $pass);
  }
  catch(PDOException $exception) {
    echo("<p>Error: ");
    echo($exception->getMessage());
    echo("</p>");
    exit();
  }

  $number = $_REQUEST['number'];

  $sql = "SELECT DISTINCT Reading.snum, Reading.manuf, Reading.value, Sensor.units, Reading.datetime
          FROM Patient, Wears, Connects, Reading, Sensor
          WHERE Wears.patient = '$number'
            AND Wears.pan = Connects.pan
            AND Connects.snum = Reading.snum
            AND Connects.manuf = Reading.manuf
            AND Sensor.snum = Reading.snum
            AND Sensor.manuf = Reading.manuf";

  $result = $connection->query($sql);
  if ($result == FALSE) {
    $info = $connection->errorInfo();
    echo("<p>Error: {$info[2]}</p>");
    exit();
  }

  //echo("<h4>Patient Name: $number</h4>");
  echo("<h5>Patient Number: $number</h5>");

  echo("<table border=\"1\">");
  echo("<caption><strong>Readings</strong></caption>");

  if($result->rowCount() == 0) {
    echo("<tr><td>");
    echo("No readings found for that patient");
    echo("</td></tr>");
  }

  else {
    echo("<tr><td>Device Serial No.</td><td>Device Manufacturer</td><td>Value</td><td>Units</td><td>Date and Time</td></tr>");
    foreach($result as $row) {
      echo("<tr><td>");
      echo($row['snum']);
      echo("</td><td>");
      echo($row['manuf']);
      echo("</td><td>");
      echo($row['value']);
      echo("</td><td>");
      echo($row['units']);
      echo("</td><td>");
      echo($row['datetime']);
      echo("</td></tr>");
    }
  }

  echo("</table>");

  echo("<p></p>");

  $sql = "SELECT DISTINCT Setting.snum, Setting.manuf, Setting.value, Actuator.units, Setting.datetime
          FROM Patient, Wears, Connects, Setting, Actuator
          WHERE Wears.patient = '$number'
            AND Wears.pan = Connects.pan
            AND Connects.snum = Setting.snum
            AND Connects.manuf = Setting.manuf
            AND Actuator.snum = Setting.snum
            AND Actuator.manuf = Setting.manuf";

  $result = $connection->query($sql);
  if ($result == FALSE) {
    $info = $connection->errorInfo();
    echo("<p>Error: {$info[2]}</p>");
    exit();
  }

  echo("<table border=\"1\">");
  echo("<caption><strong>Settings</strong></caption>");

  if($result->rowCount() == 0) {
    echo("<tr><td>");
    echo("No settings found for that patient");
    echo("</td></tr>");
  }

  else {
    echo("<tr><td>Device Serial No.</td><td>Device Manufacturer</td><td>Value</td><td>Units</td><td>Date and Time</td></tr>");
    foreach($result as $row) {
      echo("<tr><td>");
      echo($row['snum']);
      echo("</td><td>");
      echo($row['manuf']);
      echo("</td><td>");
      echo($row['value']);
      echo("</td><td>");
      echo($row['units']);
      echo("</td><td>");
      echo($row['datetime']);
      echo("</td></tr>");
    }
  }

  echo("</table>");

  $connection = null;
?>
  </body>
</html>
