<link rel="stylesheet" href="<?= $host_name ?>/public/css/provi_feedback.css">
<div class="content"> 
    <h2>self-assessment</h2>
    <div class="feedback-func">
        <a href="<?= $host_name ?>/UC0131_132/myPAgoal" class="btn give-fb">my PA goal</a>
    </div>
    <div id="feedback-check">
        <p style="text-transform: none;">You have the self-assessment's request from the manager with deadline is <span>2022-07-15 23:00:00</span></p>
        <img src="<?= $host_name ?>/public/img/image/run_deadline.png" height="312px" width="438px" alt="">
    </div>
    <!-- <p><span>Time for your feedback is overdue. You can not give feedback anymore.</span></p>
    <img src="<?= $host_name ?>/public/img/image/overdue.png" height="300px" width="300px" alt="overdue" class="overdue"> -->
</div>

<script src="<?= $host_name ?>/public/js/UC0131_132/provi_fb.js"></script>
<script>
    var my_data;
    function call_data_My_PA_Goal() {
        var my_url = `${uc0131_132}/get-pa-goals`;
        var settings = {
                url: my_url,
                method: "POST",
                timeout: 0,
                headers: {
                "Content-Type": "application/json",
            },
                data: JSON.stringify({
                employee_id: id_user,
                page: 0,
                status: [],
            }),
        };

        $.ajax(settings).done(function (response) {
            my_data = response.data;
            show_data(my_data);
        });
    }
    function show_data(data){
        var year = new Date().getFullYear();
        var check = true;
        for(var i = 0; i < data.length; i++){
            if (year == data[i].DEADLINE_PAGOAL.split(' ')[3]){
                document.getElementById("feedback-check").innerHTML = `
                    <p style="text-transform: none;">You have the self-assessment's request from the manager with deadline is <span>${data[i].DEADLINE_PAGOAL}</span></p>
                    <img src="<?= $host_name ?>/public/img/image/run_deadline.png" height="312px" width="438px" alt="">
                `;
                check = false;
                break;
            }
        }
        if (check){
            document.getElementById("feedback-check").innerHTML = `
                <p><span>Time for your feedback is overdue. You can not give feedback anymore.</span></p>
                <img src="<?= $host_name ?>/public/img/image/overdue.png" height="300px" width="300px" alt="overdue" class="overdue">
            `;
        }
    }
    $(document).ready(function () {
        call_data_My_PA_Goal();
    });
</script>