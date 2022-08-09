var my_data = [];
const modal_new_goal = document.querySelector('.js-modal-new-goal')
function call_api(){
    var settings = {
        "url": "http://127.0.0.1:5000/api/uc0131_132/get-pa-goal",
        "method": "POST",
        "timeout": 0,
        "headers": {
          "Content-Type": "application/json"
        },
        "data": JSON.stringify({
          "pa_goal_id": `${pa_goal_id}`
        }),
      };
      
      $.ajax(settings).done(function (response) {
        render_data(response.data);
        my_data = response.data;
      });
}

function render_data(my_data){
    var main_data = document.getElementById('detail-goal-name');
    main_data.innerHTML = "";
    for (let i = my_data.length - 1; i >= 0; i--){
        console.log("hi")
        main_data.innerHTML += `
            <div class="goal-name">
                <div class="goal-name-checkbox">
                    <input type="checkbox" name="" id="">
                    <h4>${my_data[i].GOAL_NAME}</h4>
                    <p class="pending">status: ${my_data[i].STATUS}</p>
                </div>
                <div class="time">
                    <p>due date: ${my_data[i].DUE_DATE}</p>
                    <p>complete date: ${my_data[i].COMPLETED_DATE}</p>
                </div>
                <div class="func">
                    <button onclick="showNewGoalCreate(${i})">see goal</button>
                    <button class="edit-error">edit goal</button>
                    <button class="js-del-re">delete goal</button>
                </div>
            </div>
        `;
    }
}

$(document).ready(function () {
    call_api();
});

function edit_model(id){
    document.getElementById('model-view').innerHTML = `
        <div class="modal-contain js-modal-contain-new-goal">
            <h1>see a goal</h1>
            <div class="time">
                <div class="due-date">
                    <p>due date</p>
                    <input type="text" name="" id="" value="${my_data[id].DUE_DATE}" readonly>
                </div>
                <div class="due-date">
                    <p>completed date</p>
                    <input type="text" name="" id="" value="${my_data[id].COMPLETED_DATE}" readonly>
                </div>
                <div class="select">
                    <p>status</p>
                    <select name="" id="" readonly>
                        <option value=""">${my_data[id].STATUS}</"option>
                    </select>
                </div>
            </div>

            <div class="input-form">
                <div class="input">
                    <p>goal/objects name</p>
                    <input type="text" value="${my_data[id].GOAL_NAME}" placeholder="type something here" readonly>
                </div>
                <div class="input">
                    <p>action/steps</p>
                    <input type="text" value="${my_data[id].ACTION_STEP}" placeholder="type something here" readonly>
                </div>
                <div class="input">
                    <p>comment</p>
                    <input type="text" value="${my_data[id].COMMENT}" placeholder="type something here" readonly>
                </div>
            </div>

            <div class="button">
                <a href="#" onclick="hideNewGoalCreate()" class="btn cancel js-cancel">cancel</a>
            </div>
        </div>
    `;
}

function showNewGoalCreate (id) {
    edit_model(id);
    modal_new_goal.classList.add('open')
}

function hideNewGoalCreate () {
    modal_new_goal.classList.remove('open')
}