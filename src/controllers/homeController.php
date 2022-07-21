<?php
    class homeController extends Controllers{
        public function index(){
            $this->view("home","form",[]);
        }
        public function main_uc(){
            $this->view("main","main/main",[]);
        }
        public function pa_manage(){
            $this->view("main","main/pa_manage",[]);
        }public function leave_manage(){
            $this->view("main","main/leave_manage",[]);
        }
        public function sign_in(){

        }
        public function sign_out(){
            session_destroy();
            header("Location: " . $this->host_name );
        }
    }
?>