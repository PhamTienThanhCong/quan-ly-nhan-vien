var page = 0;
var all_page = 0;
var data_history = [];

function call_data_My_PA_Goal() {
var settings = setting_ajax();

  $.ajax(settings).done(function (response) {
    console.log(response);
    data_history = response.data;
    all_page = Math.ceil(response.total_records / 5);
    page_check();
    render_data(data_history);
  });
}

$(document).ready(function () {
    call_data_My_PA_Goal();
});