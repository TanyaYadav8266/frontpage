<?php
define('DB_SERVER','mysql'); // Change to 'mysql' (service name in docker-compose.yml)
define('DB_USER','root');
define('DB_PASS' ,'rootpassword'); // Match with docker-compose.yml
define('DB_NAME','frontpage');

$con = mysqli_connect(DB_SERVER,DB_USER,DB_PASS,DB_NAME);

// Check connection
if (mysqli_connect_errno()) {
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
} else {
    echo "Connected to MySQL successfully!";
}
?>
