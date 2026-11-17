<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="Attendance_HOShift, App_Web_5bk21qbu" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title"><%--Heading--%>Head Office Employee Shifts</h4>
                    </div>
                </div>
            </div>
            <br />
            <div class="container-fluid">
                <asp:Label ID="Label2" Visible="false" runat="server"></asp:Label>
                <div class="row">
                    <div class="col-12">
                        <div id="Alert" class="alert alert-warning" role="alert" visible="false" runat="server">
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <div class="input-group" style="float: left; width: 100%">
                                    <%--Search--%>
                                   &nbsp;   
                             <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddldepartment" runat="server"
                                 AutoPostBack="true" OnSelectedIndexChanged="ddldepartment_SelectedIndexChanged">
                             </asp:DropDownList>
                                    &nbsp;      
                                        <asp:DropDownList CssClass="select2 form-control custom-select" Height="36px" ID="ddlemployee" runat="server">
                                        </asp:DropDownList>
                                    &nbsp;      
                                        <asp:Button ID="btnsearch" CssClass="btn btn-primary pull-left" runat="server" Text="Show" OnClick="btnsearch_Click" />
                                    &nbsp;      
                                        <asp:Button ID="btnBulkShift" CssClass="btn btn-info pull-left" runat="server" Text="Bulk Shift" OnClick="btnBulkShift_Click" />
                                     &nbsp;
                                        <asp:ImageButton ID="btnExcel" ToolTip="Export Data to Excel" ImageUrl="../../Image/Excel.png" Width="35px" Height="35px" runat="server"
                                            OnClick="btnExcel_Click" />
                                     &nbsp;      
                                        <asp:Button ID="btnUpdateAllShift" Visible="false" CssClass="btn btn-success pull-left" runat="server" Text="Update All Shift" OnClick="btnUpdateAllShift_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Head Office Employee Shifts</h5>

                                <asp:Panel ID="Panel1" runat="server" Width="100%" ScrollBars="Horizontal">
                                    <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false"
                                        DataKey="USERID" GridLines="None" DataKeyNames="USERID"
                                        OnRowDataBound="GridView1_RowDataBound" AllowPaging="True" PageSize="10" OnPageIndexChanging="GridView1_PageIndexChanging">
                                        <Columns>
                                            <asp:TemplateField HeaderText="UserID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="UserID" runat="server" Text='<%# Eval("USERID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="Date" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Badgenumber" HeaderText="Badgenumber" SortExpression="Badgenumber" />
                                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                            <asp:BoundField DataField="DEPTNAME" HeaderText="Department" SortExpression="DEPTNAME" />
                                            
                                            <asp:BoundField DataField="ShiftName" HeaderText="Shift Name" SortExpression="ShiftName" />
                                            <asp:BoundField DataField="Date" HeaderText="Implemeneted Till Date" SortExpression="Date" />
                                            <asp:TemplateField HeaderText="Implementation Date">
                                                <ItemTemplate>
                                                    <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtDateGRD" Width="150px" PopupPosition="TopLeft" runat="server" ></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Shift">
                                                <ItemTemplate>
                                                    <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddlShift" runat="server"
                                                        AutoPostBack="True" OnSelectedIndexChanged="ddlShift_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Setup" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="SetupID" runat="server" Text='<%# Eval("Setupid") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Store" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="StoreID" runat="server" Text='<%# Eval("StoreID") %>'></asp:Label>
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
            </div>
        </ContentTemplate>
      <Triggers>
            <asp:PostBackTrigger ControlID="btnExcel" />
            
        </Triggers>
    </asp:UpdatePanel>
    <div class="modal fade" id="Modal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true ">
        <div class="modal-dialog" role="document ">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Bulk Shift Assign to Employees</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true ">&times;</span>
                    </button>
                </div>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">Department</label>
                                    <asp:ListBox SelectionMode="Multiple" CssClass="select2 form-control m-t-15" Height="36px" Width="100%" ID="ddlDeptShiftBulk" runat="server"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlDeptShiftBulk_SelectedIndexChanged">
                                    </asp:ListBox>
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
                                <div class="col-md-6">
                                    <label class="control-label">Select Date</label>
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtDateShiftBulk" placeholder="From Date" runat="server"></asp:TextBox>
                                        <div class="input-group-append">
                                            <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">Select Shift</label>
                                    <asp:DropDownList Height="36px" ID="ddlShiftBulk" runat="server" CssClass="form-control custom-select" OnSelectedIndexChanged="ddlShiftBulk_SelectedIndexChanged">
                                    </asp:DropDownList>
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
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div style="background-color: black; filter: alpha(opacity=60); opacity: 0.60; width: 100%; top: 0px; left: 0px; position: fixed; height: 100%;">
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
