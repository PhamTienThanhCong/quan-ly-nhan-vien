<?php
    class api_uc002Controller extends Controllers {
        public function data_export($status, $message, $messageDetail, $data, $success) {
            $arr = [
                "status"        => $status, 
                "message"       => $message,
                "messageDetail" => $messageDetail,
                "data"          => $data,
                "success"       => $success,
            ];
            return json_encode($arr);
        }
        public function index() {
            $model = $this->model('ot_requestModel');
            
            $ot_requests = $model->getOneRequestOt(11);

            if ($ot_requests != []){
                echo $this->data_export(200,"An Employee’s OT Request Have Been Found", "Retrieve the information of the OT Request of Employee by id request", $ot_requests, true);
            }else{
                echo $this->data_export(404,"OT Request Information Not Found", "Retrieve the information of the OT Request of Employee by id request", null, false);
            }
        }
        public function create_ot() {
            
        }
        public function un_create_ot() {
            
        }
        public function edit_ot() {
            
        }
        public function destroy_ot() {
            
        }
        public function view_all_ot() {
            
        }
        // API 7 Xem một thông tin OT Request bất kỳ
        public function ot_requests($data = []) {
            $model = $this->model('ot_requestModel');
            if (isset($data[0])){
                $ot_requests = $model->getOneRequestOt($data[0]);
            }else{
                $ot_requests = [];
            }

            if ($ot_requests != []){
                echo $this->data_export(200,"An Employee’s OT Request Have Been Found", "Retrieve the information of the OT Request of Employee by id request", $ot_requests, true);
            }else{
                echo $this->data_export(404,"OT Request Information Not Found", "Retrieve the information of the OT Request of Employee by id request", null, false);
            }
        }
    }