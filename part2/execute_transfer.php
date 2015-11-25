<?php session_start(); ?>
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

  $snum = array();
  $manuf = array();
  $start = array();

  foreach ($_REQUEST as $info => $value) { // $_REQUEST is an associative array (key => value)
    if ($info == 'device_info') {
      foreach($_REQUEST[$info] as $device_info) {
        $device_info_pieces = explode("#", $device_info);
        $snum[] = $device_info_pieces[0]; // snum
        $manuf[] = $device_info_pieces[1]; // manuf
        $start[] = $device_info_pieces[2]; // start
      }
    }
    else {
      $info = $value;
    }
  }

  echo("<p><font size=\"2\">Patient Name: <strong>"."{$_SESSION['s_pname']}"."</strong></font></p>");
  echo("<p><font size=\"2\">Patient Number: <strong>"."{$_SESSION['s_pnum']}"."</strong></font></p>");
  echo("<p><font size=\"2\">Current PAN: <strong>"."{$_SESSION['s_currentPAN']}"."</strong></font></p>");
  echo("<p><font size=\"2\">Previous PAN: <strong>"."{$_SESSION['s_previousPAN']}"."</strong></font></p>");

  if(empty($snum)) {
    echo("No transferable devices were selected");
  }

  else {
    for ($i = 0; $i < count($snum); $i++) {
      $sql = "SELECT Period.start, Period.end
              FROM Period
              WHERE Period.start = '$start[$i]'
                AND Period.end = NOW()"; // verificar se o periodo ja existe na tabela, se sim entao saltar o insert
      $result = $connection->query($sql);
      if ($result == FALSE) {
        $info = $connection->errorInfo();
        echo("<p>Error: {$info[2]}</p>");
        exit();
      }

      if($result->rowCount() == 0) { // significa que o periodo nao existe e tem de ser inserido na tabela
        $sql = "INSERT INTO Period VALUES ('$start[$i]', NOW())"; // para desligar o device da previous PAN
        $result = $connection->query($sql);
        if ($result == FALSE) {
          $info = $connection->errorInfo();
          echo("<p>Error: {$info[2]}</p>");
          exit();
        }
      }

      $sql = "UPDATE Connects SET end = NOW()
              WHERE snum = '$snum[$i]'
                AND manuf = '$manuf[$i]'
                AND end = '2999-12-31 00:00:00'";
      $result = $connection->query($sql);
      if ($result == FALSE) {
        $info = $connection->errorInfo();
        echo("<p>Error: {$info[2]}</p>");
        exit();
      }

      $sql = "SELECT Period.start, Period.end
              FROM Period
              WHERE Period.start = DATE_ADD(NOW(), INTERVAL 1 SECOND)
                AND Period.end = '2999-12-31 00:00:00'"; // verificar se o periodo ja existe na tabela, se sim entao saltar o insert
      $result = $connection->query($sql);
      if ($result == FALSE) {
        $info = $connection->errorInfo();
        echo("<p>Error: {$info[2]}</p>");
        exit();
      }

      if($result->rowCount() == 0) { // significa que o periodo nao existe e tem de ser inserido na tabela
        $sql = "INSERT INTO Period VALUES (DATE_ADD(NOW(), INTERVAL 1 SECOND), '2999-12-31 00:00:00')"; // para ligar o device a current PAN
        $result = $connection->query($sql);
        if ($result == FALSE) {
          $info = $connection->errorInfo();
          echo("<p>Error: {$info[2]}</p>");
          exit();
        }
      }

      $sql = "INSERT INTO Connects VALUES(DATE_ADD(NOW(), INTERVAL 1 SECOND), '2999-12-31 00:00:00', '$snum[$i]', '$manuf[$i]', '{$_SESSION['s_currentPAN']}')";
      $result = $connection->query($sql);
      if ($result == FALSE) {
        $info = $connection->errorInfo();
        echo("<p>Error: {$info[2]}</p>");
        echo("Error in transfering devices from PAN ");
        echo("<font size=\"2\"><strong>"."{$_SESSION['s_previousPAN']}"."</strong></font>");
        echo(" to PAN ");
        echo("<font size=\"2\"><strong>"."{$_SESSION['s_currentPAN']}"."</strong></font>");
        echo("<p></p>");
        exit();
      }
    }
    echo("<p>Update successful!</p>");

    $sql = "SELECT Connects.snum, Connects.manuf
            FROM Connects
            WHERE Connects.end = '2999-12-31 00:00:00'
              AND Connects.pan = '{$_SESSION['s_currentPAN']}'";

    $result = $connection->query($sql);
    if ($result == FALSE) {
      $info = $connection->errorInfo();
      echo("<p>Error: {$info[2]}</p>");
      exit();
    }

    echo("<table border=\"1\">");
    echo("<caption><strong>Current State of the Patient's PAN</strong></caption>");

    echo("<col width=\"170\"><col width=\"170\">");
    echo("<tr><th>Device Serial No.</th><th>Device Manufacturer</th></tr>");
    foreach($result as $row) {
      echo("<tr><td align=\"center\">");
      echo($row['snum']);
      echo("</td><td align=\"center\">");
      echo($row['manuf']);
      echo("</td></tr>");
    }
    echo("</table>");
  }

  session_unset(); // remove all session variables

  session_destroy(); // destroy the session

  $connection = null;
?>
    </font>
  </body>
</html>
