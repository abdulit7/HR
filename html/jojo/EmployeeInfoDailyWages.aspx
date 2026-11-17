<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="html_jojo_EmployeeInfoDailyWages, App_Web_5bk21qbu" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="page-breadcrumb">
                    <div class="row">
                        <div class="col-12 d-flex no-block align-items-center">
                            <h4 class="page-title">Employee Info</h4>
                        </div>
                    </div>
                </div>
                <br />
                <div class="container-fluid">
                    <asp:Label ID="Label4" runat="server"></asp:Label>
                    <asp:Label ID="Label5" runat="server"></asp:Label>
                    <div class="row">
                        <div class="col-12">
                            <div id="Div1" class="alert alert-warning" role="alert" visible="false" runat="server">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container-fluid">
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                    <div class="row">
                        <div class="col-12">
                            <div id="Alert" class="alert alert-warning" role="alert" visible="false" runat="server">
                            </div>

                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="control-label">Department</label>
                                            <asp:ListBox SelectionMode="Multiple" CssClass="select2 form-control m-t-15" Height="36px" Width="100%" ID="ddldepartment" runat="server"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddldepartment_SelectedIndexChanged"></asp:ListBox>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        &nbsp;&nbsp;&nbsp;<asp:DropDownList Height="36px" Width="40%" ID="ddlemployee" runat="server" CssClass="select2 form-control custom-select">
                                        </asp:DropDownList>
                                        &nbsp;        
                                            <asp:DropDownList CssClass="form-control" Width="25%" ID="ddlEmpTypeSearch" Height="36px" runat="server">
                                                <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                                <asp:ListItem Text="Terminated" Value="Terminated"></asp:ListItem>
                                                <asp:ListItem Text="Black List" Value="Black List"></asp:ListItem>
                                                <asp:ListItem Text="All" Value="All"></asp:ListItem>
                                            </asp:DropDownList>
                                        &nbsp;
                            <asp:Button ID="btnsearch" CssClass="btn btn-primary pull-left" runat="server" Text="Show"
                                OnClick="btnsearch_Click" />
                                        &nbsp;
                            <asp:Button ID="btnadd" CssClass="btn btn-success" runat="server" Text="Add New"
                                OnClick="btnadd_Click1" />
                                        &nbsp;
                                        
                                        <asp:ImageButton ID="btnExcel" ToolTip="Excel format to uplaod leave balance" ImageUrl="../../Image/Excel.png" Width="35px" Height="35px" runat="server"
                                            OnClick="btnExcel_Click" />
                                        &nbsp;
                                        <asp:ImageButton ID="btnCrRep" ToolTip="Export Data to Excel" ImageUrl="../../Image/cr.jpg" Width="35px" Height="35px" runat="server"
                                            OnClick="btnCrRep_Click" />

                                        <asp:Button ID="btnImport" Visible="false" CssClass="btn btn-danger" runat="server" Text="Import" OnClick="btnImport_Click" />
                                        &nbsp;      
                                        <asp:Button ID="btnBulkShift" CssClass="btn btn-danger pull-left" runat="server" Text="Bulk Salary" OnClick="btnBulkShift_Click" />

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:Panel ID="PanelGrid" Width="100%" runat="server">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <asp:Panel ID="Panel2" runat="server" Width="100%" ScrollBars="Horizontal">
                                        <asp:GridView ID="GridView1" CssClass="table table-striped search-table v-middle" runat="server"
                                            AutoGenerateColumns="false" DataKey="UserID" GridLines="None" OnRowCommand="GridView1_RowCommand">
                                            <Columns>
                                                <asp:BoundField DataField="SrNo" HeaderText="SrNo" SortExpression="SrNo" />
                                                <asp:TemplateField HeaderText="Name" HeaderStyle-Width="300px">
                                                    <ItemTemplate>
                                                        <div class="d-flex no-block align-items-center">
                                                            <div class="mr-2">
                                                                <img src="./ShowSmallImage.ashx?id='<%#Eval("UserID")%>'" alt="user" class="rounded-circle" />
                                                            </div>
                                                            <div class="">
                                                                <h5 class="mb-0 font-16 font-medium">
                                                                    <asp:Label ID="lblDateLeave" runat="server" Text='<%#Eval("NAME") %>'></asp:Label></h5>
                                                                <span>
                                                                    <asp:Label ID="Label634" ForeColor="Gray" runat="server" Text='<%#Eval("DESIGANTION") %>'></asp:Label></span>
                                                                <br />
                                                                <span>
                                                                    <asp:Label ID="Label7234" runat="server" ForeColor="Green" Text='<%#Eval("DEPARTMENT") %>'></asp:Label></span>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="BADGENUMBER" HeaderText="Emp Code" SortExpression="BADGENUMBER" />
                                                <asp:BoundField DataField="MachineCode" HeaderText="Machine Code" SortExpression="MachineCode" />
                                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />


                                                <asp:TemplateField HeaderText="View, PDF, Edit, Delete">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" ToolTip="View Record" CommandName="Views" CssClass="text-dark delete ml-2" CommandArgument='<%#Eval("UserID")%>'><i class="mdi mdi-account-search font-20 font-medium"></i></asp:LinkButton>
                                                        &nbsp; 
                                                            <asp:LinkButton ID="LinkButton2" runat="server" ToolTip="Export to PDF" CommandName="pdf" CssClass="text-dark delete ml-2" CommandArgument='<%#Eval("UserID")%>'><i class="mdi mdi-export font-20 font-medium"></i></asp:LinkButton>

                                                        &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" ToolTip="Edit Record" CommandName="Edits" CssClass="text-info edit" CommandArgument='<%#Eval("UserID")%>'><i class="mdi mdi-account-edit font-20 font-medium"></i></asp:LinkButton>
                                                        &nbsp;
                                                            <asp:LinkButton ID="SubmitBtn" runat="server" ToolTip="Delete Record" CommandName="Deletes" CssClass="delete-multiple text-danger" OnClientClick="if (!confirm('Are you sure you want to delete?')) return false;" CommandArgument='<%#Eval("UserID")%>'><i class="fas fa-trash font-16 font-medium"></i></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                            <EmptyDataTemplate>
                                                No Record Found !
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="PanelEdit" Width="100%" Visible="false" runat="server">
                    <div class="row">
                        <%--<div class="col-sm-12 col-lg-4">
                                
                            </div>--%>
                        <div class="col-sm-12 col-lg-12" style="float: right">

                            <div class="card">
                                <div class="card-body">
                                    <ul class="nav nav-tabs" role="tablist">


                                        <li class="nav-item"><a id="EmployeeInfo10" runat="server" class="nav-link active" data-toggle="tab" href="#EmployeeInfo"
                                            role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">Employee Info</span></a>
                                        </li>
                                        <li class="nav-item"><a id="Shift20" runat="server" class="nav-link" data-toggle="tab" href="#ShiftPanel" role="tab">
                                            <span class="hidden-sm-up"></span><span class="hidden-xs-down">Shift</span></a>
                                        </li>
                                        <li class="nav-item"><a id="Overtime30" runat="server" class="nav-link" data-toggle="tab" href="#Overtime"
                                            role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">Overtime</span></a>
                                        </li>

                                        <li class="nav-item"><a id="BlackList40" runat="server" class="nav-link" data-toggle="tab" href="#BlackList"
                                            role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">Black List</span></a>
                                        </li>

                                        <li class="nav-item"><a id="Fine60" runat="server" class="nav-link" data-toggle="tab" href="#Fine" role="tab">
                                            <span class="hidden-sm-up"></span><span class="hidden-xs-down">Fine</span></a>
                                        </li>
                                        <li class="nav-item"><a id="HolidayWorking70" runat="server" class="nav-link" data-toggle="tab" href="#HolidayWorking" role="tab">
                                            <span class="hidden-sm-up"></span><span class="hidden-xs-down">Holiday Working</span></a>
                                        </li>
                                        <li class="nav-item"><a id="Loan80" runat="server" class="nav-link" data-toggle="tab" href="#Loan" role="tab">
                                            <span class="hidden-sm-up"></span><span class="hidden-xs-down">Loan</span></a>
                                        </li>
                                        <li class="nav-item"><a id="Transfer90" runat="server" class="nav-link" data-toggle="tab" href="#Transfer" role="tab">
                                            <span class="hidden-sm-up"></span><span class="hidden-xs-down">Transfer Department</span></a>
                                        </li>
                                    </ul>
                                    <div class="tab-content tabcontent-border">
                                        <asp:Panel ClientIDMode="Static" runat="server" class="tab-pane active" ID="EmployeeInfo" role="tabpanel">
                                            <br />
                                            <%-- <h5 class="page-title">Employee Info</h5>--%>

                                            <div class="col-sm-12 col-lg-3" style="float: left">
                                                <div class="profile-pic mb-3 mt-3">
                                                    <asp:Image ID="Image1" runat="server" class="rounded-circle" />
                                                    <h4 class="mt-3 mb-0">
                                                        <asp:Label ID="lblName" runat="server"></asp:Label></h4>
                                                </div>
                                                <div style="width: 100%; text-align: left">
                                                    <div class="custom-file" style="float: left">
                                                        <asp:FileUpload ID="FileUpload1" CssClass="custom-file-input" runat="server" />
                                                        <label class="custom-file-label" for="validatedCustomFile">
                                                            Choose Photo...</label>
                                                    </div>
                                                    <div style="float: right; padding-top: 5px">
                                                        <asp:Button ID="btnUpload" CssClass="btn btn-success" runat="server" Text="Update"
                                                            OnClick="btnUpload_Click" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-12 col-lg-9" style="float: right">
                                                <div class="p-20">
                                                    <table style="width: 100%">
                                                        <tr class="row">
                                                            <td class="col-md-6">
                                                                <label class="control-label col-form-label">
                                                                    Name</label>
                                                                <asp:TextBox CssClass="form-control is-valid" autocomplete="off" ID="txtName" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    Father Name</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtFatherName" MaxLength="40"
                                                                    runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    Basic Salary</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtBaseSalary" runat="server"></asp:TextBox>
                                                            </td>



                                                        </tr>
                                                        <tr class="row">
                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    CNIC</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtCNIC" MaxLength="40"
                                                                    runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    Work Phone</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtWorkPhone" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    Joining Date</label>
                                                                <div class="input-prepend">
                                                                    <span class="add-on"><i class="icon-calendar"></i></span>
                                                                    <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtJoiningDate"
                                                                        runat="server"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    Designation</label>
                                                                <asp:DropDownList CssClass="form-control custom-select" ID="ddlDesignation" Height="36px"
                                                                    runat="server">
                                                                </asp:DropDownList>
                                                            </td>

                                                        </tr>
                                                        <tr class="row">
                                                            <td class="col-md-3">
                                                                <label class="m-t-15">
                                                                    Machine Code</label>
                                                                <div class="input-group">
                                                                    <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtMachineCode" Enabled="false"
                                                                        runat="server"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td class="col-md-3">
                                                                <label class="m-t-15">
                                                                    Date of Birth</label>
                                                                <div class="input-group">
                                                                    <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtDOB"
                                                                        runat="server"></asp:TextBox>
                                                                    <div class="input-group-append">
                                                                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="col-md-3">
                                                                <label class="m-t-15">
                                                                    Emergency Contact</label>
                                                                <div class="input-group">
                                                                    <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtEmergencyContact"
                                                                        runat="server"></asp:TextBox>
                                                                </div>
                                                            </td>

                                                            <td class="col-md-3">
                                                                <label class="m-t-15">
                                                                    Employee Code</label>
                                                                <div class="input-group">
                                                                    <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtEmployeeCode" MaxLength="40"
                                                                        runat="server"></asp:TextBox>
                                                                </div>
                                                            </td>


                                                        </tr>
                                                    </table>
                                                    <table style="width: 100%">
                                                        <tr class="row">
                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    Status</label>
                                                                <asp:DropDownList CssClass="form-control custom-select" ID="ddlStatus" Height="36px" runat="server">
                                                                    <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                                                    <asp:ListItem Text="Black List" Value="Black List"></asp:ListItem>
                                                                    <asp:ListItem Text="Terminated" Value="Terminated"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>

                                                            <td class="col-md-3">
                                                                <label class="m-t-15">
                                                                    Security Date</label>
                                                                <div class="input-group">
                                                                    <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtSecurityDate"
                                                                        runat="server"></asp:TextBox>
                                                                    <div class="input-group-append">
                                                                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                                    </div>
                                                                </div>
                                                            </td>

                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    Separation Date</label>
                                                                <div class="input-prepend">
                                                                    <span class="add-on"><i class="icon-calendar"></i></span>
                                                                    <asp:TextBox CssClass="form-control datepicker-autoclose" Enabled="false" autocomplete="off" ID="txtSeparationDate"
                                                                        runat="server"></asp:TextBox>
                                                                </div>
                                                            </td>

                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    Gender</label>
                                                                <asp:RadioButtonList CssClass="checkbox" ID="RBGender" CellPadding="3" CellSpacing="2"
                                                                    RepeatLayout="Table" RepeatDirection="Horizontal" runat="server">
                                                                    <asp:ListItem Text="Male" Value="Male" Selected="True"></asp:ListItem>
                                                                    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                                                    <asp:ListItem Text="None" Value="None"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </td>
                                                        </tr>
                                                    </table>

                                                    <hr />
                                                    <table style="width: 100%">
                                                        <tr class="row">
                                                            <td class="col-md-6">
                                                                <label class="control-label col-form-label">
                                                                    Street Address</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtStreetAddress" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-6">
                                                                <label class="control-label col-form-label">
                                                                    City</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtCity" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                        <tr class="row" style="padding-top: 20px">
                                                            <td class="col-md-6"></td>
                                                            <td class="col-md-6"></td>
                                                        </tr>
                                                    </table>

                                                    <table style="width: 100%">
                                                        <tr class="row">
                                                            <td class="col-md-6">
                                                                <label class="control-label col-form-label">
                                                                    Email</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtEmail" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-6">
                                                                <label class="control-label col-form-label">
                                                                    Home Phone</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtHomePhone" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                        <tr class="row">
                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    Emergency Phone</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtEmergencyPhone" runat="server"></asp:TextBox>
                                                            </td>

                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    Transfer Location Date</label>
                                                                <div class="input-prepend">
                                                                    <span class="add-on"><i class="icon-calendar"></i></span>
                                                                    <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtTransferDateLocation"
                                                                        runat="server"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    Transfer Location Time</label>
                                                                <asp:TextBox CssClass="form-control" TextMode="Time" autocomplete="off" ID="txtTransferDateLocationTime" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    Location</label>
                                                                <asp:DropDownList ID="ddlLocaction" CssClass="form-control custom-select" Height="36px" runat="server">
                                                                    <asp:ListItem Text="Estate 2 Loaders" Value="AF4C190360186"></asp:ListItem>
                                                                    <asp:ListItem Text="Estate 1 Loaders" Value="A3B7174960030"></asp:ListItem>
                                                                    <asp:ListItem Text="Kamonki Loaders" Value="ADZV222660163"></asp:ListItem>
                                                                    <asp:ListItem Text="New Warehouse Loaders" Value="ADZV231860165"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>


                                                        <tr class="row">
                                                             <td class="col-md-4">
                                                                <label class="control-label col-form-label">
                                                                    Relation Type</label>
                                                               <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtRelationType" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-4">
                                                                <label class="control-label col-form-label">
                                                                    Relation Employee Department</label>
                                                                <asp:DropDownList CssClass="form-control" Height="36px" Width="100%" ID="ddlDepRelation" runat="server"
                                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlDepRelation_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                            </td>

                                                            <td class="col-md-4">
                                                                <label class="control-label col-form-label">
                                                                    Relation Employee Name</label>
                                                                <asp:DropDownList Height="36px" ID="ddlEmployeeRelation" runat="server" CssClass="select2 form-control">
                                                                </asp:DropDownList>
                                                            </td>

                                                        </tr>

                                                    </table>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ClientIDMode="Static" runat="server" class="tab-pane  p-20" ID="ShiftPanel" role="tabpanel">
                                            <br />
                                            <div class="p-20">
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <label class="control-label">Select Date</label>
                                                        <div class="input-group">
                                                            <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtDateShiftBulk" placeholder="From Date" runat="server"></asp:TextBox>
                                                            <div class="input-group-append">
                                                                <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label class="control-label">Select Shift</label>
                                                        <asp:DropDownList Height="36px" ID="ddlShiftBulk" runat="server" CssClass="form-control">
                                                        </asp:DropDownList>
                                                    </div>

                                                    <div class="col-md-2" style="padding-top: 28px">
                                                        <asp:Button ID="btnShift" CssClass="btn btn-primary pull-left" runat="server" Text="Submit" OnClick="btnShift_Click" />

                                                    </div>
                                                </div>



                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ClientIDMode="Static" runat="server" class="tab-pane p-20" ID="Overtime" role="tabpanel">
                                            <br />
                                            <div class="p-20">

                                                <table style="width: 100%">
                                                    <tr class="row">
                                                        <td class="col-md-3">
                                                            <label class="control-label col-form-label">
                                                                Over time Allow</label>
                                                            <asp:CheckBox ID="CHKOvertimeAllow" Text="Over time Allow" CssClass="form-control" runat="server" />

                                                        </td>

                                                        <td class="col-md-3">
                                                            <label class="control-label col-form-label">
                                                                Over time Hours</label>
                                                            <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtOverTimeHours" placeholder="Over time Hours" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td class="col-md-3">
                                                            <label class="control-label col-form-label">
                                                                Over time Rate</label>
                                                            <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtOverTimeRate" placeholder="Over time Rate" runat="server"></asp:TextBox>
                                                        </td>
                                                        <%--  <td class="col-md-2" style="padding-top: 35px">
                                                                <asp:Button ID="Button3" CssClass="btn btn-primary pull-left" runat="server" Text="Submit" OnClick="btnSubmitLoan_Click" />
                                                            </td>--%>
                                                    </tr>
                                                </table>
                                            </div>
                                        </asp:Panel>

                                        <asp:Panel ClientIDMode="Static" runat="server" class="tab-pane p-20" ID="BlackList" role="tabpanel">
                                            <br />
                                            <div class="p-20">
                                                <table style="width: 100%">
                                                    <tr class="row">
                                                        <td class="col-md-3">
                                                            <label class="control-label col-form-label">
                                                                Black List</label>
                                                            <asp:CheckBox ID="CHKBlockList" Text="Black List" CssClass="form-control" runat="server" />
                                                        </td>

                                                        <td class="col-md-3">
                                                            <label class="control-label col-form-label">
                                                                Black List Remarks</label>
                                                            <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtBlackListRemarks" placeholder="Black List Remarks" runat="server"></asp:TextBox>
                                                        </td>

                                                        <td class="col-md-3">
                                                            <label class="control-label col-form-label">
                                                                Black List File</label>
                                                            <div class="custom-file" style="float: left">
                                                                <asp:FileUpload ID="FileUploadBlackListFile" CssClass="custom-file-input" runat="server" />
                                                                <label class="custom-file-label" for="validatedCustomFile">
                                                                    Choose File...</label>
                                                            </div>
                                                        </td>

                                                        <td class="col-md-3" style="padding-top: 35px">

                                                            <asp:Button ID="btnDownloadBlackListFile" CssClass="btn btn-primary pull-left" runat="server" Text="Download Black List File" OnClick="btnDownloadBlackListFile_Click" />
                                                        </td>




                                                    </tr>
                                                </table>
                                            </div>
                                        </asp:Panel>

                                        <asp:Panel ClientIDMode="Static" runat="server" class="tab-pane p-20" ID="Fine" role="tabpanel">
                                            <br />
                                            <div class="p-20">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div id="AlertFineW" class="alert alert-warning" role="alert" visible="false" runat="server">
                                                        </div>
                                                        <div id="AlertFineS" class="alert alert-success" role="alert" visible="false" runat="server">
                                                        </div>
                                                    </div>
                                                </div>
                                                <table style="width: 100%">
                                                    <tr class="row">
                                                        <td class="col-md-3">
                                                            <label class="control-label col-form-label">
                                                                Fine Amount</label>
                                                            <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtFineAmount" onkeypress="return IsNumericWithPercent(event);" ondrop="return false;" onpaste="return false;" placeholder="Fine Amount" MaxLength="40" runat="server"></asp:TextBox>
                                                        </td>

                                                        <td class="col-md-3">
                                                            <label class="control-label col-form-label">
                                                                Fine Date</label>
                                                            <div class="input-prepend">
                                                                <span class="add-on"><i class="icon-calendar"></i></span>
                                                                <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtFineDate" placeholder="Date" runat="server"></asp:TextBox>
                                                            </div>
                                                        </td>
                                                        <td class="col-md-3">
                                                            <label class="control-label col-form-label">
                                                                Fine Remarks</label>
                                                            <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtFineRemarks" placeholder="Fine Remarks" runat="server"></asp:TextBox>
                                                        </td>

                                                        <td class="col-md-2" style="padding-top: 35px">

                                                            <asp:Button ID="btnFine" CssClass="btn btn-primary pull-left" runat="server" Text="Submit" OnClick="btnFine_Click" />

                                                            <asp:Button ID="btnFineShow" CssClass="btn btn-info pull-left" runat="server" Text="Show" OnClick="btnFineShow_Click" />


                                                        </td>

                                                    </tr>
                                                </table>
                                                <br />
                                                <table style="width: 100%">
                                                    <tr class="row">
                                                        <td class="col-md-12">
                                                            <asp:GridView ID="GRDFine" AutoGenerateColumns="true" CssClass="table table-striped table-bordered"
                                                                GridLines="None" runat="server" OnRowCommand="GRDFine_RowCommand">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Delete">
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="ImageButton2ewrw" runat="server" CommandName="Deletes" ToolTip="Delete Record" ImageUrl="../../Image/Delete.png"
                                                                                OnClientClick="if (!confirm('Are you sure you want to delete?')) return false;"
                                                                                Width="25px" CommandArgument='<%#Eval("ID")%>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <EmptyDataTemplate>
                                                                    No Document Found !
                                                                </EmptyDataTemplate>
                                                            </asp:GridView>
                                                        </td>

                                                    </tr>
                                                </table>
                                            </div>
                                        </asp:Panel>

                                        <asp:Panel ClientIDMode="Static" runat="server" class="tab-pane p-20" ID="HolidayWorking" role="tabpanel">
                                            <br />
                                            <div class="p-20">
                                                <table style="width: 100%">
                                                    <tr class="row">
                                                        <td class="col-md-4">
                                                            <label class="control-label col-form-label">
                                                                Holiday Working Allow</label>
                                                            <asp:CheckBox ID="CHKHolidayWorking" Text="Holiday Working Allow" CssClass="form-control" runat="server" />
                                                        </td>
                                                        <td class="col-md-4">
                                                            <label class="control-label col-form-label">
                                                                Holiday Working Remarks</label>
                                                            <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtHolidayWorkingRemarks" placeholder="Holiday Working Remarks" runat="server"></asp:TextBox>
                                                        </td>

                                                        <%--   <td class="col-md-2" style="padding-top: 35px">

                                                                <asp:Button ID="Button4" CssClass="btn btn-primary pull-left" runat="server" Text="Submit" OnClick="btnSubmitLoan_Click" />
                                                            </td>--%>
                                                    </tr>
                                                </table>
                                            </div>
                                        </asp:Panel>

                                        <asp:Panel ClientIDMode="Static" runat="server" class="tab-pane p-20" ID="Loan" role="tabpanel">
                                            <br />
                                            <div class="p-20">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div id="AlertLoanW" class="alert alert-warning" role="alert" visible="false" runat="server">
                                                        </div>
                                                        <div id="AlertLoanS" class="alert alert-success" role="alert" visible="false" runat="server">
                                                        </div>
                                                    </div>
                                                </div>
                                                <table style="width: 100%">
                                                    <tr class="row">
                                                        <td class="col-md-2">
                                                            <label class="control-label col-form-label">
                                                                Total Amount</label>
                                                            <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtTotalAmount" onkeypress="return IsNumericWithPercent(event);" ondrop="return false;" onpaste="return false;" placeholder="Total Amount" MaxLength="40" runat="server"></asp:TextBox>

                                                        </td>
                                                        <td class="col-md-2">
                                                            <label class="control-label col-form-label">
                                                                Daily Amount</label>
                                                            <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtMonthlyAmount" onkeypress="return IsNumericWithPercent(event);" ondrop="return false;" onpaste="return false;" placeholder="Daily Amount" MaxLength="40" runat="server"></asp:TextBox>

                                                        </td>
                                                        <td class="col-md-3">
                                                            <label class="control-label col-form-label">
                                                                Description</label>
                                                            <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtDescription" placeholder="Description" MaxLength="40" runat="server"></asp:TextBox>

                                                        </td>

                                                        <td class="col-md-2">
                                                            <label class="control-label col-form-label">
                                                                Start Date</label>
                                                            <div class="input-prepend">
                                                                <span class="add-on"><i class="icon-calendar"></i></span>
                                                                <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtSartDate" placeholder="Start Date" runat="server"></asp:TextBox>

                                                            </div>

                                                        </td>

                                                        <td class="col-md-2" style="padding-top: 35px">

                                                            <asp:Button ID="btnSubmitLoan" CssClass="btn btn-primary pull-left" runat="server" Text="Submit" OnClick="btnSubmitLoan_Click1" />
                                                            <asp:Button ID="btnLoanShow" CssClass="btn btn-info pull-left" runat="server" Text="Show" OnClick="btnLoanShow_Click" />

                                                        </td>

                                                    </tr>
                                                </table>
                                                <br />
                                                <table style="width: 100%">
                                                    <tr class="row">
                                                        <td class="col-md-12">
                                                            <asp:GridView ID="GRDLoan" AutoGenerateColumns="true" CssClass="table table-striped table-bordered"
                                                                GridLines="None" runat="server" OnRowCommand="GRDLoan_RowCommand">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Delete">
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="ImageButton2ewrw" runat="server" CommandName="Deletes" ToolTip="Delete Record" ImageUrl="../../Image/Delete.png"
                                                                                OnClientClick="if (!confirm('Are you sure you want to delete?')) return false;"
                                                                                Width="25px" CommandArgument='<%#Eval("ID")%>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <EmptyDataTemplate>
                                                                    No Document Found !
                                                                </EmptyDataTemplate>
                                                            </asp:GridView>
                                                        </td>

                                                    </tr>
                                                </table>
                                            </div>
                                        </asp:Panel>

                                        <asp:Panel ClientIDMode="Static" runat="server" class="tab-pane p-20" ID="Transfer" role="tabpanel">
                                            <br />
                                            <div class="p-20">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div id="AlertTransW" class="alert alert-warning" role="alert" visible="false" runat="server">
                                                        </div>
                                                        <div id="AlertTransS" class="alert alert-success" role="alert" visible="false" runat="server">
                                                        </div>
                                                    </div>
                                                </div>
                                                <table style="width: 100%">
                                                    <tr class="row">
                                                        <td class="col-md-3">
                                                            <label class="control-label col-form-label">
                                                                Department</label>
                                                            <asp:DropDownList CssClass="form-control custom-select" ID="ddlDepartmentNew" Height="36px"
                                                                runat="server">
                                                            </asp:DropDownList>
                                                        </td>

                                                        <td class="col-md-3">
                                                            <label class="control-label col-form-label">
                                                                Transfer Date</label>
                                                            <div class="input-prepend">
                                                                <span class="add-on"><i class="icon-calendar"></i></span>
                                                                <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtTransferDate" placeholder="Date" runat="server"></asp:TextBox>
                                                            </div>
                                                        </td>
                                                        <td class="col-md-3">
                                                            <label class="control-label col-form-label">
                                                                Transfer Remarks</label>
                                                            <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtTransferRemarks" placeholder="Transfer Remarks" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td class="col-md-2" style="padding-top: 35px">
                                                            <asp:Button ID="btnTransfer" CssClass="btn btn-primary pull-left" runat="server" Text="Submit" OnClick="btnTransfer_Click" />
                                                            <asp:Button ID="btnTransferShow" CssClass="btn btn-info pull-left" runat="server" Text="Show" OnClick="btnTransferShow_Click" />


                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <table style="width: 100%">
                                                    <tr class="row">
                                                        <td class="col-md-12">
                                                            <asp:GridView ID="GRDTransferHistory" AutoGenerateColumns="true" CssClass="table table-striped table-bordered"
                                                                GridLines="None" runat="server">

                                                                <EmptyDataTemplate>
                                                                    No Document Found !
                                                                </EmptyDataTemplate>
                                                            </asp:GridView>
                                                        </td>

                                                    </tr>
                                                </table>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="PanelView" Width="100%" Visible="false" runat="server">
                    <div class="row">
                        <div class="col-sm-12 col-lg-4">
                            <div class="card">
                                <div class="card-body text-center">
                                    <div class="profile-pic mb-3 mt-3">
                                        <asp:Image ID="Image2" runat="server" class="rounded-circle" />
                                        <h4 class="mt-3 mb-0">
                                            <asp:Label ID="lblNameView" runat="server"></asp:Label></h4>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-sm-12 col-lg-8" style="float: right">
                            <div class="card">
                                <div class="card-body">
                                    <h4>Employee Info</h4>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Name :</strong><br />
                                            <p class="text-muted" id="Name" runat="server"></p>
                                        </div>
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Gender :</strong><br />
                                            <p class="text-muted" id="Gender" runat="server"></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Date of Birth :</strong><br />
                                            <p class="text-muted" id="DateofBirth" runat="server"></p>
                                        </div>
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Street Address :</strong><br />
                                            <p class="text-muted" id="StreetAddress" runat="server"></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>City :</strong><br />
                                            <p class="text-muted" id="City" runat="server"></p>
                                        </div>
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Postal Code :</strong><br />
                                            <p class="text-muted" id="PostalCode" runat="server"></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Country :</strong><br />
                                            <p class="text-muted" id="Country" runat="server"></p>
                                        </div>
                                        <div class="col-md-6 col-xs-6 b-r"></div>
                                        <p class="text-muted" id="Td7" runat="server"></p>
                                    </div>
                                    <hr />
                                    <h4>Contact Info</h4>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Email :</strong><br />
                                            <p class="text-muted" id="Email" runat="server"></p>
                                        </div>
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Home Phone :</strong><br />
                                            <p class="text-muted" id="HomePhone" runat="server"></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Work Phone :</strong><br />
                                            <p class="text-muted" id="WorkPhone" runat="server"></p>
                                        </div>
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Emergency Contact :</strong><br />
                                            <p class="text-muted" id="EmergencyContact" runat="server"></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Emergency Phone :</strong><br />
                                            <p class="text-muted" id="EmergencyPhone" runat="server"></p>
                                        </div>
                                        <div class="col-md-6 col-xs-6 b-r"></div>
                                        <p class="text-muted" id="Td4" runat="server"></p>
                                    </div>
                                    <hr />
                                    <h4>Employment Info</h4>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Hire Date :</strong><br />
                                            <p class="text-muted" id="HireDate" runat="server"></p>
                                        </div>
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Joining Date :</strong><br />
                                            <p class="text-muted" id="JoiningDate" runat="server"></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Basic Salary :</strong><br />
                                            <p class="text-muted" id="BasicSalary" runat="server"></p>
                                        </div>
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <b><span>Employment </span></b><strong>Status : </strong>
                                            <br />
                                            <p class="text-muted" id="Status" runat="server"></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Payment Method : </strong>
                                            <br />
                                            <p class="text-muted" id="PaymentMethod" runat="server"></p>
                                        </div>
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Employee Type :</strong><br />
                                            <p class="text-muted" id="EmployeeType" runat="server"></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Bank Name :</strong><br />
                                            <p class="text-muted" id="BankName" runat="server"></p>
                                        </div>
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Branch :</strong><br />
                                            <p class="text-muted" id="Branch" runat="server"></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Account Title :</strong><br />
                                            <p class="text-muted" id="AccountTitle" runat="server"></p>
                                        </div>
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Branch Code :</strong><br />
                                            <p class="text-muted" id="BranchCode" runat="server"></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Account No :</strong><br />
                                            <p class="text-muted" id="AccountNo" runat="server"></p>
                                        </div>
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Swift Code :</strong><br />
                                            <p class="text-muted" id="SwiftCode" runat="server"></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Location :</strong><br />
                                            <p class="text-muted" id="Location" runat="server"></p>
                                        </div>
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Designation :</strong><br />
                                            <p class="text-muted" id="Designation" runat="server"></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Department :</strong><br />
                                            <p class="text-muted" id="Department" runat="server"></p>
                                        </div>
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>CNIC :</strong><br />
                                            <p class="text-muted" id="CNIC" runat="server"></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-6 b-r">
                                            <strong>Employee Code :</strong><br />
                                            <p class="text-muted" id="EmployeeCode" runat="server"></p>
                                        </div>
                                        <%--<div class="col-md-6 col-xs-6 b-r"></div>
                                            <p class="text-muted" id="Td14" runat="server" ></p></div>--%>
                                    </div>
                                    <hr />
                                    <h4>Allowance</h4>
                                    <asp:GridView ID="GRDAllowanceView" CssClass="table table-striped table-bordered"
                                        GridLines="None" AutoGenerateColumns="true" runat="server">
                                        <FooterStyle BackColor="LightGreen" />
                                    </asp:GridView>
                                    <hr />
                                    <h4>Deduction</h4>
                                    <asp:GridView ID="GRDDeductionView" CssClass="table table-striped table-bordered"
                                        GridLines="None" AutoGenerateColumns="true" runat="server">
                                        <FooterStyle BackColor="LightGreen" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>

                </asp:Panel>
            </div>
            </div>

            <div class="modal fade" id="Modal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true ">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel1">
                                <%--Head popup--%>Upload Employee Record</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true ">&times;</span>
                            </button>
                        </div>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                        <div class="modal-body">
                            <div class="input-group" style="float: left; width: 100%">
                                Excel format : 
                         &nbsp; 
                        
                                &nbsp; 
                         <asp:FileUpload ID="FileUpload2" CssClass="btn btn-primary pull-left" runat="server" Width="250px" />
                                &nbsp; 
                         <asp:Button ID="Import" ToolTip="Select Excel file then Click" CssClass="btn btn-primary pull-left" runat="server" Text="Import" OnClick="Import_Click" />
                            </div>
                            <div class="input-group" style="float: left; width: 100%">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="Modal4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true ">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <!-- Card -->
                        <div class="card">
                            <img class="card-img-top img-responsive" src="../../assets/images/big/img1.jpg" alt="Card image cap">
                            <div class="card-body">
                                <h4 class="card-title">Card title</h4>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="javascript:void(0)" class="btn btn-primary">Go somewhere</a>
                            </div>
                        </div>
                        <!-- Card -->
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnUpload" />
            <asp:PostBackTrigger ControlID="GridView1" />
            <asp:PostBackTrigger ControlID="btnExcel" />
            <asp:PostBackTrigger ControlID="Import" />
            <asp:PostBackTrigger ControlID="btnCrRep" />
             <asp:PostBackTrigger ControlID="btnadd" />
              <asp:PostBackTrigger ControlID="btnDownloadBlackListFile" />

            
          
        </Triggers>
    </asp:UpdatePanel>
    <div class="modal fade" id="Modal10" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true ">
        <div class="modal-dialog" role="document ">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Bulk Salary Assign to Employees</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true ">&times;</span>
                    </button>
                </div>
                <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">Department</label>
                                    <asp:ListBox SelectionMode="Multiple" CssClass="select2 form-control m-t-15" Height="36px" Width="100%" ID="ddlDeptShiftBulk" runat="server"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlDeptShiftBulk_SelectedIndexChanged"></asp:ListBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">Employee</label>
                                    <asp:DropDownList Height="36px" ID="ddlEmpShiftBulk" runat="server" CssClass="form-control custom-select">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">Salary</label>
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtSalary" placeholder="Salary" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="input-group" style="float: left; width: 100%">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnInsert" OnClientClick=" return  checkvalid()" CssClass="btn btn-primary pull-left" runat="server"
                                Text="Save" OnClick="btnInsert_Click" />
                            <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Close</button>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true">
        <ProgressTemplate>
            <div style="background-color: Gray; filter: alpha(opacity=60); opacity: 0.60; width: 100%; top: 0px; left: 0px; position: fixed; height: 100%;">
            </div>
            <div style="margin: auto; font-family: Trebuchet MS; filter: alpha(opacity=100); opacity: 1; font-size: small; vertical-align: middle; position: fixed; left: 55%; color: #275721; text-align: center; height: 100px;">
                <table>
                    <tr>
                        <td style="text-align: center;">
                            <img src="../../Image/ajax_loader_gray_49.gif" width="60" /></td>
                    </tr>
                </table>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
