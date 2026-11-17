<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="Attendance_Shift, App_Web_5bk21qbu" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function Clr() {
            PageMethods.Clear();  
        }
        function LateSittingOverTime() {
            if ((document.getElementById("<%= ddlLateSittinOverTime.ClientID %>").value == "Late Sitting")) {
                document.getElementById("<%= OverTime.ClientID %>").style.display = 'none';
                document.getElementById("<%= LateSitting.ClientID %>").style.display = '';
                document.getElementById("txtOverTimePerMonth").value = "0";
                document.getElementById("txtOverTimePerDay").value = "0";
            }
            else {
                document.getElementById("<%= OverTime.ClientID %>").style.display = '';
                document.getElementById("<%= LateSitting.ClientID %>").style.display = 'none';
                document.getElementById("<%=txtLateSittingMinuts.ClientID %>").value == ""
            }
        }
        document.onreadystatechange = function () {
            if (document.readyState === "complete") {
                HideTimePeriod();
            }
            else {
                window.onload = function () {
                    HideTimePeriod();
                };
            };
        }
        function HideTimePeriod() {
            document.getElementById("<%= OverTime.ClientID %>").style.display = 'none';
            document.getElementById("<%= LateSitting.ClientID %>").style.display = 'none';
        }
    </script>
<%--    <script type="text/javascript">
        function checkvalid() {
            if (document.getElementById("<%=txtShiftINDaywise.ClientID %>").value == "") {
                document.getElementById("<%=lblMessage.ClientID%>").innerHTML = "Enter Shift IN  !";
                document.getElementById("<%=txtShiftINDaywise.ClientID %>").focus();
                return false;
            }
            if (document.getElementById("<%=txtShiftOUTDaywise.ClientID %>").value == "") {
                document.getElementById("<%=lblMessage.ClientID%>").innerHTML = "Enter Shift OUT !";
                document.getElementById("<%=txtShiftOUTDaywise.ClientID %>").focus();
                return false;
            }
            if (document.getElementById("<%=txtFromBreakTime.ClientID %>").value == "") {
                document.getElementById("<%=lblMessage.ClientID%>").innerHTML = "Enter Break From Time !";
                document.getElementById("<%=txtFromBreakTime.ClientID %>").focus();
                return false;
            }
            if (document.getElementById("<%=txtToBreakTime.ClientID %>").value == "") {
                document.getElementById("<%=lblMessage.ClientID%>").innerHTML = "Enter Break To Time !";
                document.getElementById("<%=txtToBreakTime.ClientID %>").focus();
                return false;
            }
            if (document.getElementById("<%=txtShortDayMinuts.ClientID %>").value == "") {
                document.getElementById("<%=lblMessage.ClientID%>").innerHTML = "Enter Short Day Minuts !";
                document.getElementById("<%=txtShortDayMinuts.ClientID %>").focus();
                return false;
            }
            if (document.getElementById("<%=txtHalfDayMinuts.ClientID %>").value == "") {
                document.getElementById("<%=lblMessage.ClientID%>").innerHTML = "Enter Half Day Minuts !";
                document.getElementById("<%=txtHalfDayMinuts.ClientID %>").focus();
                return false;
            }
            return true;
        }
    </script>--%>
    <script type="text/javascript">
        function checkvalidShift() {
            if (document.getElementById("<%=txtName.ClientID %>").value == "") {
                document.getElementById("<%=lblMessage.ClientID%>").innerHTML = "Enter Shift Name !";
                document.getElementById("<%=txtName.ClientID %>").focus();
                return false;
            }
            return true;
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title"><%--Heading--%>Master Shift Setup</h4>
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
                                    <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddlsearch" runat="server">
                                        <asp:ListItem Text="ID" Value="01"></asp:ListItem>
                                        <asp:ListItem Text="Name" Value="02"></asp:ListItem>
                                        <%-- <asp:ListItem Text="Description" Value="03"></asp:ListItem>--%>
                                    </asp:DropDownList>
                                    &nbsp;          
                            <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtsearch" runat="server"></asp:TextBox>
                                    &nbsp;           
                            <asp:Button ID="btnsearch" CssClass="btn btn-primary pull-left" runat="server" Text="Show" OnClick="btnsearch_Click" />
                                    &nbsp;           
                            <asp:Button ID="btnadd" CssClass="btn btn-success" runat="server" Text="Add New" OnClientClick="Clr()" OnClick="btnadd_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Master Shift</h5>
                                <%--  Grid--%>
                                <asp:Panel ID="Panel3" ScrollBars="Horizontal" Width="100%" runat="server">
                                    <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false"
                                        DataKey="ID" GridLines="None" OnRowCommand="GridView1_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Edit">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton5" runat="server" CommandName="Edits" ToolTip="Edit Record" ImageUrl="../../Image/Edit.png"
                                                        Width="25px" CommandArgument='<%#Eval("ID")%>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Delete">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Delete" ToolTip="Delete Record" ImageUrl="../../Image/Delete.png"
                                                        OnClientClick="if (!confirm('Are you sure you want to delete?')) return false;"
                                                        Width="25px" CommandArgument='<%#Eval("ID")%>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ID" HeaderText="ID" Visible="false" SortExpression="ID" />
                                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                            <asp:BoundField DataField="Shift_IN" HeaderText="Shift_IN" SortExpression="Shift_IN" />
                                            <asp:BoundField DataField="Shift_OUT" HeaderText="Shift_OUT" SortExpression="Shift_OUT" />
                                            <%--<asp:BoundField DataField="LateCommingMonthlyMinuts" HeaderText="LateMnth" SortExpression="LateCommingMonthlyMinuts" />--%>
                                            <asp:BoundField DataField="LateCommingDailyMinuts" HeaderText="LateDaily" SortExpression="LateCommingDailyMinuts" />
                                            <%--<asp:BoundField DataField="EarlyGoingMonthlyMinuts" HeaderText="EarlyMnth" SortExpression="EarlyGoingMonthlyMinuts" />--%>
                                            <asp:BoundField DataField="EarlyGoingDailyMinuts" HeaderText="EarlyDaily" SortExpression="EarlyGoingDailyMinuts" />
                                            <%--<asp:BoundField DataField="OverTimeMonthlyMinuts" HeaderText="OverTimeMnthly" SortExpression="OverTimeMonthlyMinuts" />--%>
                                            <asp:BoundField DataField="OverTimeDailyMinuts" HeaderText="OverTimeDaily" SortExpression="OverTimeDailyMinuts" />
                                           <asp:BoundField DataField="WorkingDays" HeaderText="Working Days" SortExpression="WorkinDays" />   
                                            <asp:BoundField DataField="LateSittingMinuts" HeaderText="LateSitting" SortExpression="LateSittingMinuts" />
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
            <div class="modal fade" id="Modal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true ">
                <div class="modal-dialog" role="document ">
                    <div class="modal-content" style="width: 800px">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">
                                <%--Head popup--%>Create New Shift 
                                <asp:Label ID="lblHeader" runat="server" ForeColor="Blue"></asp:Label>
                                </h3>
                               <button aria-label="Close" class="close" data-dismiss="modal" type="button">
                                   <span aria-hidden="true ">×</span>
                               </button>
                        </div>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                        <div class="modal-body">
                            <div class="card">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item"><a id="a10" runat="server" class="nav-link active" data-toggle="tab" href="#a" role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">Shift</span></a> </li>
                                    <li class="nav-item"><a id="b20" runat="server" class="nav-link" data-toggle="tab" href="#b" role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">Late & Early Relaxion</span></a> </li>
                                    <li class="nav-item"><a id="c30" runat="server" class="nav-link" data-toggle="tab" href="#c" role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">Late Sitting & Over Time</span></a> </li>
                                    <li class="nav-item"><a id="d40" runat="server" class="nav-link" data-toggle="tab" href="#d" role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">Working Days</span></a> </li>
                                    <li class="nav-item"><a id="e50" runat="server" class="nav-link" data-toggle="tab" href="#e" role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">Leave</span></a> </li>
                                    <li class="nav-item"><a id="f60" runat="server" class="nav-link" data-toggle="tab" href="#f" role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">Missing Time</span></a> </li>
                                    <%-- <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#g" role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">Shift,Break & Leave</span></a> </li>--%>
                                </ul>
                                <div class="tab-content tabcontent-border">
                                     <asp:Panel ClientIDMode="Static" runat="server" class="tab-pane active" ID="a" role="tabpanel">                                 
                                        <table style="width: 100%">
                                            <tr class="row">
                                                <td class="col-md-4">
                                                    <label class="control-label col-form-label">Shift Name</label>
                                                    <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtName" MaxLength="40" Width="230px" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                        <table style="width: 100%">
                                            <tr class="row">
                                                <td class="col-md-4">
                                                    <label class="control-label col-form-label">Shift IN</label>
                                                    <div>
                                                        <asp:DropDownList CssClass="form-control custom-select" ID="ddlShiftINHour" Width="60px" runat="server" onChange="LateSittingOverTime();">
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                                            <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                                            <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                                            <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                                            <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                                            <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                                            <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:DropDownList CssClass="form-control custom-select" ID="ddlShiftINMinut" Width="60px" runat="server" onChange="LateSittingOverTime();">
                                                            <asp:ListItem Text="5" Value="05"></asp:ListItem>
                                                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                                            <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                                            <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                                            <asp:ListItem Text="25" Value="25"></asp:ListItem>
                                                            <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                                            <asp:ListItem Text="35" Value="35"></asp:ListItem>
                                                            <asp:ListItem Text="40" Value="40"></asp:ListItem>
                                                            <asp:ListItem Text="45" Value="45"></asp:ListItem>
                                                            <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                                            <asp:ListItem Text="55" Value="55"></asp:ListItem>
                                                            <asp:ListItem Text="00" Value="00"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:DropDownList CssClass="form-control custom-select" ID="ddlShiftINAMPM" Width="70px" runat="server" onChange="LateSittingOverTime();">
                                                            <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                                            <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </td>
                                                <%-- </tr>
                                           <tr class="row">--%>
                                                <td class="col-md-4">
                                                    <label class="control-label col-form-label">Shift OUT</label>
                                                    <div>
                                                        <asp:DropDownList CssClass="form-control custom-select" ID="ddlShiftOUTHour" Width="60px" runat="server" onChange="LateSittingOverTime();">
                                                            <asp:ListItem Text="1" Value="01"></asp:ListItem>
                                                            <asp:ListItem Text="2" Value="02"></asp:ListItem>
                                                            <asp:ListItem Text="3" Value="03"></asp:ListItem>
                                                            <asp:ListItem Text="4" Value="04"></asp:ListItem>
                                                            <asp:ListItem Text="5" Value="05"></asp:ListItem>
                                                            <asp:ListItem Text="6" Value="06"></asp:ListItem>
                                                            <asp:ListItem Text="7" Value="07"></asp:ListItem>
                                                            <asp:ListItem Text="8" Value="08"></asp:ListItem>
                                                            <asp:ListItem Text="9" Value="09"></asp:ListItem>
                                                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                                            <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                                            <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:DropDownList CssClass="form-control custom-select" ID="ddlShiftOUTMinut" Width="60px" runat="server" onChange="LateSittingOverTime();">
                                                            <asp:ListItem Text="5" Value="05"></asp:ListItem>
                                                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                                            <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                                            <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                                            <asp:ListItem Text="25" Value="25"></asp:ListItem>
                                                            <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                                            <asp:ListItem Text="35" Value="35"></asp:ListItem>
                                                            <asp:ListItem Text="40" Value="40"></asp:ListItem>
                                                            <asp:ListItem Text="45" Value="45"></asp:ListItem>
                                                            <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                                            <asp:ListItem Text="55" Value="55"></asp:ListItem>
                                                            <asp:ListItem Text="00" Value="00"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:DropDownList CssClass="form-control custom-select" ID="ddlShiftOUTAMPM" Width="70px" runat="server" onChange="LateSittingOverTime();">
                                                            <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                                            <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </td>
                                                <td class="col-md-4">
                                                    <label class="control-label col-form-label">Shift OUT Next Day</label>
                                                    <asp:CheckBox ID="CheckBoxNextDay" CssClass="form-control custom-checkbox" runat="server" />
                                                </td>
                                            </tr>
                                           <%-- <tr class="row">
                                                <td class="col-md-4">
                                                   <label class="control-label col-form-label">Minimum and Maximum Time</label>
                                                    <asp:CheckBox ID="CheckBox3" CssClass="form-control custom-checkbox" runat="server" />
                                                </td>
                                                <td class="col-md-4">
                                                <label class="control-label col-form-label">Only Working Time</label>
                                                    <asp:CheckBox ID="CheckBox2" CssClass="form-control custom-checkbox" runat="server" />
                                                </td>
                                                <td class="col-md-4">
                                                    <label class="control-label col-form-label">Shift OUT Next Day</label>
                                                    <asp:CheckBox ID="CheckBox1" CssClass="form-control custom-checkbox" runat="server" />
                                                </td>
                                            </tr>--%>
                                            <tr class="row" style="visibility:hidden">
                                                <td class="col-md-6">
                                                    <label class="control-label col-form-label">Time Calculation</label>
                                                    <asp:RadioButtonList CssClass="checkbox" ID="RBTimeCalculation" CellPadding="3" CellSpacing="2"
                                                        RepeatLayout="Table" RepeatDirection="Horizontal" runat="server">
                                                        <asp:ListItem Text="Minimum and Maximum Time" Value="Minimum and Maximum Time" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="Only Working Time" Value="Only Working Time"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                                <td class="col-md-6">
                                                <label class="control-label col-form-label">Time Punch</label>
                                                    <asp:RadioButtonList CssClass="checkbox" ID="RBTimePunch" CellPadding="3" CellSpacing="2"
                                                        RepeatLayout="Table" RepeatDirection="Horizontal" runat="server">
                                                        <asp:ListItem Text="Machine" Value="Machine" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="Web Punch" Value="Web Punch"></asp:ListItem>
                                                        <asp:ListItem Text="Import" Value="Import"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ClientIDMode="Static" runat="server" class="tab-pane active" ID="b" role="tabpanel">
                                        <div class="p-20">
                                            <table style="width: 100%">
                                                <tr class="row">
                                                    <td class="col-md-6">
                                                        <label class="control-label col-form-label">Daily Late Minutes :</label>
                                                        <asp:TextBox CssClass="form-control" placeholder="Relaxation on daily basis of late minutes" autocomplete="off" ID="txtLatePerDayMinuts" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="col-md-6">
                                                        <label class="control-label col-form-label">Daily Early Minutes :</label>
                                                        <asp:TextBox CssClass="form-control" placeholder="Relaxation on daily basis of early minutes" autocomplete="off" ID="txtEarlyPerDayMinuts" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="row">
                                                    <td class="col-md-6">
                                                        <label class="control-label col-form-label">Monthly Late Minutes :</label>
                                                        <asp:TextBox CssClass="form-control" placeholder="Relaxation on monthly basis of late minutes" autocomplete="off" ID="txtLatePerMonthMinuts" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="col-md-6">
                                                        <label class="control-label col-form-label">Monthly Early Minutes :</label>
                                                        <asp:TextBox CssClass="form-control" placeholder="Relaxation on monthly basis of early minutes" autocomplete="off" ID="txtEarlyPerMonthMinuts" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                 <%--Monthly_Special_No_of_Late_Relax, Minutes_for_One_Time_Late, No_of_late_without_Special_Late, Day_to_deduct--%>
                                                <tr class="row">
                                                    <td class="col-md-6">
                                                        <label class="control-label col-form-label">Monthly Special No of Late Relax:</label>
                                                        <asp:TextBox CssClass="form-control" placeholder="e.g 3 time late for 60 minutes in a month" autocomplete="off" ID="txtMonthly_Special_No_of_Late_Relax" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="col-md-6">
                                                        <label class="control-label col-form-label">Minutes for One Time Late :</label>
                                                        <asp:TextBox CssClass="form-control" placeholder="e.g 60 minutes late for 3 times in a month" autocomplete="off" ID="txtMinutes_for_One_Time_Late" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="row">
                                                    <td class="col-md-6">
                                                        <label class="control-label col-form-label">No of late without Special Late:</label>
                                                        <asp:TextBox CssClass="form-control" placeholder="e.g 2 times more late for 60 minutes in a month" autocomplete="off" ID="txtNo_of_late_without_Special_Late" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="col-md-6">
                                                        <label class="control-label col-form-label">Day to deduct :</label>
                                                        <asp:DropDownList CssClass="form-control" ToolTip="Select Day to be deducted for 2 times more late without relaxation" Height="36px" ID="ddlDay_to_deduct" runat="server">
                                                            <asp:ListItem Text="Select Day" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="Full Day" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="Half Day" Value="0.5"></asp:ListItem>
                                                            <asp:ListItem Text="One 3rd Day" Value="0.33"></asp:ListItem>
                                                            <asp:ListItem Text="One 4th Day" Value="0.25"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ClientIDMode="Static" runat="server" class="tab-pane active" ID="c" role="tabpanel">
                                        <div class="p-20">
                                            <table style="width: 100%">
                                                <tr class="row">
                                                    <td class="col-md-6">
                                                        <asp:DropDownList CssClass="form-control custom-select" ID="ddlLateSittinOverTime" runat="server" onChange="LateSittingOverTime();">
                                                            <asp:ListItem Text="-= Select Late Sitting || Over Time =-"></asp:ListItem>
                                                            <asp:ListItem Text="Late Sitting"></asp:ListItem>
                                                            <asp:ListItem Text="Over Time"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table style="width: 100%">
                                                <tr id="LateSitting" runat="server" class="row">
                                                    <td class="col-md-6">
                                                        <label class="control-label col-form-label">Late Sitting Time :</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtLatesittingTime" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="col-md-6">
                                                        <label class="control-label col-form-label">Late Sitting Minuts :</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtLateSittingMinuts" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr id="OverTime" runat="server" class="row">
                                                    <td class="col-md-6">
                                                        <label class="control-label col-form-label">OverTime PerMonth :</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtOverTimePerMonth" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="col-md-6">
                                                        <label class="control-label col-form-label">OverTime PerDay :</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtOverTimePerDay" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </asp:Panel>
                                     <asp:Panel ClientIDMode="Static" runat="server" class="tab-pane active" ID="d" role="tabpanel">
                                        <div class="p-20">
                                            <table>
                                                <tr>
                                                    <td style="padding-left: 0px">
                                                        <asp:CheckBoxList ID="CBLWorkingDays" CssClass="custom-control custom-checkbox mr-sm-2" RepeatDirection="Horizontal" CellPadding="10" CellSpacing="10" runat="server">
                                                            <asp:ListItem Text="Monday" Value="Monday"> </asp:ListItem>
                                                            <asp:ListItem Text="Tuesday" Value="Tuesday"> </asp:ListItem>
                                                            <asp:ListItem Text="Wednesday" Value="Wednesday"> </asp:ListItem>
                                                            <asp:ListItem Text="Thursday" Value="Thursday"> </asp:ListItem>
                                                            <asp:ListItem Text="Friday" Value="Friday"> </asp:ListItem>
                                                            <asp:ListItem Text="Saturday" Value="Saturday"> </asp:ListItem>
                                                            <asp:ListItem Text="Sunday" Value="Sunday"> </asp:ListItem>
                                                        </asp:CheckBoxList></td>
                                                </tr>
                                            </table>
                                        </div>
                                     </asp:Panel>
                                     <asp:Panel ClientIDMode="Static" runat="server" class="tab-pane active" ID="e" role="tabpanel">
                                        <div class="p-20">
                                            <asp:CheckBox ID="CheckBoxAutoCalculateMinutes" Text="Check to auto calculate the leave minutes on the basis of Shift IN and Shift OUT" Checked="true" runat="server" />
                                            <br />
                                            <table style="width: 100%">
                                                <tr class="row">
                                                    <td class="col-md-6">
                                                        <label class="control-label col-form-label">Full Day Minutes</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtFullDayMinutes" placeholder="E.g. 500" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="col-md-6">
                                                        <label class="control-label col-form-label">Full Day Value</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtFullDayValue" placeholder="E.g. 1.0" MaxLength="40" Text="1" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 2%"></td>
                                                </tr>
                                                <tr class="row">
                                                    <td class="col-md-6">
                                                        <label class="control-label col-form-label">Half Day Minutes</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtHalfDayMinutes" placeholder="E.g. 250" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="col-md-6">
                                                        <label class="control-label col-form-label">Half Day Value</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtHalfDayValue" placeholder="E.g. 0.5" MaxLength="40" Text="0.5" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 2%"></td>
                                                </tr>
                                                <tr class="row">
                                                    <td class="col-md-6">
                                                        <label class="control-label col-form-label">Short Day Minutes</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtShortDayMinutes" placeholder="E.g. 125" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="col-md-6">
                                                        <label class="control-label col-form-label">Short Day Value</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtShortDayValue" placeholder="E.g. 0.33" Text="0.33" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 2%"></td>
                                                </tr>
                                            </table>
                                        </div>
                                     </asp:Panel>
                                     <asp:Panel ClientIDMode="Static" runat="server" class="tab-pane active" ID="f" role="tabpanel">
                                        <div class="p-20">
                                            <table style="width: 100%">
                                                <tr class="row">
                                                    <td class="col-md-6">
                                                        <label class="control-label col-form-label">Missing IN Minutes</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtMissingINMinuts" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="col-md-6">
                                                        <label class="control-label col-form-label">Missing OUT Minutes</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtMissingOUTMinuts" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="col-md-6">
                                                        <label class="control-label col-form-label">Missing IN & OUT Minutes</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtMissingINOUTMinutes" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 20%; padding-bottom: 12px; text-align: left"></td>
                                                    <td style="width: 20%"></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </asp:Panel>
                                     <%--<asp:Panel ClientIDMode="Static" runat="server" class="tab-pane active" ID="g" role="tabpanel">
                                        <div class="p-20">
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="text-align: left">Day</td>
                                                    <td style="text-align: left">Shift IN</td>
                                                    <td style="text-align: left">Shift OUT</td>
                                                    <td style="text-align: left">Break From</td>
                                                    <td style="text-align: left">Break To</td>
                                                    <td style="text-align: left">Short Day</td>
                                                    <td style="text-align: left">Half Day</td>
                                                    <td style="text-align: left"></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left">
                                                        <asp:DropDownList CssClass="form-control custom-select" Height="36px" Width="100px" ID="ddlDays" runat="server">
                                                            <asp:ListItem Text="Sunday" Value="Sunday"> </asp:ListItem>
                                                            <asp:ListItem Text="Monday" Value="Monday"> </asp:ListItem>
                                                            <asp:ListItem Text="Tuesday" Value="Tuesday"> </asp:ListItem>
                                                            <asp:ListItem Text="Wednesday" Value="Wednesday"> </asp:ListItem>
                                                            <asp:ListItem Text="Thursday" Value="Thursday"> </asp:ListItem>
                                                            <asp:ListItem Text="Friday" Value="Friday"> </asp:ListItem>
                                                            <asp:ListItem Text="Saturday" Value="Saturday"> </asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="text-align: left">
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtShiftINDaywise" placeholder="Time" Width="60px" MaxLength="40" runat="server" OnClientDateSelectionChanged="AppendTime"></asp:TextBox>
                                                        <ajax:CalendarExtender ID="CalendarExtender10" runat="server"
                                                            PopupButtonID="txtShiftINDaywise" TargetControlID="txtShiftINDaywise" OnClientDateSelectionChanged="AppendTime">
                                                        </ajax:CalendarExtender>
                                                    </td>
                                                    <td style="text-align: left">
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtShiftOUTDaywise" placeholder="Time" Width="60px" MaxLength="40" runat="server" OnClientDateSelectionChanged="AppendTime"></asp:TextBox>
                                                        <ajax:CalendarExtender ID="CalendarExtender11" runat="server"
                                                            PopupButtonID="txtShiftOUTDaywise" TargetControlID="txtShiftOUTDaywise" OnClientDateSelectionChanged="AppendTime">
                                                        </ajax:CalendarExtender>
                                                    </td>
                                                    <td style="text-align: left">
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtFromBreakTime" Width="60px" MaxLength="40" placeholder="Time" runat="server" OnClientDateSelectionChanged="AppendTime"></asp:TextBox>
                                                        <ajax:CalendarExtender ID="CalendarExtender8" runat="server"
                                                            PopupButtonID="txtFromBreakTime" TargetControlID="txtFromBreakTime" OnClientDateSelectionChanged="AppendTime">
                                                        </ajax:CalendarExtender>
                                                    </td>
                                                    <td style="text-align: left">
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtToBreakTime" Width="60px" MaxLength="40" placeholder="Time" runat="server" OnClientDateSelectionChanged="AppendTime"></asp:TextBox>
                                                        <ajax:CalendarExtender ID="CalendarExtender9" runat="server"
                                                            PopupButtonID="txtToBreakTime" TargetControlID="txtToBreakTime" OnClientDateSelectionChanged="AppendTime">
                                                        </ajax:CalendarExtender>
                                                    </td>
                                                    <td style="text-align: left">
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtShortDayMinuts" placeholder="Minutes" Width="60px" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td style="text-align: left">
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtHalfDayMinuts" placeholder="Minutes" Width="60px" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td style="padding-bottom: 5px; text-align: left">
                                                        <asp:ImageButton ID="imgbtnAdd" runat="server" OnClientClick="return  checkvalid()" CommandName="Delete" ImageUrl="../../Image/add.png" Width="25px" OnClick="imgbtnAdd_Click" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:GridView ID="GRDDetails" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false"
                                                DataKey="ID" GridLines="None" OnRowCommand="GRDDetails_RowCommand">
                                                <Columns>
                                                    <asp:BoundField DataField="ID" HeaderText="ID" Visible="false" SortExpression="ID" />
                                                    <asp:BoundField DataField="Day" HeaderText="Day" SortExpression="Day" />
                                                    <asp:BoundField DataField="ShiftIN" HeaderText="Shift IN" SortExpression="FromTime" />
                                                    <asp:BoundField DataField="ShiftOUT" HeaderText="Shift OUT" SortExpression="ToTime" />
                                                    <asp:BoundField DataField="BreakFrom" HeaderText="Break From" SortExpression="ShiftIN" />
                                                    <asp:BoundField DataField="BreakTo" HeaderText="Break To" SortExpression="ShiftOUT" />
                                                    <asp:BoundField DataField="ShortDay" HeaderText="Short Day" SortExpression="ShiftIN" />
                                                    <asp:BoundField DataField="HalfDay" HeaderText="Half Day" SortExpression="ShiftOUT" />
                                                    <asp:TemplateField HeaderText="Remove">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImageButton4" ImageUrl="../../Image/removes.png" runat="server" Width="25px"
                                                                CommandArgument='<%#Eval("ID")%>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    No Record Found !
                                                </EmptyDataTemplate>
                                            </asp:GridView>
                                        </div>
                                    </asp:Panel>--%>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnInsert" OnClientClick=" return  checkvalidShift()" CssClass="btn btn-primary pull-right" runat="server"
                                    Text="Save" OnClick="btnInsert_Click" />
                                <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnInsert" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
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
