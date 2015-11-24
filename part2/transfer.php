<?php session_start(); ?>
<html>
  <head>
    <title>Transfer Devices</title>
  </head>
  <body link="#ff6666">
    <font face="Helvetica">
    <form action="execute_transfer.php" method="post">
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

    $sql = "SELECT Wears.pan, Wears.end
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
      $previousPAN_data = $result->fetch(PDO::FETCH_ASSOC); // indexed by column name
      $previousPAN = $previousPAN_data["pan"];
      $previousPAN_end = $previousPAN_data["end"];

      echo("<p><font size=\"2\">Previous PAN: <strong>$previousPAN</strong></font></p>");

      $sql = "SELECT Connects.snum, Connects.manuf, Connects.start
              FROM Connects
              WHERE Connects.pan = '$previousPAN'
                AND Connects.start < '$previousPAN_end'
                AND Connects.end = '2999-12-31 00:00:00'";
                // garantir que devices foram ligados a previous PAN durante o tempo que o paciente esteve ligado a ela
                // garantir que os devices ainda estao ligados a previous PAN
                // preciso do start para depois poder inserir na tabela Period[start, now] para desligar da previous PAN

      $result = $connection->query($sql);
      if ($result == FALSE) {
        $info = $connection->errorInfo();
        echo("<p>Error: {$info[2]}</p>");
        exit();
      }

      if($result->rowCount() == 0) {
        echo("PAN <font size=\"2\"><strong>$previousPAN</strong></font> does not have any transferable devices");
      }

      else {
        echo("Displaying devices than can be transfered from PAN ");
        echo("<font size=\"2\"><strong>$previousPAN</strong></font>");
        echo(" to PAN ");
        echo("<font size=\"2\"><strong>$currentPAN</strong></font>");
        echo("<p></p>");

        foreach($result as $row) {
          echo("<input type=\"checkbox\" name=\"device_info[]\" value=\"{$row['snum']}#{$row['manuf']}#{$row['start']}\"/>
            <font size=\"2.5\"><strong>Serial Number</strong></font>: {$row['snum']}
            / <font size=\"2.5\"><strong>Manufacturer</strong></font>: {$row['manuf']}<br/>");
        }

        echo("<p><input type=\"submit\" value=\"Submit\"/></p>");
      }
    }
  }

  $_SESSION['s_previousPAN'] = $previousPAN;
  $_SESSION['s_currentPAN'] = $currentPAN;

  $connection = null;
?>
    </form>
    </font>
  </body>
</html>
