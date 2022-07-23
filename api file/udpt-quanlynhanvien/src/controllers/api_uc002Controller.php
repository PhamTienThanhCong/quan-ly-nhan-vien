<?php
    class api_uc002Controller extends Controllers {
        public function index() {

        }
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
        // API 1: Thêm một thông tin request OT
        public function create_ot() {
            $summary            = "Create New Request OT";
            $EMPLOYEE_ID        = 15;
            $MANAGER_ID         = 6;
            $REASON             = "Need OT to earn more money";
            $UPDATE_DATE        = "2022-07-18 23:00:00";
            $STATUS             = "Draft";
            $MANAGER_COMMENT    = null;
            $START_DATE         = "2022-08-01";
            $ESTIMATED_HOURS    = 8;
            $END_DATE           = "2022-08-02";
            $UNSUBMIT_REASON    = null;
            $NOTIFICATION_FLAG  = true;

            $OTRequestDetails = [
                [
                    "DATE"      => "2022-08-01",
                    "HOUR"      => 4
                ],
                [
                    "DATE"      => "2022-08-02",
                    "HOUR"      => 4
                ]
            ];
            
            $model  = $this->model('ot_requestModel');

            $ROT_ID = $model->createOT($EMPLOYEE_ID, $MANAGER_ID, $REASON, $UPDATE_DATE, $STATUS, $MANAGER_COMMENT, $START_DATE, $ESTIMATED_HOURS, $END_DATE, $UNSUBMIT_REASON, $NOTIFICATION_FLAG);
            
            if ($ROT_ID != 0){
                if ($model->createOtDetail($ROT_ID, $OTRequestDetails)){
                    echo $this->data_export(200,"OT Request Created Successfully", $summary, null, true);
                }else{
                    echo $this->data_export(400,"Missing Required Information", $summary, null, false);
                }
            }else{
                echo $this->data_export(400,"Missing Required Information", $summary, null, false);
            }
        }
        
        // API 2: Sửa một thông tin request OT Canceled
        public function Canceled_request_ot($data = []){
            $model   = $this->model('ot_requestModel');
            $summary = "Unsubmit Employee’s Request OT Information";

            $EMPLOYEE_ID        = 15;
            // $UNSUBMIT_REASON    = $_POST['UNSUBMIT_REASON'];
            $UNSUBMIT_REASON    = "em có bầu rồi";
            $STATUS             = "Canceled";

            if (isset($data[0])){
                $id = $data[0];
            }else{
                echo $this->data_export(400,"Missing Required Information", $summary, null, false);
                exit();
            }

            if ($model->Canceled_request_ot($id,$EMPLOYEE_ID, $UNSUBMIT_REASON, $STATUS)){
                echo $this->data_export(200,"Unsubmit Employee’s OT Information Successfully", $summary, null, true);
            }else{
                echo $this->data_export(405,"Unable to update Employee’s request OT with id $id", $summary, null, false);
            }

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