<?php

$servename = "localhost";
$DBuname = "root";
$DBPass = "mysql123";
$DBname = "cs230";

$conn = mysqli_connect($servename, $DBuname, $DBPass, $DBname);  //connects to database

if (!$conn) {
    die("Connection failed...".mysqli_connect_error());
    # code...
}

