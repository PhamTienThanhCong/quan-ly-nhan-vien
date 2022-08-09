<?php
    class uc0131_132Controller extends Controllers {
        public function middleware(){
            if (!isset($_SESSION['id'])){
                header("Location: " . $this->host_name);
            }
        }
        public function self_assessment(){
            $this->middleware();
            $this->view("main","UC0131_132/index",[]);
        }
        public function myPAgoal(){
            $this->middleware();
            $this->view("main","UC0131_132/myPAgoal",[]);
        }
        public function self_result(){
            $this->middleware();
            $this->view("main","UC0131_132/self_result",[]);
        }
        public function self_result_view(){
            $this->middleware();
            $this->view("main","UC0131_132/self_result_view",[]);
        }
    }
?>