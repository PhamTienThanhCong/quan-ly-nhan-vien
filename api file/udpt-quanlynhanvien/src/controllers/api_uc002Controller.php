<?php
    class api_uc002Controller extends Controllers {
        public function data_export($status, $message, $messageDetail, $data, $success) {
            $arr = [
                "status"        => $status, 
                "message"       => $message,
                "summary" => $messageDetail,
                "data"          => $data,
                "success"       => $success,
            ];
            return json_encode($arr);
        }
        public function index() {

        }
        public function create_ot() {
            
        }
        public function un_create_ot() {
            
        }
        public function edit_ot() {
            
        }
        // API 5: Xem danh sách các thông tin chi tiết trong 1 request OT bất kỳ (có phân trang)
        public function ot_request_details($data = []) {
            $summary = "Get Employee’s Request OT Information Detail Of Specified Request OT Sort By DATE DESC AND PAGINATE";
            
            if (isset($data[0])){
                $ot_request_id = $data[0];
            }else{
                echo $this->data_export(404,"Request OT Not Found", $summary, null, false);
                exit();
            }

            $limit = 20;
            $offset = 0;
            $order_column = "date";
            $sort_by = "asc";

            if (isset($_GET['limit'])){
                $limit = $_GET['limit'];
            }
            if (isset($_GET['offset'])){
                $offset = $_GET['offset'];
            }
            if (isset($_GET['sort_by'])){
                $order_column = $_GET['sort_by'];
                if ($order_column[0] == '-'){
                    $sort_by = "desc";
                }
                $order_column = substr($order_column, 1);
            }
            $model               = $this->model('ot_requestModel');
            $ot_request_details  = $model->get_all_ot_request_details($ot_request_id, $limit, $offset, $order_column, $sort_by);

            $resultset = [
                "resultset" => [
                    "count"         => $model->count_data('request ot detail'),
                    "offset"        => $offset,
                    "limit"         => $limit,
                    "order_column"  => $order_column,
                    "sort_by"       => $sort_by,
                ]
            ];

            $information_requests = [
                "value"     => $ot_request_details,
                "metadata" => $resultset,
            ];

            if ($ot_request_details != []){
                echo $this->data_export(200,"Request OT Details Of Request OT With Id 1 Have Been Found", $summary, $information_requests, false);
            }else{
                echo $this->data_export(404,"Request OT Not Found", $summary, null, false);
            }
        }
        // API 6: Lấy danh sách các request OT hiện có (có phân trang)
        // http://localhost/udpt-quanlynhanvien/api_uc002/ot_requests&limit=5&offset=2&sort_by=-create_date
        public function ot_requests() {
            $summary = "Get All Employee’s Request OT Information Sort By CREATE_DATE DESC AND PAGINATE";
            $limit = 2;
            $offset = 0;
            $order_column = "CREATE_DATE";
            $sort_by = "asc";

            if (isset($_GET['limit'])){
                $limit = $_GET['limit'];
            }
            if (isset($_GET['offset'])){
                $offset = $_GET['offset'];
            }
            if (isset($_GET['sort_by'])){
                $order_column = $_GET['sort_by'];
                if ($order_column[0] == '-'){
                    $sort_by = "desc";
                }
                $order_column = substr($order_column, 1);
            }

            $model        = $this->model('ot_requestModel');
            $ot_requests  = $model->get_all_information_request($limit, $offset, $order_column, $sort_by);

            $resultset = [
                "resultset" => [
                    "count"         => $model->count_data('request ot'),
                    "offset"        => $offset,
                    "limit"         => $limit,
                    "order_column"  => $order_column,
                    "sort_by"       => $sort_by,
                ]
            ];

            $information_requests = [
                "value"     => $ot_requests,
                "metadata" => $resultset,
            ];
            if ($ot_requests != []){
                echo $this->data_export(200,"Employee’s Request OTs Have Been Found", $summary, $information_requests, false);
            }else{
                echo $this->data_export(404,"Request OT Not Found", $summary, null, false);
            }
        }
        // API 7 Xem một thông tin OT Request bất kỳ
        public function ot_request($data = []) {
            $model = $this->model('ot_requestModel');
            if (isset($data[0])){
                $ot_requests = $model->getOneRequestOt($data[0]);
            }else{
                $ot_requests = [];
            }

            if ($ot_requests != []){
                echo $this->data_export(200,"An Employee’s OT Request Have Been Found", "Get A Specified Employee’s OT Request", $ot_requests, true);
            }else{
                echo $this->data_export(404,"OT Request Information Not Found", "Get A Specified Employee’s OT Request", null, false);
            }
        }
    }