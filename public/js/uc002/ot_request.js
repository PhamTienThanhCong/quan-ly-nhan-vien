const root = document.getElementById('root');
var type = "EMPLOYEE_ID";
var url_get = api_uc002 + `/ot_requests&${type}=${id_user}`

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
            <td class="pending">${data[i].STATUS}</td>
            <td>${data[i].CREATE_DATE}</td>
            <td>${data[i].MANAGER_ID}</td>
            <td>${data[i].MANAGER_COMMENT}</td>
            <td class="action-area">
                <i class="fa-solid fa-trash-can js-trash js-del-re"></i>
                <i onclick="edit_ot_request(${data[i].id})" class="fa-solid fa-pen js-fix"></i>
            </td>
        </tr>
        `;
    }
}

var new_data = [];
function edit_ot_request(id){
    var url_get = `${api_uc002}/ot_request/${id}`;
    $.ajax({
        type: "GET",
        url: url_get,
        data: "data",
        dataType: "json",
        success: function (response) {
            if (response.success) {
                new_data = response.data;
            }
        }
    });
}

$(document).ready(function () {
    $.ajax({
        type: "GET",
        url: url_get,
        data: "data",
        dataType: "json",
        success: function (response) {
            data_request_ot = response;
            if (data_request_ot.success == true) {
                generate_data(data_request_ot.data.value);
            }
        }
    });
});