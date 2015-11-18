<html>
  <head>
    <title>Patient Records</title>
  </head>
  <body link="#ff6666">
    <font face="Helvetica">
    <form action="records.php" method="post">
      <h3><a href="index.html">Home</a></h3>
      <h3><font color="#668cff">Acess Patient Records</font></h3>
      <p>Patient Number:
        <select name="number">
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

  $sql = "SELECT number FROM Patient ORDER BY number";
  $result = $connection->query($sql);
  if ($result == FALSE) {
    $info = $connection->errorInfo();
    echo("<p>Error: {$info[2]}</p>");
    exit();
  }
  foreach($result as $row) {
    $number = $row['number'];
    echo("<option value=\"$number\">$number</option>");
  }

  $connection = null;
?>
        </select>
      <input type="submit" value="Submit"/>
      </p>
    </form>
    </font>
  </body>
</hmtl>
