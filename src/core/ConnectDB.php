<?php
    class ConnectDB{
        protected $connection;
        private $hostname = 'localhost';
        private $user = 'root';
        private $password = '';
        private $nameDB = 'quan-ly-nhan-vien';
        
        function __construct(){
            $this->connection = mysqli_connect("$this->hostname","$this->user","$this->password","$this->nameDB");
            mysqli_set_charset($this->connection,'utf8');
        }
    }
?>