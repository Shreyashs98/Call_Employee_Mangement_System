<?php
    include '../../includes/dbconn.php';

    $sql = "SELECT id from leaves WHERE Status = '2'";
    $query = $dbh -> prepare($sql);
    $query->execute();
    $results=$query->fetchAll(PDO::FETCH_OBJ);
    $leavtypcount=$query->rowCount();

    echo htmlentities($leavtypcount);

?>   