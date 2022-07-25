var data_user = [];
var data_manager = [];
var table_ot = document.getElementById('table-ot-detail');
var table_count = 1;

Date.prototype.toDateInputValue = (function() {
    var local = new Date(this);
    local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
    return local.toJSON().slice(0,10);
});

function formatDate (date) {  
    return date.split("-").reverse().join("-");;
}

function user_profile_update(data, type){
    document.getElementById(`${type}_NAME`).value = data.NAME;
    document.getElementById(`${type}_EMAIL`).value = data.EMAIL;
    document.getElementById(`${type}_DEPART_NAME`).value = data.DEPART_NAME;
    document.getElementById(`${type}_ID`).value = data.EMPLOYEE_ID; 
}

function deleteAnValue(id){
    document.getElementById(`colum-${id}`).remove();
}

function update_profile_manager(id){
    var api_get_manager = host_name + `/api_auth/get_user/${id}`;
    $.ajax({
        type: "GET",
        url: api_get_manager,
        dataType: "json",
        success: function (response) {
            data_manager = response;
            if (data_manager.success) {
                user_profile_update(data_manager.data, 'MANAGER');
            }
        }
    });
}

function update_profile_user(id){
    var api_get_user = host_name + `/api_auth/get_user/${id}`;
    $.ajax({
        type: "GET",
        url: api_get_user,
        dataType: "json",
        success: function (response) {
            data_user = response;
            if (data_user.success) {
                user_profile_update(data_user.data, 'EMPLOYEE');
                update_profile_manager(data_user.data.MANAGER_ID);
            }
        }
    });
}

function update_info_request_ot(data){
    document.getElementById('start-date').value = data.START_DATE.split(' ')[0];
    document.getElementById('end-date').value = data.END_DATE;
    document.getElementById('today-date').value = data.CREATE_DATE;
    document.getElementById('estimated_hours').value = data.ESTIMATED_HOURS;
    document.getElementById('NOTIFICATION_FLAG').value = data.NOTIFICATION_FLAG;
    document.getElementById('STATUS_REQUEST').value = data.STATUS;
    document.getElementById('REASON_EMPLOYEE').value = data.REASON;
}

function reset_request_ot_detail(){
    table_ot.innerHTML = "";
    table_count = 1;
}

function insert_request_ot_detail(data){
    reset_request_ot_detail();
    for(var i=0; i < data.length; i++){
        table_ot.innerHTML += `
            <tr id="colum-${table_count}">
                <td>${formatDate(data[i].DATE)}</td>
                <td>${data[i].HOUR}</td>
                <td>
                    <i style="cursor: pointer;" onclick="deleteAnValue(${table_count})" class="fa-solid fa-trash-can"></i>
                    <i style="cursor: not-allowed;" class="fa-solid fa-pen"></i>
                </td>
                <input type="hidden" name="date-ot-${table_count}" value="${data[i].DATE}">
                <input type="hidden" name="hours-ot-${table_count}" value="${data[i].HOUR}>
            </tr>
        `
        table_count++;
    }
}

function delete_ot_request(id, status){
    if (status != "Draft"){
        showError("You CAN ONLY delete OT request that has status is Draft.");
    }else{
        showDelRequest();
        OTRequest_ID = id;
    }
}

function hoursActive(){
    var date_ot = document.getElementById('request-date').value;
    var hour_ot = document.getElementById('request-time').value;
    table_ot.innerHTML += `
    <tr id="colum-${table_count}">
            <td>${formatDate(date_ot)}</td>
            <td>${hour_ot}</td>
            <td>
                <i style="cursor: pointer;" onclick="deleteAnValue(${table_count})" class="fa-solid fa-trash-can"></i>
                <i style="cursor: not-allowed;" class="fa-solid fa-pen"></i>
            </td>
            <input type="hidden" name="date-ot-${table_count}" value="${date_ot}">
            <input type="hidden" name="hours-ot-${table_count}" value="${hour_ot}>
        </tr>
    `;
    table_count++;
    document.getElementById('request-time').value = 1;
    document.getElementById('number-ot').value = table_count;
}

document.getElementById('today-date').value = new Date().toDateInputValue();
document.getElementById('start-date').value = new Date().toDateInputValue();
document.getElementById('end-date').value = new Date().toDateInputValue();
document.getElementById('request-date').value = new Date().toDateInputValue();

$(document).ready(function () {
    update_profile_user(id_user)
});