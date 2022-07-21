<link rel="stylesheet" href="<?= $host_name ?>/public/css/OT_request.css">
<link rel="stylesheet" href="<?= $host_name ?>/public/css/myLeave.css" />
<div class="content">
    <div class="content__heading">
        <h1>OT request</h1>
        <button class="new-rq btn">new request OT</button>
    </div>
    <!-- <div class="content__body">
        <img src="<?= $host_name ?>/public/img/image/oh crap.png" width="420" height="300" alt="">
        <p>you don't have any OT request. you can create a new one!</p>
    </div> -->
    <div class="content__body">
                <div class="history">
                    <div class="header">
                        <h4></h4>
                        <div class="header-page">
                            <i class="fa-solid fa-angle-left"></i>
                            <span>1/1</span>
                            <i class="fa-solid fa-angle-right"></i>
                        </div>
                    </div>
                    <table style="background-color: white" id="history">
                        <tr>
                            <th>OTRequest_ID</th>
                            <th>Total Hours</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Status</th>
                            <th>date created</th>
                            <th>manager id</th>
                            <th>rejected reason (if any)</th>
                            <th>action</th>
                        </tr>
                        <tr>
                            <td>1234</td>
                            <td>annual leave</td>
                            <td>2022-07-10 09:15:00</td>
                            <td>2022-07-10 09:15:00</td>
                            <td class="pending">pending</td>
                            <td>01/07/2022</td>
                            <td>1256</td>
                            <td>none</td>
                            <td class="action-area">
                                <i
                                    class="fa-solid fa-trash-can js-trash js-del-re"
                                ></i>
                                <i class="fa-solid fa-pen js-fix"></i>
                            </td>
                        </tr>
                        <tr>
                            <td>1234</td>
                            <td>annual leave</td>
                            <td>2022-07-10 09:15:00</td>
                            <td>2022-07-10 09:15:00</td>
                            <td class="rejected">rejected</td>
                            <td>01/07/2022</td>
                            <td>1256</td>
                            <td>none</td>
                            <td class="action-area">
                                <i
                                    class="fa-solid fa-trash-can js-trash js-del-re"
                                ></i>
                                <i class="fa-solid fa-pen js-fix"></i>
                            </td>
                        </tr>
                        <tr>
                            <td>1234</td>
                            <td>annual leave</td>
                            <td>2022-07-10 09:15:00</td>
                            <td>2022-07-10 09:15:00</td>
                            <td class="approved">approved</td>
                            <td>01/07/2022</td>
                            <td>1256</td>
                            <td>none</td>
                            <td class="action-area">
                                <i
                                    class="fa-solid fa-trash-can js-trash js-del-re"
                                ></i>
                                <i class="fa-solid fa-pen js-fix"></i>
                            </td>
                        </tr>
                        <tr>
                            <td>1234</td>
                            <td>annual leave</td>
                            <td>2022-07-10 09:15:00</td>
                            <td>2022-07-10 09:15:00</td>
                            <td class="draft">draft</td>
                            <td>01/07/2022</td>
                            <td>1256</td>
                            <td>none</td>
                            <td class="action-area">
                                <i
                                    class="fa-solid fa-trash-can js-trash js-del-re"
                                ></i>
                                <i class="fa-solid fa-pen js-fix"></i>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
</div>

<?php 
    require_once "./src/views/content/UC002/modal.php"
?>

<script src="<?= $host_name ?>/public/js/ot_request.js"></script>