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
  ini_set('display_errors', 'On');
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
    $sql = "CREATE TABLE tableBeforePAN(snum numeric(8,0), manuf varchar(255))";
    $result = $connection->query($sql);
    if ($result == FALSE) {
      $info = $connection->errorInfo();
      echo("<p>Error: {$info[2]}</p>");
      exit();
    }

    $sql = "INSERT INTO tableBeforePAN (snum, manuf)
            SELECT Connects.snum, Connects.manuf
            FROM Connects
            WHERE Connects.end = '2999-12-31 00:00:00'
              AND Connects.pan = '{$_SESSION['s_currentPAN']}'";
    $result = $connection->query($sql);
    if ($result == FALSE) {
      $info = $connection->errorInfo();
      echo("<p>Error: {$info[2]}</p>");
      exit();
    }

    $sql = "SELECT * FROM tableBeforePAN";
    $result = $connection->query($sql);
    if ($result == FALSE) {
      $info = $connection->errorInfo();
      echo("<p>Error: {$info[2]}</p>");
      exit();
    }

    echo("<table border=\"1\">");
    echo("<caption><strong>Previous State of the Patient's PAN</strong></caption>");

    if($result->rowCount() == 0) {
        echo("<col width=\"400\">");
        echo("<tr><td align=\"center\">");
        echo("No devices connected to this PAN before transfer");
        echo("</td></tr>");
    }

    else {
        echo("<col width=\"170\"><col width=\"170\">");
        echo("<tr><th>Device Serial No.</th><th>Device Manufacturer</th></tr>");
        foreach($result as $row) {
          echo("<tr><td align=\"center\">");
          echo($row['snum']);
          echo("</td><td align=\"center\">");
          echo($row['manuf']);
          echo("</td></tr>");
        }
    }

    echo("</table>");

    for ($i = 0; $i < count($snum); $i++) {
      $now = new DateTime();
      $nowFormatted = $now->format('Y-m-d H:i:s');
      $sql = "SELECT Period.start, Period.end
              FROM Period
              WHERE Period.start = '$start[$i]'
                AND Period.end = '$nowFormatted'"; // verificar se o periodo ja existe na tabela, se sim entao saltar o insert
      $result = $connection->query($sql);
      if ($result == FALSE) {
        $info = $connection->errorInfo();
        echo("<p>Error: {$info[2]}</p>");
        exit();
      }

      if($result->rowCount() == 0) { // significa que o periodo nao existe e tem de ser inserido na tabela
        $sql = "INSERT INTO Period VALUES ('$start[$i]', '$nowFormatted')"; // para desligar o device da previous PAN
        $result = $connection->query($sql);
        if ($result == FALSE) {
          $info = $connection->errorInfo();
          echo("<p>Error: {$info[2]}</p>");
          exit();
        }
      }

      $sql = "UPDATE Connects SET end = '$nowFormatted'
              WHERE snum = '$snum[$i]'
                AND manuf = '$manuf[$i]'
                AND end = '2999-12-31 00:00:00'";
      $result = $connection->query($sql);
      if ($result == FALSE) {
        $info = $connection->errorInfo();
        echo("<p>Error: {$info[2]}</p>");
        exit();
      }

      $nowplusone = $now->add(new DateInterval('PT1S'));
      $nowplusoneFormatted = $nowplusone->format('Y-m-d H:i:s');
      $sql = "SELECT Period.start, Period.end
              FROM Period
              WHERE Period.start = '$nowplusoneFormatted'
                AND Period.end = '2999-12-31 00:00:00'"; // verificar se o periodo ja existe na tabela, se sim entao saltar o insert
      $result = $connection->query($sql);
      if ($result == FALSE) {
        $info = $connection->errorInfo();
        echo("<p>Error: {$info[2]}</p>");
        exit();
      }

      if($result->rowCount() == 0) { // significa que o periodo nao existe e tem de ser inserido na tabela
        $sql = "INSERT INTO Period VALUES ('$nowplusoneFormatted', '2999-12-31 00:00:00')"; // para ligar o device a current PAN
        $result = $connection->query($sql);
        if ($result == FALSE) {
          $info = $connection->errorInfo();
          echo("<p>Error: {$info[2]}</p>");
          exit();
        }
      }

      $sql = "INSERT INTO Connects VALUES('$nowplusoneFormatted', '2999-12-31 00:00:00', '$snum[$i]', '$manuf[$i]', '{$_SESSION['s_currentPAN']}')";
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

    $sql = "CREATE TABLE tableAfterPAN(snum numeric(8,0), manuf varchar(255))";
    $result = $connection->query($sql);
    if ($result == FALSE) {
      $info = $connection->errorInfo();
      echo("<p>Error: {$info[2]}</p>");
      exit();
    }

    $sql = "INSERT INTO tableAfterPAN (snum, manuf)
            SELECT Connects.snum, Connects.manuf
            FROM Connects
            WHERE Connects.end = '2999-12-31 00:00:00'
              AND Connects.pan = '{$_SESSION['s_currentPAN']}'";

    $result = $connection->query($sql);
    if ($result == FALSE) {
      $info = $connection->errorInfo();
      echo("<p>Error: {$info[2]}</p>");
      exit();
    }

    $sql = "SELECT * FROM tableAfterPAN";
    $result = $connection->query($sql);
    if ($result == FALSE) {
      $info = $connection->errorInfo();
      echo("<p>Error: {$info[2]}</p>");
      exit();
    }

    $sql = "SELECT DISTINCT snum, manuf
            FROM tableAfterPAN
            WHERE (snum, manuf) NOT IN (SELECT DISTINCT snum, manuf from tableBeforePAN)"; // devices que foram inseridos
    $result = $connection->query($sql);
    if ($result == FALSE) {
      $info = $connection->errorInfo();
      echo("<p>Error: {$info[2]}</p>");
      exit();
    }

    echo("<table border=\"1\">");
    echo("<caption><strong>Current State of the Patient's PAN</caption>");

    echo("<col width=\"170\"><col width=\"170\">");
    echo("<tr><th>Device Serial No.</th><th>Device Manufacturer</th></tr>");
    foreach($result as $row) {
      echo("<tr><td align=\"center\"><font color=\"#4d9933\">");
      echo($row['snum']);
      echo("</font></td><td align=\"center\"><font color=\"#4d9933\">");
      echo($row['manuf']);
      echo("</font></td></tr>");
    }

    $sql = "SELECT * FROM tableBeforePAN"; // devices que ja estavam na PAN antes da transferencia
    $result = $connection->query($sql);
    if ($result == FALSE) {
      $info = $connection->errorInfo();
      echo("<p>Error: {$info[2]}</p>");
      exit();
    }

    foreach($result as $row) {
      echo("<tr><td align=\"center\">");
      echo($row['snum']);
      echo("</td><td align=\"center\">");
      echo($row['manuf']);
      echo("</td></tr>");
    }

    echo("</table>");

    $sql = "DROP TABLE IF EXISTS tableBeforePAN";
    $result = $connection->query($sql);
    if ($result == FALSE) {
      $info = $connection->errorInfo();
      echo("<p>Error: {$info[2]}</p>");
      exit();
    }

    $sql = "DROP TABLE IF EXISTS tableAfterPAN";
    $result = $connection->query($sql);
    if ($result == FALSE) {
      $info = $connection->errorInfo();
      echo("<p>Error: {$info[2]}</p>");
      exit();
    }
  }

  session_destroy();

  $connection = null;
?>
    </font>
  </body>
</html>
