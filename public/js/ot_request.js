// JS for OT request form
const modal_new_rq = document.querySelector('.js-modal-new-rq')
const create_rqs = document.querySelectorAll('.new-rq')
const modalContainer_new_rq = document.querySelector('.js-modal-contain-new-rq')
const cancel = document.querySelector('.cancel')

for (const create_rq of create_rqs) {
    create_rq.addEventListener('click',showNewOTRequest)
}

function showNewOTRequest () {
    modal_new_rq.classList.add('open')
    if(document.getElementById('OTRequest_ID').value != "0"){
        document.getElementById('OTRequest_ID').value = 0;
        reset_request_ot_detail();
        document.getElementById('REASON_EMPLOYEE').value = "";
    }
}

function hideNewOTRequest () {
    modal_new_rq.classList.remove('open')
}

cancel.addEventListener('click',hideNewOTRequest)

modalContainer_new_rq.addEventListener('click', function(even){
    even.stopPropagation()
})