<%@ page title="Attendance Exception" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="Attendance_AttendanceException, App_Web_5bk21qbu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        .ae-page { padding-top: 8px; padding-bottom: 25px; }
        .ae-head {
            background: linear-gradient(135deg, #1f5fbf, #2f7ce5);
            border-radius: 14px;
            color: #fff;
            padding: 18px 22px;
            margin-bottom: 18px;
            box-shadow: 0 8px 25px rgba(31,95,191,.20);
        }
        .ae-head h3 { margin: 0; font-size: 22px; font-weight: 700; }
        .ae-head p { margin: 5px 0 0; opacity: .92; font-size: 13px; }

        .ae-card {
            background: #fff;
            border: 1px solid #e5eaf1;
            border-radius: 12px;
            margin-bottom: 18px;
            box-shadow: 0 5px 18px rgba(30,41,59,.06);
            overflow: visible;
        }
        .ae-card-header {
            padding: 14px 18px;
            border-bottom: 1px solid #edf0f4;
            background: #f9fbfd;
            border-radius: 12px 12px 0 0;
        }
        .ae-card-header h5 { margin: 0; font-size: 15px; font-weight: 700; color: #25364d; }
        .ae-card-body { padding: 18px; }

        .ae-label {
            display: block;
            font-size: 12px;
            font-weight: 700;
            color: #53657d;
            margin-bottom: 6px;
        }
        .ae-control {
            width: 100% !important;
            height: 38px !important;
            border: 1px solid #ced7e3 !important;
            border-radius: 7px !important;
            background: #fff !important;
            box-shadow: none !important;
            font-size: 13px !important;
        }
        textarea.ae-control { height: 95px !important; resize: vertical; }

        .ae-field { margin-bottom: 14px; }

        .ae-btn {
            height: 38px;
            border-radius: 7px !important;
            font-size: 13px;
            font-weight: 600;
            min-width: 110px;
        }
        .ae-btn-primary { background: #2563d9 !important; border-color: #2563d9 !important; }
        .ae-btn-success { background: #15966b !important; border-color: #15966b !important; }

        .ae-toolbar {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 8px;
            flex-wrap: wrap;
        }

        .ae-grid-wrap { overflow-x: auto; }
        .ae-grid { width: 100%; margin: 0 !important; }
        .ae-grid th {
            background: #f6f8fb;
            color: #526174;
            font-size: 11px;
            font-weight: 700;
            text-transform: uppercase;
            white-space: nowrap;
            padding: 11px !important;
            border-top: 0 !important;
        }
        .ae-grid td {
            font-size: 12px;
            color: #344054;
            vertical-align: middle !important;
            padding: 10px !important;
        }

        .ae-badge {
            display: inline-block;
            padding: 5px 9px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 700;
        }
        .ae-leave { background: #e7f7fb; color: #14738a; }
        .ae-gate { background: #fff0f0; color: #a03636; }

        .ae-modal .modal-dialog { max-width: 820px; }
        .ae-modal .modal-content {
            border: 0;
            border-radius: 12px;
            box-shadow: 0 20px 60px rgba(15,23,42,.28);
            overflow: visible;
        }
        .ae-modal .modal-header {
            padding: 16px 20px;
            background: #f9fbfd;
            border-bottom: 1px solid #e9edf2;
            border-radius: 12px 12px 0 0;
        }
        .ae-modal .modal-title { font-size: 16px; font-weight: 700; color: #26374d; }
        .ae-modal .modal-body { padding: 20px; }
        .ae-modal .modal-footer {
            padding: 13px 20px;
            background: #f9fbfd;
            border-top: 1px solid #e9edf2;
            border-radius: 0 0 12px 12px;
        }

        .ae-help {
            background: #f3f7ff;
            border: 1px solid #dce7fb;
            border-radius: 8px;
            color: #4b5f7a;
            padding: 10px 12px;
            font-size: 12px;
            margin-bottom: 16px;
        }

        /* Select2 professional alignment */
        .ae-card .select2-container,
        .ae-modal .select2-container {
            width: 100% !important;
        }
        .ae-card .select2-container .select2-selection--single,
        .ae-modal .select2-container .select2-selection--single {
            height: 38px !important;
            border: 1px solid #ced7e3 !important;
            border-radius: 7px !important;
            background: #fff !important;
        }
        .ae-card .select2-container--default .select2-selection--single .select2-selection__rendered,
        .ae-modal .select2-container--default .select2-selection--single .select2-selection__rendered {
            line-height: 36px !important;
            padding-left: 11px !important;
            color: #344054 !important;
            font-size: 13px !important;
        }
        .ae-card .select2-container--default .select2-selection--single .select2-selection__arrow,
        .ae-modal .select2-container--default .select2-selection--single .select2-selection__arrow {
            height: 36px !important;
            right: 7px !important;
        }
        .select2-dropdown { z-index: 99999 !important; }
        .select2-search__field {
            min-height: 34px !important;
            border-radius: 5px !important;
            border: 1px solid #ccd6e2 !important;
            padding: 5px 8px !important;
        }

        /* Always show Select2 search box */
        .select2-search--dropdown { display: block !important; padding: 8px !important; }
        .select2-search__field {
            width: 100% !important;
            height: 36px !important;
            border: 1px solid #bfcbd9 !important;
            border-radius: 6px !important;
            padding: 5px 9px !important;
            outline: none !important;
        }
        .select2-dropdown { z-index: 100000 !important; }

        .ae-loader-overlay {
            position: fixed;
            inset: 0;
            background: rgba(0,0,0,.35);
            z-index: 99998;
        }
        .ae-loader {
            position: fixed;
            left: 50%;
            top: 48%;
            transform: translate(-50%,-50%);
            z-index: 99999;
            background: #fff;
            padding: 18px 25px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 12px 35px rgba(0,0,0,.25);
        }


        /* 2026 refresh - visual hierarchy */
        .ae-page {
            max-width: 1500px;
            margin: 0 auto;
        }
        .ae-head {
            position: relative;
            overflow: hidden;
            background: linear-gradient(135deg, #123b78 0%, #2563d9 58%, #4f8df7 100%);
            border-radius: 18px;
            padding: 24px 26px;
            box-shadow: 0 16px 38px rgba(37,99,217,.18);
        }
        .ae-head:after {
            content: "";
            position: absolute;
            width: 210px;
            height: 210px;
            right: -55px;
            top: -100px;
            border-radius: 50%;
            background: rgba(255,255,255,.10);
        }
        .ae-head h3 { font-size: 24px; letter-spacing: -.2px; }
        .ae-head p { font-size: 13px; max-width: 760px; }
        .ae-card {
            border: 1px solid #e7edf5;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(15,23,42,.055);
        }
        .ae-card-header {
            padding: 15px 18px;
            background: linear-gradient(180deg,#ffffff,#f8fbff);
            border-bottom: 1px solid #e8eef6;
            border-radius: 16px 16px 0 0;
        }
        .ae-card-header h5 {
            font-size: 15px;
            color: #183153;
        }
        .ae-control,
        .ae-card .select2-container .select2-selection--single,
        .ae-modal .select2-container .select2-selection--single {
            min-height: 42px !important;
            height: 42px !important;
            border-radius: 9px !important;
            border-color: #cfd9e7 !important;
            transition: border-color .18s ease, box-shadow .18s ease;
        }
        .ae-control:focus {
            border-color: #4f83e7 !important;
            box-shadow: 0 0 0 3px rgba(37,99,217,.10) !important;
        }
        .ae-card .select2-container--default .select2-selection--single .select2-selection__rendered,
        .ae-modal .select2-container--default .select2-selection--single .select2-selection__rendered {
            line-height: 40px !important;
        }
        .ae-card .select2-container--default .select2-selection--single .select2-selection__arrow,
        .ae-modal .select2-container--default .select2-selection--single .select2-selection__arrow {
            height: 40px !important;
        }
        .ae-label {
            color: #34465f;
            letter-spacing: .1px;
        }
        .ae-btn {
            height: 42px;
            border-radius: 9px !important;
            box-shadow: 0 4px 10px rgba(15,23,42,.08);
        }
        .ae-btn:hover { transform: translateY(-1px); }
        .ae-grid {
            border-collapse: separate !important;
            border-spacing: 0 !important;
        }
        .ae-grid th {
            background: #f3f7fc;
            color: #42546c;
            padding: 12px 11px !important;
        }
        .ae-grid td {
            padding: 11px !important;
            border-color: #edf1f6 !important;
        }
        .ae-grid tr:hover td { background: #f9fbff; }
        .ae-badge {
            padding: 6px 10px;
            border-radius: 999px;
            letter-spacing: .1px;
        }
        .ae-leave { background: #e8f8f2; color: #08765c; }
        .ae-gate { background: #fff0f1; color: #b4233c; }
        .ae-help {
            border-radius: 10px;
            background: #f5f8ff;
            color: #425675;
        }
        .ae-modal .modal-dialog { max-width: 880px; }
        .ae-modal .modal-content { border-radius: 16px; }
        .ae-modal .modal-header {
            background: linear-gradient(180deg,#ffffff,#f7faff);
            border-radius: 16px 16px 0 0;
        }
        .ae-modal .modal-footer { border-radius: 0 0 16px 16px; }
        .ae-filter-note {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-top: 2px;
            color: #718096;
            font-size: 11px;
        }
        .ae-filter-note:before {
            content: "●";
            color: #2563d9;
            font-size: 9px;
        }

        @media(max-width:767px) {
            .ae-head { padding: 15px; }
            .ae-card-body { padding: 14px; }
            .ae-toolbar { justify-content: stretch; }
            .ae-toolbar .btn { width: 100%; }
        }
    
        /* =========================================================
           FULL PAGE WIDTH - CSS ONLY
           No server-side / JavaScript / functionality changes
           ========================================================= */

        /* Remove restrictive content width from this page only */
        .container-fluid.ae-page {
            width: 100% !important;
            max-width: none !important;
            margin: 0 !important;
            padding-left: 16px !important;
            padding-right: 16px !important;
            padding-bottom: 24px !important;
        }

        /* Let the page content use all available workspace width */
        .ae-page {
            width: 100% !important;
            max-width: none !important;
        }

        /* Header and cards span full available width */
        .ae-head,
        .ae-card {
            width: 100% !important;
            max-width: none !important;
        }

        /* Remove any Bootstrap row width restriction/misalignment */
        .ae-page > .row,
        .ae-card .row {
            width: 100% !important;
        }

        /* Keep report/search area wide and balanced */
        .ae-card-body {
            width: 100% !important;
        }

        /* Grid should always consume the full card width */
        .ae-grid-wrap {
            width: 100% !important;
            max-width: none !important;
            overflow-x: auto !important;
        }

        .ae-grid {
            width: 100% !important;
            min-width: 1100px;
        }

        /* Prevent page from looking centered/narrow on large monitors */
        @media (min-width: 1200px) {
            .container-fluid.ae-page {
                padding-left: 18px !important;
                padding-right: 18px !important;
            }

            .ae-head {
                margin-left: 0 !important;
                margin-right: 0 !important;
            }

            .ae-card {
                margin-left: 0 !important;
                margin-right: 0 !important;
            }
        }

        /* Extra-wide desktop screens */
        @media (min-width: 1600px) {
            .container-fluid.ae-page {
                padding-left: 20px !important;
                padding-right: 20px !important;
            }

            .ae-card-body {
                padding-left: 22px !important;
                padding-right: 22px !important;
            }
        }

        /* Mobile/tablet remains responsive */
        @media (max-width: 767px) {
            .container-fluid.ae-page {
                padding-left: 10px !important;
                padding-right: 10px !important;
            }

            .ae-grid {
                min-width: 900px;
            }
        }

    </style>


    <style>
        .ae-present { background:#e9f8ef; color:#157347; }
        .ae-absent { background:#fff0f0; color:#b4233c; }
        .ae-holiday { background:#eef2ff; color:#4f46e5; }
        .ae-total { background:#eef3f8; color:#475569; }
        .ae-record-count { font-size:12px; color:#64748b; font-weight:600; margin-left:8px; }
        .ae-inline-status {
            min-width: 175px !important;
            height: 34px !important;
            padding: 4px 8px !important;
            border: 1px solid #cbd5e1 !important;
            border-radius: 7px !important;
            font-size: 12px !important;
            background: #fff !important;
        }
        .ae-inline-status:focus { border-color:#4f83e7 !important; box-shadow:0 0 0 2px rgba(37,99,217,.10) !important; }
    </style>
    <script type="text/javascript">

        function initAttendanceEmployeeSearch() {
            var $reportEmp = $('#<%= ddlReportEmployee.ClientID %>');
            var $entryEmp = $('#ddlEntryEmployeeClient');

            function wireSelect2($ddl, parentSelector, emptyText) {
                if (!$ddl.length || typeof $.fn.select2 === 'undefined') return;

                if ($ddl.hasClass("select2-hidden-accessible")) {
                    $ddl.select2('destroy');
                }

                var options = {
                    width: '100%',
                    minimumResultsForSearch: 0,
                    allowClear: false,
                    placeholder: emptyText || 'Select employee',
                    language: {
                        noResults: function () { return 'No employee found'; },
                        searching: function () { return 'Searching...'; }
                    }
                };

                if (parentSelector) options.dropdownParent = $(parentSelector);
                $ddl.select2(options);
            }

            wireSelect2($reportEmp, null, 'All Employees');
            wireSelect2($entryEmp, '#Modal1', 'Select Employee / Loader');
        }

        function AttendanceSuccess(action) {
            var message = action || 'Saved successfully.';
            if (window.Swal && Swal.fire) {
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: message,
                    timer: 2200,
                    showConfirmButton: false
                });
            } else {
                alert(message);
            }
        }

        function AttendanceError(message) {
            if (window.Swal && Swal.fire) {
                Swal.fire({
                    icon: 'error',
                    title: 'Unable to complete',
                    text: message || 'Please check the entered information.'
                });
            } else {
                alert(message || 'Please check the entered information.');
            }
        }

        function showEntryValidation(message) {
            var msg = document.getElementById("<%= lblMessage.ClientID %>");
            if (msg) msg.innerHTML = message;
            if (window.Swal && Swal.fire) {
                Swal.fire({
                    icon: 'warning',
                    title: 'Please check',
                    text: message,
                    confirmButtonText: 'OK'
                });
            }
        }

        function syncEntryEmployeeHidden() {
            var value = $('#ddlEntryEmployeeClient').val() || '0';
            $('#<%= hfEntryEmployeeID.ClientID %>').val(value);
        }

        function loadEntryEmployeesByDepartment(selectedUserID) {
            var departmentID = $('#<%= ddlEntryDepartment.ClientID %>').val() || '0';
            var $emp = $('#ddlEntryEmployeeClient');
            var targetUserID = selectedUserID || $('#<%= hfEntryEmployeeID.ClientID %>').val() || '0';

            if ($emp.hasClass('select2-hidden-accessible')) $emp.select2('destroy');

            $emp.empty().append($('<option></option>').val('0').text('Loading employees...'));
            $('#<%= hfEntryEmployeeID.ClientID %>').val('0');

            $.ajax({
                type: 'POST',
                url: 'AttendanceException.aspx/GetEntryEmployees',
                data: JSON.stringify({ departmentID: departmentID }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (response) {
                    var data = response.d || [];
                    $emp.empty();
                    $emp.append($('<option></option>').val('0').text('-= Select Employee / Loader =-'));

                    $.each(data, function (index, item) {
                        $emp.append($('<option></option>').val(item.UserID).text(item.EmployeeName));
                    });

                    if (targetUserID && targetUserID !== '0' &&
                        $emp.find('option[value="' + targetUserID + '"]').length > 0) {
                        $emp.val(targetUserID);
                        $('#<%= hfEntryEmployeeID.ClientID %>').val(targetUserID);
                    } else {
                        $emp.val('0');
                        $('#<%= hfEntryEmployeeID.ClientID %>').val('0');
                    }

                    initAttendanceEmployeeSearch();
                    $emp.off('change.entryEmployee').on('change.entryEmployee', syncEntryEmployeeHidden);
                },
                error: function (xhr) {
                    $emp.empty().append($('<option></option>').val('0').text('-= Unable to load employees =-'));
                    $('#<%= hfEntryEmployeeID.ClientID %>').val('0');
                    var msg = 'Employee list could not be loaded.';
                    try {
                        if (xhr.responseJSON && xhr.responseJSON.Message) msg = xhr.responseJSON.Message;
                    } catch (e) { }
                    AttendanceError(msg);
                    initAttendanceEmployeeSearch();
                }
            });
        }

        $(document).ready(function () {
            initAttendanceEmployeeSearch();
            $('#ddlEntryEmployeeClient').off('change.entryEmployee').on('change.entryEmployee', syncEntryEmployeeHidden);
        });

        if (typeof (Sys) !== 'undefined') {
            Sys.Application.add_load(function () {
                initAttendanceEmployeeSearch();
            });
        }

        function validateEntry() {
            var emp = document.getElementById("<%= hfEntryEmployeeID.ClientID %>").value;
            var fd = document.getElementById("<%= txtEntryFromDate.ClientID %>").value;
            var td = document.getElementById("<%= txtEntryToDate.ClientID %>").value;
            var st = document.getElementById("<%= ddlEntryStatus.ClientID %>").value;
            var msg = document.getElementById("<%= lblMessage.ClientID %>");

            if (msg) msg.innerHTML = "";
            if (emp === "0" || emp === "") { showEntryValidation("Please select Employee / Loader."); return false; }
            if (fd === "") { showEntryValidation("Please select From Date."); return false; }
            if (td === "") { showEntryValidation("Please select To Date."); return false; }
            if (td < fd) { showEntryValidation("To Date cannot be earlier than From Date."); return false; }
            if (st === "0" || st === "") { showEntryValidation("Please select Status."); return false; }
            return true;
        }

    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">Attendance Exception & Attendance Review</h4>
                    </div>
                </div>
            </div>

            <div class="container-fluid ae-page">

                <div class="ae-head">
                    <h3>Attendance Review & Exception Management</h3>
                    <p>Review department/employee attendance, classify absent days as Informed Leave, Gate Band or Absent, and export attendance or exception reports.</p>
                </div>

                <div id="Alert" class="alert alert-warning" role="alert" visible="false" runat="server"></div>

                <div class="ae-card">
                    <div class="ae-card-header"><h5>Report Search</h5></div>
                    <div class="ae-card-body">

                        <div class="row">
                            <div class="col-lg-3 col-md-6">
                                <div class="ae-field">
                                    <label class="ae-label">Report Type</label>
                                    <asp:DropDownList ID="ddlReportType" runat="server" AutoPostBack="true"
                                        CssClass="form-control ae-control"
                                        OnSelectedIndexChanged="ddlReportType_SelectedIndexChanged">
                                        <asp:ListItem Text="Attendance Report" Value="Attendance" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Exception Report" Value="Exception"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6">
                                <div class="ae-field">
                                    <label class="ae-label">Department</label>
                                    <asp:DropDownList ID="ddlReportDepartment" runat="server" AutoPostBack="true"
                                        CssClass="form-control ae-control"
                                        OnSelectedIndexChanged="ddlReportDepartment_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-lg-6 col-md-12">
                                <div class="ae-field">
                                    <label class="ae-label">Employee / Loader</label>
                                    <asp:DropDownList ID="ddlReportEmployee" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <div class="ae-filter-note">Choose a department for all employees in that department, or select one employee for an individual report.</div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-3 col-md-6">
                                <div class="ae-field">
                                    <label class="ae-label">From Date</label>
                                    <asp:TextBox ID="txtReportFromDate" runat="server" TextMode="Date" CssClass="form-control ae-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6">
                                <div class="ae-field">
                                    <label class="ae-label">To Date</label>
                                    <asp:TextBox ID="txtReportToDate" runat="server" TextMode="Date" CssClass="form-control ae-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6">
                                <div class="ae-field">
                                    <label class="ae-label">Status</label>
                                    <asp:DropDownList ID="ddlReportStatus" runat="server" CssClass="form-control ae-control"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6">
                                <div class="ae-field">
                                    <label class="ae-label">&nbsp;</label>
                                    <asp:Button ID="btnShowReport" runat="server" Text="Show Report"
                                        CssClass="btn btn-primary btn-block ae-btn ae-btn-primary"
                                        OnClick="btnShowReport_Click" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="ae-card">
                    <div class="ae-card-header">
                        <div class="row" style="width:100%; margin:0;">
                            <div class="col-md-6" style="padding-left:0;">
                                <h5 style="display:inline-block;"><asp:Label ID="lblGridTitle" runat="server" Text="Attendance Report"></asp:Label></h5>
                                <asp:Label ID="lblRecordCount" runat="server" CssClass="ae-record-count"></asp:Label>
                            </div>
                            <div class="col-md-6" style="padding-right:0;">
                                <div class="ae-toolbar">
                                    <asp:Button ID="btnExportExcel" runat="server" Text="Export Excel"
                                        CssClass="btn btn-secondary ae-btn" OnClick="btnExportExcel_Click" />
                                    <asp:Button ID="btnAddNew" runat="server" Text="+ Add New Entry"
                                        CssClass="btn btn-success ae-btn ae-btn-success" OnClick="btnAddNew_Click" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <asp:Panel ID="pnlAttendanceReport" runat="server">
                        <div class="ae-grid-wrap">
                            <asp:GridView ID="gvAttendance" runat="server" AutoGenerateColumns="false"
                                CssClass="table table-striped table-bordered ae-grid" GridLines="None"
                                DataKeyNames="USERID,AttendanceDateKey">
                                <Columns>
                                    <asp:BoundField DataField="MachineCode" HeaderText="Machine Code" />
                                    <asp:BoundField DataField="EmployeeName" HeaderText="Employee" />
                                    <asp:BoundField DataField="DepartmentName" HeaderText="Department" />
                                    <asp:BoundField DataField="Designation" HeaderText="Designation" />
                                    <asp:BoundField DataField="AttendanceDateDisplay" HeaderText="Date" />
                                    <asp:BoundField DataField="Day" HeaderText="Day" />
                                    <asp:BoundField DataField="InTime" HeaderText="IN" />
                                    <asp:BoundField DataField="OutTime" HeaderText="OUT" />

                                    <asp:TemplateField HeaderText="Attendance">
                                        <ItemTemplate>
                                            <span class='<%# GetAttendanceStatusCss(Convert.ToString(Eval("RawAttendanceStatus"))) %>'>
                                                <%# Eval("RawAttendanceStatus") %>
                                            </span>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Classification">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlAttendanceStatus" runat="server"
                                                CssClass="form-control ae-inline-status"
                                                AutoPostBack="true"
                                                Visible='<%# Convert.ToBoolean(Eval("IsAbsent")) %>'
                                                SelectedValue='<%# Eval("ExceptionStatusValue") %>'
                                                OnSelectedIndexChanged="ddlAttendanceStatus_SelectedIndexChanged">
                                                <asp:ListItem Text="Absent" Value="Absent"></asp:ListItem>
                                                <asp:ListItem Text="Informed Leave" Value="Leave"></asp:ListItem>
                                                <asp:ListItem Text="Gate Band / Gate Closed" Value="Gate Band"></asp:ListItem>
                                            </asp:DropDownList>

                                            <asp:Label ID="lblAttendanceFinalStatus" runat="server"
                                                Visible='<%# !Convert.ToBoolean(Eval("IsAbsent")) %>'
                                                CssClass='<%# GetAttendanceStatusCss(Convert.ToString(Eval("FinalStatus"))) %>'
                                                Text='<%# Eval("FinalStatus") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="ExceptionRemarks" HeaderText="Remarks" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <div style="padding:35px;text-align:center;color:#7b8797;">No attendance record found for the selected filters.</div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="pnlExceptionReport" runat="server" Visible="false">
                        <div class="ae-grid-wrap">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"
                                CssClass="table table-striped table-bordered ae-grid" GridLines="None"
                                DataKeyNames="ID" OnRowCommand="GridView1_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" />
                                    <asp:BoundField DataField="MachineCode" HeaderText="Machine Code" />
                                    <asp:BoundField DataField="EmployeeName" HeaderText="Employee" />
                                    <asp:BoundField DataField="DepartmentName" HeaderText="Department" />
                                    <asp:BoundField DataField="FromDateDisplay" HeaderText="From Date" />
                                    <asp:BoundField DataField="ToDateDisplay" HeaderText="To Date" />
                                    <asp:BoundField DataField="TotalDays" HeaderText="Days" />

                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <span class='<%# GetAttendanceStatusCss(GetExceptionStatusText(Convert.ToString(Eval("StatusCategory")))) %>'>
                                                <%# GetExceptionStatusText(Convert.ToString(Eval("StatusCategory"))) %>
                                            </span>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
                                    <asp:BoundField DataField="CreatedBy" HeaderText="Created By" />
                                    <asp:BoundField DataField="CreatedDateDisplay" HeaderText="Created Date" />

                                    <asp:TemplateField HeaderText="Edit">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnEdit" runat="server" CommandName="EditRecord"
                                                CommandArgument='<%# Eval("ID") %>' ToolTip="Edit"
                                                ImageUrl="../../Image/Edit.png" Width="24px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnDelete" runat="server" CommandName="DeleteRecord"
                                                CommandArgument='<%# Eval("ID") %>' ToolTip="Delete"
                                                ImageUrl="../../Image/Delete.png" Width="24px"
                                                OnClientClick="if(!confirm('Are you sure you want to delete this record?')) return false;" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div style="padding:35px;text-align:center;color:#7b8797;">No exception record found for the selected filters.</div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExportExcel" />
        </Triggers>
    </asp:UpdatePanel>

    <!-- MANUAL ADD / EDIT MODAL -->
    <div id="Modal1" class="modal fade ae-modal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div>
                        <h5 class="modal-title">Add / Update Attendance Exception</h5>
                        <small class="text-muted">Use this form for manual or multi-day exception entry.</small>
                    </div>
                    <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                </div>

                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="modal-body">
                            <asp:Label ID="lblMessage" runat="server" ForeColor="#c0392b" Font-Bold="true"></asp:Label>

                            <div class="ae-help" style="margin-top:10px;">
                                Select a <strong>Department</strong> first to load only its employees, then search by <strong>Name</strong> or <strong>Machine Code</strong>.
                            </div>

                            <div class="row">
                                <div class="col-md-5">
                                    <div class="ae-field">
                                        <label class="ae-label">Department</label>
                                        <asp:DropDownList ID="ddlEntryDepartment" runat="server" AutoPostBack="false"
                                            CssClass="form-control ae-control" onchange="loadEntryEmployeesByDepartment();"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <div class="ae-field">
                                        <label class="ae-label">Employee / Loader</label>
                                        <select id="ddlEntryEmployeeClient" class="form-control"></select>
                                        <asp:HiddenField ID="hfEntryEmployeeID" runat="server" Value="0" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="ae-field">
                                        <label class="ae-label">From Date</label>
                                        <asp:TextBox ID="txtEntryFromDate" runat="server" TextMode="Date" CssClass="form-control ae-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="ae-field">
                                        <label class="ae-label">To Date</label>
                                        <asp:TextBox ID="txtEntryToDate" runat="server" TextMode="Date" CssClass="form-control ae-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="ae-field">
                                        <label class="ae-label">Status</label>
                                        <asp:DropDownList ID="ddlEntryStatus" runat="server" CssClass="form-control ae-control">
                                            <asp:ListItem Text="Leave (Informed)" Value="Leave" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Gate Band / Gate Closed" Value="Gate Band"></asp:ListItem>
                                            <asp:ListItem Text="Absent" Value="Absent"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="ae-field" style="margin-bottom:0;">
                                        <label class="ae-label">Remarks / Reason</label>
                                        <asp:TextBox ID="txtEntryRemarks" runat="server" TextMode="MultiLine" Rows="4"
                                            MaxLength="500" CssClass="form-control ae-control"
                                            placeholder="Enter reason / remarks..."></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary ae-btn" data-dismiss="modal">Close</button>
                            <asp:Button ID="btnSave" runat="server" Text="Save"
                                CssClass="btn btn-primary ae-btn ae-btn-primary"
                                OnClientClick="return validateEntry();" OnClick="btnSave_Click" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="ae-loader-overlay"></div>
            <div class="ae-loader">
                <img src="../../Image/ajax_loader_gray_49.gif" width="50" />
                <div style="margin-top:8px;font-size:12px;font-weight:600;">Please wait...</div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

</asp:Content>
