<html>
  <head>
    <title>Transfer Devices</title>
  </head>
  <body link="#ff6666">
    <font face="Helvetica">
    <h3><a href="index.html">Home</a></h3>
    <h3><a href="transfer_devices.php"><font color="#66b2ff">Transfer Devices between PANs</font></a></h3>
<?php
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

  $name = $_REQUEST['name'];
  $number = $_REQUEST['number'];

  $sql = "SELECT Device.serialnum, Device.manufacturer
          FROM Patient, Wears, Connects, Device
          WHERE Wears.patient = '$number'
            AND Wears.pan = Connects.pan
            AND Connects.snum = Device.serialnum
            AND Connects.manuf = Device.manufacturer";

  $result = $connection->query($sql);
  if ($result == FALSE) {
    $info = $connection->errorInfo();
    echo("<p>Error: {$info[2]}</p>");
    exit();
  }

  echo("<p><font size=\"2\">Patient Name: <strong>$name</strong></p>");
  echo("<p>Patient Number: <strong>$number</strong></font></p>");

  echo("<table border=\"1\">");
  echo("<caption><strong>Readings</strong></caption>");

  if($result->rowCount() == 0) {
    echo("<col width=\"300\">");
    echo("<tr><td align=\"center\">");
    echo("This patient is not currently wearinging a PAN");
    echo("</td></tr>");
  }

  else {
    echo("<col width=\"170\"><col width=\"170\"><col width=\"170\"><col width=\"170\"><col width=\"170\">");
    echo("<tr><th>Device Serial No.</th><th>Device Manufacturer</th><th>Value</th><th>Units</th><th>Date and Time</th></tr>");
    foreach($result as $row) {
      echo("<tr><td align=\"center\">");
      echo($row['serialnum']);
      echo("</td><td align=\"center\">");
      echo($row['manufacturer']);
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
    echo("<col width=\"300\">");
    echo("<tr><td align=\"center\">");
    echo("No settings found for that patient");
    echo("</td></tr>");
  }

  else {
    echo("<col width=\"170\"><col width=\"170\"><col width=\"170\"><col width=\"170\"><col width=\"170\">");
    echo("<tr><th>Device Serial No.</th><th>Device Manufacturer</th><th>Value</th><th>Units</th><th>Date and Time</th></tr>");
    foreach($result as $row) {
      echo("<tr><td align=\"center\">");
      echo($row['snum']);
      echo("</td><td align=\"center\">");
      echo($row['manuf']);
      echo("</td><td align=\"center\">");
      echo($row['value']);
      echo("</td><td align=\"center\">");
      echo($row['units']);
      echo("</td><td align=\"center\">");
      echo($row['datetime']);
      echo("</td></tr>");
    }
  }

  echo("</table>");

  $connection = null;
?>
    </font>
  </body>
</html>
