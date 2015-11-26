<html>
  <head>
    <title>Patient Records</title>
  </head>
  <body>
    <font face="Helvetica">
    <h3><a href="index.html"><font color="#ff6666">Home</font></a></h3>
    <h3><a href="patient_records.php"><font color="#66b2ff">Acess Patient Records</font></a></h3>
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

  $sql = "SELECT Patient.name, Patient.number
          FROM Patient
          WHERE Patient.name like '%$name%'
          ORDER BY Patient.name";

  $result = $connection->query($sql);
  if ($result == FALSE) {
    $info = $connection->errorInfo();
    echo("<p>Error: {$info[2]}</p>");
    exit();
  }

  if($result->rowCount() == 0) {
    echo("No patients named <strong>$name</strong> were found");
  }

  else {
    echo("Displaying results for patients named <strong>$name</strong>:");
    echo("<p></p>");
    echo("<table border=\"0\" cellspacing=\"10\">\n");
    echo("<col width=\"170\"><col width=\"100\"><col width=\"120\">");
    echo("<tr><th>Name</th><th>Number</th></tr>");
    foreach($result as $row) {
      echo("<tr>\n");
      echo("<td align=\"center\">{$row['name']}</td>\n");
      echo("<td align=\"center\">{$row['number']}</td>\n");
      echo("<td align=\"center\"><a href=\"records.php?number=");
      echo($row['number']);
      echo("&name=");
      echo($row['name']);
      echo("\"><font color=\"#007fff\">Show records</font></a></td>\n");
      echo("</tr>\n");
    }
    echo("</table>");
  }

  $connection = null;
?>
    </font>
  </body>
</html>
