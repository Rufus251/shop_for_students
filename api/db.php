<?php
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "shop_bd";

$connection = new mysqli($servername, $username, $password, $dbname);

if (isset($connection->connect_error)) {
    die("connection failed: ".$connection->connect_error);
}