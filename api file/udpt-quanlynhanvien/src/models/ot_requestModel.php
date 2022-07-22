<?php 
class ot_requestModel extends ConnectDB{
    // Xem một thông tin OT Request bất kỳ
    public function getOneRequestOt($ROT_ID){
        $sql = "SELECT * FROM `request ot` WHERE `ROT_ID` = '$ROT_ID'";
        $data = mysqli_query($this->connection, $sql);
        $data = mysqli_fetch_array($data);
        
        if (isset($data['ROT_ID'])){
            $ot_request = [
                "ROT_ID"    => $data["ROT_ID"],
                "EMPLOYEE_ID" => $data["EMPLOYEE_ID"],
                "MANAGER_ID" => $data["MANAGER_ID"],
                "REASON"    => $data["REASON"],
                "CREATE_DATE"=>$data["CREATE_DATE"],
                "UPDATE_DATE"=>$data["UPDATE_DATE"],
                "STATUS" => $data["STATUS"],
                "MANAGER_COMMENT" => $data["MANAGER_COMMENT"],
                "START_DATE"    => $data["START_DATE"],
                "ESTIMATED_HOURS"=> $data["ESTIMATED_HOURS"],
                "END_DATE" => $data["END_DATE"],
                "UNSUBMIT_REASON" => $data["UNSUBMIT_REASON"],
                "NOTIFICATION_FLAG" => $data["NOTIFICATION_FLAG"],
                "OTRequestDetails" =>$this->get_request_ot_detail($ROT_ID),
            ];
            return $ot_request;
        }else{
            return [];
        }    
    }
    public function get_request_ot_detail($ROT_ID){
        $sql = "SELECT * FROM `request ot detail` WHERE `ROT_ID` = '$ROT_ID'";
        $data = mysqli_query($this->connection, $sql);
        $ot_request = [];
        foreach($data as $index=>$d){
            $ot_request[$index] = [
                "ROT_ID" => $d["ROT_ID"],
                "DATE"   => $d["DATE"],
                "HOUR"   => $d["HOUR"],
            ];
        }
        return $ot_request;
    }
}