const modal_edit_eror = document.querySelector('.js-modal-edit-error')
const modal_del_co = document.querySelector('.js-modal-del-co')
const modal_del_re = document.querySelector('.js-modal-del-re')

function showError (content) {
    modal_edit_eror.classList.add('open')
    document.getElementById("content-error-alert").innerHTML = content;
}

function hideError () {
    modal_edit_eror.classList.remove('open')
}

function showDelRequest () {
    modal_del_re.classList.add('open')
}

function showDelConfirm () {
    delete_an_request_ot(OTRequest_ID);
    modal_del_re.classList.remove('open')
    modal_del_co.classList.add('open')
}

function hideDelRequest () {
    modal_del_re.classList.remove('open')
}

function hideDelConfirm () {
    modal_del_co.classList.remove('open')
}