<?php
$host = "localhost";
$dbname = "id18265188_foxhound";
$user = "id18265188_xof";
$pass = "Dernierparadis7&";

try {
    $db = new PDO("mysql:host=$host; dbname=$dbname", $user, $pass);
    echo "Connected";

} catch (\Throwable $th){
echo "Error: ".$th->getMessage();
}
?>