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

  $sql = "SELECT Wears.pan
          FROM Wears
          WHERE Wears.patient = '$number'
            AND Wears.end = '2999-12-31 00:00:00'";

  $result = $connection->query($sql);
  if ($result == FALSE) {
    $info = $connection->errorInfo();
    echo("<p>Error: {$info[2]}</p>");
    exit();
  }

  echo("<p><font size=\"2\">Patient Name: <strong>$name</strong></p>");
  echo("<p>Patient Number: <strong>$number</strong></font></p>");

  if($result->rowCount() == 0) {
    echo("This patient is not wearing a PAN at the moment");
  }

  else {
    $currentPAN = $result->fetchColumn();
    echo("<p><font size=\"2\">Current PAN: <strong>$currentPAN</strong></font></p>");

    $sql = "SELECT Wears.pan
            FROM Wears
            WHERE Wears.patient = '$number'
            ORDER BY Wears.end DESC
            LIMIT 1,1"; // para aceder à segunda linha da tabela de resultados que contém a penúltima PAN

    $result = $connection->query($sql);
    if ($result == FALSE) {
      $info = $connection->errorInfo();
      echo("<p>Error: {$info[2]}</p>");
      exit();
    }

    if($result->rowCount() == 0) {
      echo("This patient does not have a previous PAN");
    }

    else {
      $previousPAN = $result->fetchColumn();
      echo("Displaying devices than can be transfered from PAN ");
      echo("<font size=\"2\"><strong>$previousPAN</strong></font>");
      echo(" to PAN ");
      echo("<font size=\"2\"><strong>$currentPAN</strong></font>");

      $sql = "SELECT Connects.snum, Connects.manuf
              FROM Connects
              WHERE Connects.pan = '$previousPAN'
                AND Connects.end = '2999-12-31 00:00:00'"; // garantir que os devices ainda estao ligados à previous PAN
    }

    foreach($result as $row) {
      echo("<tr><td align=\"center\">");
      echo($row['snum']);
      echo("</td><td align=\"center\">");
      echo($row['manuf']);
      echo("</td></tr>");
    }
  }

  $connection = null;
?>
    </font>
  </body>
</html>
