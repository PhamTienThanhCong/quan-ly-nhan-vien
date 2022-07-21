<?php 
    class authModel extends ConnectDB{
        public function login($username, $password){
            $sql = "SELECT * FROM `employee` WHERE `USERNAME` = '$username' AND `PASSWORD` = '$password'";
            $user = mysqli_query($this->connection, $sql);
            
            $user = mysqli_fetch_array($user);

            if (isset($user['EMPLOYEE_ID'])){
                $_SESSION['id']     = $user['EMPLOYEE_ID'];
                $_SESSION['name']   = $user['USERNAME'];
                $_SESSION['avatar'] = $user['AVATAR_URL'];
                $_SESSION['role']   = $user['ROLE'];
                return true;
            }else{
                return false;
            }
        }
    }