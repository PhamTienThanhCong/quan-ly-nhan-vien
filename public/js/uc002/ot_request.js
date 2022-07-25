const root = document.getElementById('root');
var type = "EMPLOYEE_ID";
var url_get = api_uc002 + `/ot_requests&${type}=${id_user}`
var new_data = [];
var OTRequest_ID = 0;
const formRequest = document.getElementById('form-post-request');

var data_request_ot = [];
function generate_data(data = []){
    root.innerHTML = `
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
        </table> 
    </div>`;
    for (var i = 0; i < data.length; i++){
        document.getElementById('history').innerHTML += `
        <tr>
            <td>${data[i].id}</td>
            <td>${data[i].ESTIMATED_HOURS}</td>
            <td>${data[i].START_DATE}</td>
            <td>${data[i].END_DATE}</td>
            <td class="${data[i].STATUS}">${data[i].STATUS}</td>
            <td>${data[i].CREATE_DATE}</td>
            <td>${data[i].MANAGER_ID}</td>
            <td>${data[i].MANAGER_COMMENT}</td>
            <td class="action-area">
                <i onclick="delete_ot_request('${data[i].id}', '${data[i].STATUS}')" class="fa-solid fa-trash-can js-trash js-del-re"></i>
                <i onclick="edit_ot_request(${data[i].id},'${data[i].STATUS}')" class="fa-solid fa-pen js-fix"></i>
            </td>
        </tr>
        `;
    }
}

function edit_ot_request(id, status){
    var url_get = `${api_uc002}/ot_request/${id}`;
    if (status == "Draft" || status == "Pending"){
        $.ajax({
            type: "GET",
            url: url_get,
            data: "data",
            dataType: "json",
            success: function (response) {
                if (response.success) {
                    new_data = response.data;
                    update_profile_manager(new_data.MANAGER_ID);
                    update_info_request_ot(new_data);
                    insert_request_ot_detail(new_data.OTRequestDetails);
                    document.getElementById('submit-btn-text').innerHTML = "Unsubmit";
                    document.getElementById('OTRequest_ID').value = id;
                    modal_new_rq.classList.add('open');
                }
            }
        });
    }else{
        showError("You CAN ONLY edit OT request that has status is Draft or Pending");
    }
}

function delete_an_request_ot(id){
    var url_get = `${api_uc002}/destroy_request_ot/${id}`;
    console.log(url_get);
    $.ajax({
        type: "GET",
        url: url_get,
        dataType: "json",
        success: function (response) {
            if (response.success){
                generate_data_from_request();
            }
        }
    });
}

function generate_data_from_request(){
    $.ajax({
        type: "GET",
        url: url_get,
        data: "data",
        dataType: "json",
        success: function (response) {
            data_request_ot = response;
            if (data_request_ot.success) {
                generate_data(data_request_ot.data.value);
            }else{
                root.innerHTML = `
                    <img src="${host_name}/public/img/image/oh crap.png" width="420" height="300" alt="">
                    <p>you don't have any OT request. you can create a new one!</p>
                `;
            }
        }
    });
}

$(document).ready(function () {
    generate_data_from_request();
});

formRequest.addEventListener('submit', function (e) {
    e.preventDefault();
    var id = document.getElementById('OTRequest_ID').value;
    var values = $(this).serialize();
    if (id == 0){
        var url_post = `${api_uc002}/create_ot`;
        $.ajax({
            type: "POST",
            url: url_post,
            data: values,
            dataType: "json",
            success: function (response) {
                if (response.success) {
                    generate_data_from_request();
                    showNotification("Submit successfully", "Congratulations! You submit the OT request successfully. You can go back to main to see the request.");
                }
            }
        });
    }else{
        var url_post = `${api_uc002}/edit_request_ot/${id}`;
        $.ajax({
            type: "POST",
            url: url_post,
            data: values,
            dataType: "json",
            success: function (response) {
                generate_data_from_request();
            }
        });
    }
});