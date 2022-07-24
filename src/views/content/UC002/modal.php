<div class="modal-new-rq js-modal-new-rq">
    <form class="modal-contain js-modal-contain-new-rq">
        <div class="modal__heading">
            <h1>create new OT request</h1>
            <div class="button">
                <button class="btn">submit</button>
                <button class="btn">save</button>
                <button type="button" class="btn cancel">cancel</button>
            </div>
        </div>

        <div class="modal__body">
            <div class="employ_info">
                <h3>Employee's Information</h3>
                <div class="form flex_start">
                    <div class="ful-name">
                        <p>full name</p>
                        <input type="text" name="EMPLOYEE_NAME" id="EMPLOYEE_NAME" readonly="readonly">
                    </div>
                    <div class="email">
                        <p>email</p>
                        <input type="text" name="EMPLOYEE_EMAIL" id="EMPLOYEE_EMAIL" readonly="readonly">
                    </div>
                    <div class="department">
                        <p>department</p>
                        <input type="text" name="EMPLOYEE_DEPART_NAME" id="EMPLOYEE_DEPART_NAME" readonly="readonly">
                    </div>
                    <div class="employee ID">
                        <p>employee ID</p>
                        <input type="text" name="EMPLOYEE_ID" id="EMPLOYEE_ID" readonly="readonly">
                    </div>
                </div>
            </div>

            <div class="appraiser_info">
                <h3>Appraiser (Manager)'s Information</h3>
                <div class="form flex_start">
                    <div class="ful-name">
                        <p>full name</p>
                        <input type="text" name="MANAGER_NAME" id="MANAGER_NAME" readonly="readonly">
                    </div>
                    <div class="email">
                        <p>email</p>
                        <input type="text" name="MANAGER_EMAIL" id="MANAGER_EMAIL" readonly="readonly">
                    </div>
                    <div class="department">
                        <p>department</p>
                        <input type="text" name="MANAGER_DEPART_NAME" id="MANAGER_DEPART_NAME" readonly="readonly">
                    </div>
                    <div class="appraiser ID">
                        <p>appraiser (manager) ID</p>
                        <input type="text" name="MANAGER_ID" id="MANAGER_ID" readonly="readonly">
                    </div>
                </div>
            </div>

            <div class="OT_rq_info">
                <h3>OT Request Overview Information</h3>
                <div class="form flex_start">
                    <div class="date">
                        <p>start date</p>
                        <input type="date" name="" id="start-date">
                    </div>
                    <div class="date">
                        <p>end date</p>
                        <input type="date" name="" id="end-date">
                    </div>
                    <div class="total">
                        <p>total estimated hours</p>
                        <input type="number" name="" id="" value="0" readonly="readonly">
                    </div>
                    <div class="fl_up">
                        <p>email follow up</p>
                        <select name="fl_up" id="">
                            <option value="yes">yes</option>
                            <option value="no">no</option>
                        </select>
                    </div>
                    <div class="status">
                        <p>status</p>
                        <select name="fl_up" id="">
                            <option value="yes">draft</option>
                            <option value="no">reject</option>
                        </select>
                    </div>
                    <div class="date">
                        <p>created date</p>
                        <input type="date" name="" id="today-date">
                    </div>
                </div>
            </div>

            <div class="textare-form">
                <p>reason OT</p>
                <textarea placeholder="Type something..." cols="30" rows="10"></textarea>
            </div>

            <div class="ot-rq-detail">
                <h3>OT request details</h3>
                <div class="form flex_start">
                    <div class="date">
                        <p>date</p>
                        <input type="date" name="" id="request-date">
                    </div>
                    <div class="date">
                        <p>hours</p>
                        <input type="number" max="4" min="1" name="" id="request-time" value="1">
                    </div>
                    <button class="btn" type="button" onclick="hoursActive()">Add OT details</button>
                </div>
            </div>

            <table class="table text-align">
                <tbody>
                    <tr>
                        <th width="50%">date OT</th>
                        <th>hours</th>
                        <th>action</th>
                    </tr>
                </tbody>
                <tbody id="table-ot-detail">
                    
                </tbody>
                                
            </table>
        </div>
        <input type="hidden" name="number-ot" id="number-ot" value="0">

    </form>
</div>