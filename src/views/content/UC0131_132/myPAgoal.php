<link rel="stylesheet" href="<?= $host_name ?>/public/css/myPAgoal.css">
<div class="content">
    <h1>my PA goal history</h1>
    <p class="sub-heading">self assessment history</p>
    <div class="my-fb-body">
        <div class="input-line">
            <div class="year-respond">
                <p>last update by from year</p>
                <input type="date" id="" placeholder="All Year" class="date">
            </div>

            <div class="respond-dl">
                <p>responded deadline for form by year</p>
                <input type="date" id="" placeholder="All Year" class="date">
            </div>
        </div>

        <div class="show-status">
            <p>show feedback with status</p>
            <div class="squarecheck">
                <label for="squarecheck1">all</label>
                <input type="checkbox" name="check" id="squarecheck1">
            </div>
            <div class="squarecheck">
                <label for="squarecheck2">accepted</label>
                <input type="checkbox" name="check" id="squarecheck2">
            </div>
            <div class="squarecheck">
                <label for="squarecheck3">rejected</label>
                <input type="checkbox" name="check" id="squarecheck3">
            </div>
            <div class="squarecheck">
                <label for="squarecheck4">cancelled</label>
                <input type="checkbox" name="check" id="squarecheck4">
            </div>
            <div class="squarecheck">
                <label for="squarecheck5">pendinng approval</label>
                <input type="checkbox" name="check" id="squarecheck5">
            </div>
            <div class="squarecheck">
                <label for="squarecheck6">draft</label>
                <input type="checkbox" name="check" id="squarecheck6">
            </div>
        </div>

        <div class="func-button">
            <button class="btn">search</button>
            <button class="btn">reset all</button>
        </div>
    </div>
    <div class="pa-goal">
        <div class="header">
            <h4>history</h4>
            <div class="header-page">
                <i class="fa-solid fa-angle-left"></i>
                <p>
                    <span>1</span>/1
                </p>
                <i class="fa-solid fa-angle-right"></i>
            </div>
        </div>
        <table id="history">
            <tr>
                <th>PAGoalForm_id</th>
                <th>total goals</th>
                <th>deadline date</th>
                <th>last updated date</th>
                <th>status</th>
                <th>manager ID</th>
                <th>rejected reason (if any)</th>
                <th>action</th>
            </tr>
            <!-- <tr>
                    <td>PAG_0120</td>
                    <td>10</td>
                    <td>2022-07-15 23:00:00</td>
                    <td>2022-07-15 23:00:00</td>
                    <td class="pending">pending</td>
                    <td>2345</td>
                    <td>none</td>
                    <td class="action-area" width="10%">
                        <i class="fa-solid fa-eye"></i>
                        <i class="fa-solid fa-pen js-fix"></i>
                    </td>
                </tr>
                <tr>
                    <td>PAG_0120</td>
                    <td>10</td>
                    <td>2022-07-15 23:00:00</td>
                    <td>2022-07-15 23:00:00</td>
                    <td class="accepted">accepted</td>
                    <td>2345</td>
                    <td>none</td>
                    <td class="action-area">
                        <i class="fa-solid fa-eye"></i>
                        <i class="fa-solid fa-pen js-fix"></i>
                    </td>
                </tr>
                <tr>
                    <td>PAG_0120</td>
                    <td>10</td>
                    <td>2022-07-15 23:00:00</td>
                    <td>2022-07-15 23:00:00</td>
                    <td class="rejected">rejected</td>
                    <td>2345</td>
                    <td>your goals aren't suitable</td>
                    <td class="action-area">
                        <i class="fa-solid fa-eye"></i>
                        <i class="fa-solid fa-pen js-fix"></i>
                    </td>
                </tr> -->
            <tr>
                <td>PAG_0120</td>
                <td>10</td>
                <td>2022-07-15 23:00:00</td>
                <td>2022-07-15 23:00:00</td>
                <td class="pending">pending</td>
                <td>2345</td>
                <td>none</td>
                <td class="action-area" width="10%">
                    <i class="fa-solid fa-eye"></i>
                    <a href="<?= $host_name ?>/UC0131_132/self_result">
                        <i class="fa-solid fa-pen js-fix"></i>
                    </a>
                </td>
            </tr>
            <tr>
                <td>PAG_0120</td>
                <td>10</td>
                <td>2022-07-15 23:00:00</td>
                <td>2022-07-15 23:00:00</td>
                <td class="accepted">accepted</td>
                <td>2345</td>
                <td>none</td>
                <td class="action-area">
                    <i class="fa-solid fa-eye"></i>
                    <a href="<?= $host_name ?>/UC0131_132/self_result">
                        <i class="fa-solid fa-pen js-fix"></i>
                    </a>
                </td>
            </tr>
            <tr>
                <td>PAG_0120</td>
                <td>10</td>
                <td>2022-07-15 23:00:00</td>
                <td>2022-07-15 23:00:00</td>
                <td class="rejected">rejected</td>
                <td>2345</td>
                <td>your goals aren't suitable</td>
                <td class="action-area">
                    <a href="<?= $host_name ?>/UC0131_132/self_result_view">
                        <i class="fa-solid fa-eye"></i>
                    </a>
                    <a href="<?= $host_name ?>/UC0131_132/self_result">
                        <i class="fa-solid fa-pen js-fix"></i>
                    </a>
                </td>
            </tr>
        </table>
    </div>
</div>



<script src="<?= $host_name ?>/public/js/UC0131_132/call_api.js"></script>>
<script src="<?= $host_name ?>/public/js/UC0131_132/provi_fb.js"></script>