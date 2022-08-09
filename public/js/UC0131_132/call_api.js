
function call_data_My_PA_Goal(){
    var settings = {
        "url": "http://127.0.0.1:5000/api/uc0131_132/get-pa-goals",
        "method": "POST",
        "timeout": 0,
        "headers": {
          "Content-Type": "application/json"
        },
        "data": JSON.stringify({
          "employee_id": "8",
          "status": []
        }),
      };
      
      $.ajax(settings).done(function (response) {
        console.log(response);
      });
}