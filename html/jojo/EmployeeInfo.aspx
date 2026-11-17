<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="Attendance_EmployeeInfo, App_Web_5bk21qbu" %>

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
                                    <div class="input-group" style="float: left; width: 100%">
                                        &nbsp;
                            <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddlDepartmentLocation"
                                runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDepartmentLocation_SelectedIndexChanged">
                                <asp:ListItem Text="Department" Value="Department"></asp:ListItem>
                                <asp:ListItem Text="Location" Value="Location"></asp:ListItem>
                            </asp:DropDownList>
                                        &nbsp;
                            <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddldepartment"
                                runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddldepartment_SelectedIndexChanged">
                            </asp:DropDownList>
                                        &nbsp;
                            <asp:DropDownList CssClass="select2 form-control custom-select" Style="height: 36px;" Height="36px" ID="ddlemployee" runat="server">
                            </asp:DropDownList>
                                        &nbsp;
                            <asp:Button ID="btnsearch" CssClass="btn btn-primary pull-left" runat="server" Text="Show"
                                OnClick="btnsearch_Click" />
                                        &nbsp;
                            <asp:Button ID="btnadd" CssClass="btn btn-success" runat="server" Text="Add New"
                                OnClick="btnadd_Click1" />
                                        &nbsp;        
                                    <asp:Button ID="btnImport" CssClass="btn btn-danger" runat="server" Text="Import" OnClick="btnImport_Click" />
                                       
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
                                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                                    <asp:BoundField DataField="Authority" HeaderText="Authority" SortExpression="Authority" />

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
                            <div class="col-sm-12 col-lg-4">
                                <div class="card">
                                    <div class="card-body text-center">
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

                                </div>
                            </div>
                            <div class="col-sm-12 col-lg-8" style="float: right">
                                <div class="card">
                                    <div class="card-body">
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li class="nav-item"><a id="EmployeeInfo10" runat="server" class="nav-link active" data-toggle="tab" href="#EmployeeInfo"
                                                role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">Employee Info</span></a>
                                            </li>
                                            <li class="nav-item"><a id="ContactInfo20" runat="server" class="nav-link" data-toggle="tab" href="#ContactInfo" role="tab">
                                                <span class="hidden-sm-up"></span><span class="hidden-xs-down">Contact Info</span></a>
                                            </li>
                                            <li class="nav-item"><a id="EmploymentInfo30" runat="server" class="nav-link" data-toggle="tab" href="#EmploymentInfo"
                                                role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">Employment Info</span></a>
                                            </li>

                                            <li class="nav-item"><a id="Payroll40" runat="server" class="nav-link" data-toggle="tab" href="#Payroll"
                                                role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">Payroll</span></a>
                                            </li>

                                            <li class="nav-item"><a id="Security60" runat="server" class="nav-link" data-toggle="tab" href="#Security" role="tab">
                                                <span class="hidden-sm-up"></span><span class="hidden-xs-down">Security</span></a>
                                            </li>
                                            <li class="nav-item"><a id="Files70" runat="server" class="nav-link" data-toggle="tab" href="#Files" role="tab">
                                                <span class="hidden-sm-up"></span><span class="hidden-xs-down">Files</span></a>
                                            </li>
                                        </ul>
                                        <div class="tab-content tabcontent-border">
                                            <asp:Panel ClientIDMode="Static" runat="server" class="tab-pane active" ID="EmployeeInfo" role="tabpanel">
                                                <div class="p-20">
                                                    <table style="width: 100%">
                                                        <tr class="row">
                                                            <td class="col-md-6">
                                                                <label class="control-label col-form-label">
                                                                    Name</label>
                                                                <asp:TextBox CssClass="form-control is-valid" autocomplete="off" ID="txtName" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-6">
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
                                                        <tr class="row">
                                                            <td class="col-md-6">
                                                                <label class="m-t-15">
                                                                    Machine Code</label>
                                                                <div class="input-group">
                                                                    <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtMachineCode" Enabled="false"
                                                                        runat="server"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td class="col-md-6">
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
                                                        <tr class="row">
                                                            <td class="col-md-6">
                                                                <label class="control-label col-form-label">
                                                                    Postal Code</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtPostalCode" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-6">
                                                                <label class="control-label col-form-label">
                                                                    Country</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtCountry" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr class="row" style="padding-top: 20px">
                                                            <td class="col-md-6"></td>
                                                            <td class="col-md-6"></td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </asp:Panel>
                                            <asp:Panel ClientIDMode="Static" runat="server" class="tab-pane  p-20" ID="ContactInfo" role="tabpanel">
                                                <div class="p-20">
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
                                                            <td class="col-md-6">
                                                                <label class="control-label col-form-label">
                                                                    Work Phone</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtWorkPhone" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-6">
                                                                <label class="control-label col-form-label">
                                                                    Emergency Contact</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtEmergencyContact"
                                                                    runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr class="row">
                                                            <td class="col-md-6">
                                                                <label class="control-label col-form-label">
                                                                    Emergency Phone</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtEmergencyPhone" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td style="padding-bottom: 12px; text-align: left"></td>
                                                            <td class="col-md-6">
                                                        </tr>
                                                    </table>
                                                </div>
                                            </asp:Panel>
                                            <asp:Panel ClientIDMode="Static" runat="server" class="tab-pane p-20" ID="EmploymentInfo" role="tabpanel">
                                                <div class="p-20">
                                                    <table style="width: 100%">
                                                        <tr class="row">
                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    Hire Date</label>
                                                                <div class="input-prepend">
                                                                    <span class="add-on"><i class="icon-calendar"></i></span>
                                                                    <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtHireDat"
                                                                        runat="server"></asp:TextBox>
                                                                </div>
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
                                                                    Basic Salary</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtBaseSalary" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    Status</label>
                                                                <asp:DropDownList CssClass="form-control custom-select" ID="ddlStatus" Height="36px" runat="server">
                                                                    <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                                                    <asp:ListItem Text="Inctive" Value="Inactive"></asp:ListItem>
                                                                    <asp:ListItem Text="Terminated" Value="Terminated"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr class="row">
                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    Payment Method</label>
                                                                <asp:DropDownList CssClass="form-control custom-select" ID="ddlSalaryPaymentMethod"
                                                                    Height="36px" runat="server">
                                                                    <asp:ListItem Text="Bank Transfer" Value="Bank Transfer"></asp:ListItem>
                                                                    <asp:ListItem Text="Cash" Value="Cash"></asp:ListItem>
                                                                    <asp:ListItem Text="Cheque" Value="Cheque"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    Employee Type</label>
                                                                <asp:DropDownList CssClass="form-control custom-select" ID="ddlEmployeeType" Height="36px"
                                                                    runat="server">
                                                                    <asp:ListItem Text="Permanent" Value="Permanent"></asp:ListItem>
                                                                    <asp:ListItem Text="Contact" Value="Contact"></asp:ListItem>
                                                                    <asp:ListItem Text="Internship" Value="Internship"></asp:ListItem>
                                                                    <asp:ListItem Text="Extended Probation" Value="Extended Probation"></asp:ListItem>
                                                                    <asp:ListItem Text="Probation" Value="Probation"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    Bank Name</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtBankName" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    Branch</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtBranch" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr class="row">
                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    Account Title</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtAccountTitle" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    Branch Code</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtBranch_Code" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    Account No</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtAccountNo" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-3">
                                                                <label class="control-label col-form-label">
                                                                    Swift Code</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtSwiftCode" MaxLength="40"
                                                                    runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table>
                                                        <tr class="row">
                                                            <td class="col-md-4">
                                                                <label class="control-label col-form-label">
                                                                    Location</label>
                                                                <asp:DropDownList ID="ddlLocaction" CssClass="form-control custom-select" Height="36px"
                                                                    runat="server">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td class="col-md-4">
                                                                <label class="control-label col-form-label">
                                                                    Designation</label>
                                                                <asp:DropDownList CssClass="form-control custom-select" ID="ddlDesignation" Height="36px"
                                                                    runat="server">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td class="col-md-4">
                                                                <label class="control-label col-form-label">
                                                                    Department</label>
                                                                <asp:DropDownList CssClass="form-control custom-select" ID="ddlDepartmentNew" Height="36px"
                                                                    runat="server">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td class="col-md-4">
                                                                <label class="control-label col-form-label">
                                                                    CNIC</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtCNIC" MaxLength="40"
                                                                    runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-4">
                                                                <label class="control-label col-form-label">
                                                                    Employee Code</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtEmployeeCode" MaxLength="40"
                                                                    runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-4">
                                                                <label class="control-label col-form-label">
                                                                    Separation Date</label>
                                                                <div class="input-prepend">
                                                                    <span class="add-on"><i class="icon-calendar"></i></span>
                                                                    <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtSeparationDate"
                                                                        runat="server"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </asp:Panel>

                                            <asp:Panel ClientIDMode="Static" runat="server" class="tab-pane p-20" ID="Payroll" role="tabpanel">
                                                <div class="p-20">
                                                    <br />
                                                    <h5 class="card-title">PF</h5>

                                                    <table style="width: 100%">
                                                        <tr class="row">
                                                            <td class="col-md-4">
                                                                <label class="control-label col-form-label">Type</label>
                                                                <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddlPFType" runat="server">
                                                                    <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                                                    <asp:ListItem Text="Percentage" Value="Percentage"></asp:ListItem>
                                                                    <asp:ListItem Text="Amount" Value="Amount"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td class="col-md-4">
                                                                <label class="control-label col-form-label">Employeer Contribution</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtPF_EmployeerContribution" onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;" MaxLength="40" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-4">
                                                                <label class="control-label col-form-label">Employee Contribution</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtPF_EmployeeContribution" onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;" MaxLength="40" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <hr />
                                                    <h5 class="card-title">SSES</h5>
                                                    <table style="width: 100%">
                                                        <tr class="row">
                                                            <td class="col-md-4">
                                                                <label class="control-label col-form-label">Type</label>
                                                                <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddlSSESType" runat="server">
                                                                    <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                                                    <asp:ListItem Text="Percentage" Value="Percentage"></asp:ListItem>
                                                                    <asp:ListItem Text="Amount" Value="Amount"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>

                                                            <td class="col-md-4">
                                                                <label class="control-label col-form-label">Employeer Contri..</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtSESS_EmployeerContribution" onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;" MaxLength="40" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-4">
                                                                <label class="control-label col-form-label">Employee Contri..</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtSESS_EmployeeContribution" onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;" MaxLength="40" runat="server"></asp:TextBox>
                                                            </td>

                                                        </tr>
                                                    </table>


                                                    <hr />
                                                    <h5 class="card-title">EOBI</h5>
                                                    <table style="width: 100%">
                                                        <tr class="row">
                                                            <td class="col-md-4">
                                                                <label class="control-label col-form-label">Type</label>
                                                                <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddlEOBIType" runat="server">
                                                                    <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                                                    <asp:ListItem Text="Percentage" Value="Percentage"></asp:ListItem>
                                                                    <asp:ListItem Text="Amount" Value="Amount"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td class="col-md-4">
                                                                <label class="control-label col-form-label">Employeer Contribution</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtEOBI_EmployeerContribution" onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;" MaxLength="40" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-4">
                                                                <label class="control-label col-form-label">Employee Contribution</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtEOBI_EmployeeContribution" onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;" MaxLength="40" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                    </table>
                                                    <hr />
                                                    <h5 class="card-title">Tax</h5>
                                                    <table style="width: 100%">
                                                        <tr class="row">
                                                            <td class="col-md-4">
                                                                <label class="control-label col-form-label">Type</label>
                                                                <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddlTaxType" runat="server">
                                                                    <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                                                    <asp:ListItem Text="Govt Policy" Value="Govt Policy"></asp:ListItem>
                                                                    <asp:ListItem Text="Tax Free" Value="Tax Free"></asp:ListItem>
                                                                    <asp:ListItem Text="Fix Amount Per Month" Value="Fix Amount Per Month"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td class="col-md-8">
                                                                <label class="control-label col-form-label">Fix Amount Per Month</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtFixAmountPerMonth" Text="0" onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;" MaxLength="40" runat="server"></asp:TextBox>
                                                            </td>

                                                        </tr>

                                                    </table>



                                                </div>
                                            </asp:Panel>





                                            <asp:Panel ClientIDMode="Static" runat="server" class="tab-pane p-20" ID="Security" role="tabpanel">
                                                <div class="p-20">
                                                    <table>
                                                        <tr class="row">
                                                            <td class="col-md-4">
                                                                <label class="control-label col-form-label">
                                                                    Security Role</label>
                                                                <asp:DropDownList CssClass="form-control custom-select" ID="ddlSecurityRole" Height="36px"
                                                                    runat="server">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td class="col-md-4">
                                                                <label class="control-label col-form-label">
                                                                    LeaveEntryDays</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtLeaveEntryDays" MaxLength="250"
                                                                    runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-4">
                                                                <label class="control-label col-form-label">
                                                                    Password</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtPassword" MaxLength="250"
                                                                    runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="col-md-12">
                                                                <label class="control-label col-form-label">
                                                                    Record level authority</label>
                                                                <div>
                                                                    &nbsp;
                                                <asp:CheckBox ID="chkcoo" Text="COO" runat="server" />&nbsp;&nbsp;
                                                <asp:CheckBox ID="chkhr" Text="HR" runat="server" />
                                                                    &nbsp;&nbsp;
                                                <asp:CheckBox ID="chkhod" Text="HOD" runat="server" />
                                                                    &nbsp;&nbsp;
                                                <asp:CheckBox ID="chkSecondIn" Text="Second In" runat="server" />
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </asp:Panel>

                                            <asp:Panel ClientIDMode="Static" runat="server" class="tab-pane p-20" ID="Files" role="tabpanel">
                                                <div class="p-20">
                                                    <table>
                                                        <tr class="row">
                                                            <td class="col-md-5">
                                                                <label class="control-label col-form-label">
                                                                    File Name</label>
                                                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtFileName" MaxLength="250"
                                                                    runat="server"></asp:TextBox>
                                                            </td>

                                                            <td class="col-md-5">
                                                                <label class="control-label col-form-label">
                                                                    File</label>
                                                                <div class="custom-file" style="float: left">
                                                                    <asp:FileUpload ID="FileUploadEmpDoc" CssClass="custom-file-input" runat="server" />
                                                                    <label class="custom-file-label" for="validatedCustomFile">
                                                                        Choose File</label>
                                                                </div>

                                                            </td>

                                                            <td class="col-md-2" style="padding-top: 35px">
                                                                <asp:Button ID="btnUploadEmpDoc" CssClass="btn btn-success" runat="server" Text="Upload" OnClick="btnUploadEmpDoc_Click" />
                                                            </td>

                                                        </tr>
                                                    </table>
                                                    <table>
                                                        <tr class="row">
                                                            <td class="col-md-12">
                                                                <asp:GridView ID="grdEmpFile" AutoGenerateColumns="false" ShowFooter="true" CssClass="table table-striped table-bordered"
                                                                    GridLines="None" runat="server" OnRowCommand="grdEmpFile_RowCommand">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Download Here">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton Text='<%# Eval("FileName") %>' ID="lnkDownload" runat="server" CausesValidation="False" CommandArgument='<%# Eval("ID") %>'
                                                                                    CommandName='<%# Eval("ID") %>' />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="FileName" HeaderText="File Name" />
                                                                        <asp:BoundField DataField="CVDocType" HeaderText="File Type" />
                                                                        <asp:BoundField DataField="FileDescription" HeaderText="File Description" />

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
                                    <div class="p-25 border-top mt-3">
                                        <div class="row text-center">
                                            <div class="col-6 border-right">
                                                <a href="#" class="link d-flex align-items-center justify-content-center font-medium"><i class="mdi mdi-message font-20 mr-1"></i>Message</a>
                                            </div>
                                            <div class="col-6">
                                                <a href="#" class="link d-flex align-items-center justify-content-center font-medium"><i class="mdi mdi-developer-board font-20 mr-1"></i>Portfolio</a>
                                            </div>
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
                                        <asp:GridView ID="GRDAllowanceView" ShowFooter="true" CssClass="table table-striped table-bordered"
                                            GridLines="None" AutoGenerateColumns="true" runat="server">
                                            <FooterStyle BackColor="LightGreen" />
                                        </asp:GridView>
                                        <hr />
                                        <h4>Deduction</h4>
                                        <asp:GridView ID="GRDDeductionView" ShowFooter="true" CssClass="table table-striped table-bordered"
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
                        <asp:ImageButton ID="btnExcel" ToolTip="Excel format to uplaod leave balance" ImageUrl="../../Image/Excel.png" Width="35px" Height="35px" runat="server"
                            OnClick="btnExcel_Click" />
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

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnUpload" />
            <asp:PostBackTrigger ControlID="GridView1" />
            <asp:PostBackTrigger ControlID="btnExcel" />
            <asp:PostBackTrigger ControlID="Import" />
            <asp:PostBackTrigger ControlID="btnUploadEmpDoc" />
            <asp:PostBackTrigger ControlID="grdEmpFile" />

        </Triggers>
    </asp:UpdatePanel>
    
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

