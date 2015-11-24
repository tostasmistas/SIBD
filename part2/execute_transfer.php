<? php session_start(); ?>
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

  foreach ($_REQUEST as $info => $value) { //$_REQUEST is an associative array (key => value)
    if ($info == 'device_info') {
      foreach($_REQUEST[$info] as $device_info) {
        $device_info_pieces = explode("#", $device_info);
        $snum[] = $device_info_pieces[0]; //snum
        $manuf[] = $device_info_pieces[1]; //manuf
      }
    }
    else {
      $info = $value;
    }
  }

  if(empty($snum)) {
    echo("No transferable devices were selected");
  }

  print_r($_SESSION);

  /*$balance = $_REQUEST['balance'];
  $sql = "UPDATE account SET balance = $balance WHERE account_number =
  '$account_number'";
  echo("<p>$sql</p>");
  $nrows = $connection->exec($sql);
  echo("<p>Rows updated: $nrows</p>");

  session_unset(); // remove all session variables

  session_destroy(); // destroy the session

  $connection = null;*/
?>
    </font>
  </body>
</html>
