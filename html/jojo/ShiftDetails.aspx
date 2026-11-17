<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="Attendance_ShiftDetails, App_Web_5bk21qbu" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function Clr() {
            PageMethods.Clear();
        }
    </script>
    <script language="javascript" type="text/javascript">
       function AppendTime(sender, args) {
            var selectedDate = new Date();
            selectedDate = sender.get_selectedDate();
            var now = new Date();
            sender.get_element().value = selectedDate.format("mm/dd/yyyy") + " " + now.format("hh:mm tt");
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title"><%--Heading--%> Edit Shift User and Date wise</h4>
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
                                    &nbsp; 
                                        <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddldepartment" runat="server"
                                            AutoPostBack="true" OnSelectedIndexChanged="ddldepartment_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    &nbsp; 
                                        <asp:DropDownList CssClass="select2 form-control custom-select" Height="36px" ID="ddlemployee" runat="server">
                                        </asp:DropDownList>
                                    &nbsp; 
                                    <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtfromdate" runat="server"></asp:TextBox>
                                    &nbsp;
                                    <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txttodate" runat="server"></asp:TextBox>
                                    &nbsp; 
                                        <asp:Button ID="btnsearch" CssClass="btn btn-primary" runat="server" Text="Show" OnClick="btnsearch_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Shift Details</h5>
                            
                            <asp:Panel ID="Panel3" ScrollBars="Horizontal" Width="100%" runat="server">
                                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false"
                                    DataKey="ID" GridLines="None" OnRowCommand="GridView1_RowCommand"  AllowPaging="True" PageSize="10" OnPageIndexChanging="GridView1_PageIndexChanging">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Edit">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton5" runat="server" CommandName="Edits" ToolTip="Edit Record" ImageUrl="../../Image/Edit.png"
                                                    Width="25px" CommandArgument='<%#Eval("ID") + ";" +Eval("ShiftID")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ID" HeaderText="ID" Visible="false" SortExpression="ID" />
                                       <asp:TemplateField HeaderText="Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFromdate" runat="server" Text='<%#Eval("Date", "{0:dd-MM-yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                        <asp:BoundField DataField="Shift_IN" HeaderText="Shift_IN" SortExpression="Shift_IN" />
                                        <asp:BoundField DataField="Shift_OUT" HeaderText="Shift_OUT" SortExpression="Shift_OUT" />
                                        <asp:BoundField DataField="LateCommingMonthlyMinuts" HeaderText="LateMnth" SortExpression="LateCommingMonthlyMinuts" />
                                        <asp:BoundField DataField="LateCommingDailyMinuts" HeaderText="LateDaily" SortExpression="LateCommingDailyMinuts" />
                                        <asp:BoundField DataField="EarlyGoingMonthlyMinuts" HeaderText="EarlyMnth" SortExpression="EarlyGoingMonthlyMinuts" />
                                        <asp:BoundField DataField="EarlyGoingDailyMinuts" HeaderText="EarlyDaily" SortExpression="EarlyGoingDailyMinuts" />
                                        <asp:BoundField DataField="OverTimeMonthlyMinuts" HeaderText="OverTimeMnthly" SortExpression="OverTimeMonthlyMinuts" />
                                        <asp:BoundField DataField="OverTimeDailyMinuts" HeaderText="OverTimeDaily" SortExpression="OverTimeDailyMinuts" />
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
                                    <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#10" role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">Shift</span></a> </li>
                                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#20" role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">Late & Early Relaxion</span></a> </li>
                                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#30" role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">Late Sitting & Over Time</span></a> </li>
                                   <%--<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#40" role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">Working Days</span></a> </li>--%>
                                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#50" role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">Leave</span></a> </li>
                                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#60" role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">Missing Time</span></a> </li>
                                    <%-- <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#70" role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">Shift,Break & Leave</span></a> </li>--%>
                                </ul>
                                <div class="tab-content tabcontent-border">
                                    <div class="tab-pane active" id="10" role="tabpanel">
                                       <table style="width: 100%">
                                            <tr class="row">
                                                <td class="col-md-4">
                                                    <label class="control-label">Shift Name</label>
                                                    <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtName" MaxLength="40" Width="230px" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                       <table style="width: 100%">
                                            <tr class="row">
                                                <td class="col-md-4">
                                                    <label class="control-label">Shift IN</label>
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
                                              
                                           
                                                <td class="col-md-4">
                                                    <label class="control-label">Shift OUT</label>
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
                                                
                                            </tr>
                                       </table>
                                    </div>
                                    <div class="tab-pane  p-20" id="20" role="tabpanel">
                                        <div class="p-20">
                                            <table style="width: 100%">
                                                <tr class="row">
                                                    <td class="col-md-6">
                                                        <label class="control-label">Daily Late Minutes :</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtLatePerDayMinuts" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="col-md-6">
                                                        <label class="control-label">Daily Early Minutes :</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtEarlyPerDayMinuts" runat="server"></asp:TextBox>

                                                    </td>
                                                </tr>
                                                <tr class="row">
                                                    <td class="col-md-6">
                                                        <label class="control-label">Monthly Late Minutes :</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtLatePerMonthMinuts" MaxLength="40" runat="server"></asp:TextBox>

                                                    </td>
                                                    <td class="col-md-6">
                                                        <label class="control-label">Monthly Early Minutes :</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtEarlyPerMonthMinuts" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                       </div>
                                    </div>
                                    <div class="tab-pane p-20" id="30" role="tabpanel">
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
                                                        <label class="control-label">Late Sitting Time :</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtLatesittingTime" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="col-md-6">
                                                        <label class="control-label">Late Sitting Minuts :</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtLateSittingMinuts" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                               </tr>
                                                <tr id="OverTime" runat="server" class="row">
                                                    <td class="col-md-6">
                                                        <label class="control-label">OverTime PerMonth :</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtOverTimePerMonth" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="col-md-6">
                                                        <label class="control-label">OverTime PerDay :</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtOverTimePerDay" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                               </tr>
                                           </table>
                                        </div>
                                    </div>
                                    <%--<div class="tab-pane p-20" id="40" role="tabpanel">
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
                                    </div>--%>
                                    <div class="tab-pane p-20" id="50" role="tabpanel">
                                        <div class="p-20">
                                            <table style="width: 100%">
                                                <tr class="row">
                                                   <td class="col-md-6">
                                                        <label class="control-label">Full Day Minutes</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtFullDayMinutes" placeholder="E.g. 500" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                   <td class="col-md-6">
                                                        <label class="control-label">Full Day Value</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtFullDayValue" placeholder="E.g. 1.0" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 2%"></td>
                                                </tr>
                                                <tr class="row">
                                                   <td class="col-md-6">
                                                        <label class="control-label">Half Day Minutes</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtHalfDayMinutes" placeholder="E.g. 250" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                   <td class="col-md-6">
                                                        <label class="control-label">Half Day Value</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtHalfDayValue" placeholder="E.g. 0.5" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 2%"></td>
                                                </tr>
                                                <tr class="row">
                                                   <td class="col-md-6">
                                                        <label class="control-label">Short Day Minutes</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtShortDayMinutes" placeholder="E.g. 125" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                   <td class="col-md-6">
                                                        <label class="control-label">Short Day Value</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtShortDayValue" placeholder="E.g. 0.33" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 2%"></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane p-20" id="60" role="tabpanel">
                                        <div class="p-20">
                                            <table style="width: 100%">
                                                <tr class="row">
                                                    <td class="col-md-6">
                                                        <label class="control-label">Missing IN Minutes</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtMissingINMinuts" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="col-md-6">
                                                        <label class="control-label">Missing OUT Minutes</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtMissingOUTMinuts" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="col-md-6">
                                                        <label class="control-label">Missing IN & OUT Minutes</label>
                                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtMissingINOUTMinutes" MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 20%; padding-bottom: 12px; text-align: left"></td>
                                                    <td style="width: 20%"></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                               </div>
                            </div>
                             <div class="modal-footer">
                                <asp:Button ID="btnInsert" CssClass="btn btn-primary pull-right" runat="server"
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
