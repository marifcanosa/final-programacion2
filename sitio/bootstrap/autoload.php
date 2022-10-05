<?php
spl_autoload_register(function($className) {

    $className = substr($className, 8);
    $filename = __DIR__ . '/../classes/' . $className . '.php';

    if(file_exists($filename)) {
        require_once $filename;
    }
});