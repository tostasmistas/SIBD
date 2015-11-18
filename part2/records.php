<html>
  <body>
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

  $sql = "SELECT Reading.snum, Reading.manuf, Sensor.units, Reading.datetime
          FROM Patient, Wears, Connects, Reading, Setting, Sensor
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

  echo("<table border=\"1\">");
  echo("<tr><td>Device Serial No.</td><td>Device Manufacturer</td><td>Units</td><td>Date and Time</td></tr>");
  foreach($result as $row) {
    echo("<tr><td>");
    echo($row['snum']);
    echo("</td><td>");
    echo($row['manuf']);
    echo("</td><td>");
    echo($row['units']);
    echo("</td><td>");
    echo($row['datetime']);
    echo("</td></tr>");
  }
  echo("</table>");

  $connection = null;
?>
  </body>
</html>
