<html>
  <body>
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

  $number = $_REQUEST['number'];

  /* data for the readings */
  $sql = "SELECT Reading.datetime, Reading.snum, Reading.manuf,
          FROM Patient, Wears, Connects, Reading, Setting
          WHERE Wears.patient = '$number'"
            AND Wears.pan = Connects.pan
            AND Connects.snum = Reading.snum
            AND Connects.manuf = Reading.manuf;

  echo("<p>$sql</p>");

  $nrows = $connection->exec($sql);

  echo("<p>Rows deleted: $nrows</p>");
  $connection = null;
?>
  </body>
</html>
