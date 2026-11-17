<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="Attendance_Setup, App_Web_xu4ttdni" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function Clr() {
            PageMethods.Clear();
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <div class="header">
                <h1 class="page-title">Attendance Setup</h1>
            </div>
            <div class="container-fluid">
                <div class="row-fluid">
                    <div id="Alert" visible="false" runat="server" class="alert alert-info">
                        <button type="button" class="close" data-dismiss="alert">
                            ×</button>
                    </div>
                    <br />
                    <div>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="row">
                        <div class="well">
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 5%"></td>
                                    <td style="width: 10%; padding-bottom: 12px; text-align: left">Where
                                    </td>
                                    <td style="width: 20%">
                                        <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddlsearch" runat="server" >
                                            <asp:ListItem Text="ID" Value="01"></asp:ListItem>
                                            <asp:ListItem Text="Name" Value="02"></asp:ListItem>
                                            <%-- <asp:ListItem Text="Description" Value="03"></asp:ListItem>--%>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 5%"></td>
                                    <td style="width: 10%; padding-bottom: 12px; text-align: left">Like
                                    </td>
                                    <td style="width: 20%">
                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtsearch"  runat="server"></asp:TextBox>
                                    </td>
                                    <td style="width: 20%; padding-bottom: 12px">
                                        <asp:Button ID="btnsearch" CssClass="btn btn-primary pull-left" runat="server" Text="Show" OnClick="btnsearch_Click" />
                                        <asp:Button ID="btnadd" CssClass="btn btn-success" runat="server" Text="Add New" OnClientClick="Clr()" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="block">
                        <a href="#page-stats2" class="block-heading" data-toggle="collapse">Show Data </a>
                        <div id="page-stats2" class="block-body collapse in">
                            <div class="row">
                                <br />
                                <asp:Panel ID="Panel3" ScrollBars="Horizontal" Width="100%" runat="server">
                                    <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered"  runat="server" AutoGenerateColumns="false"
                                        DataKey="ID" GridLines="None" OnRowCommand="GridView1_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Edit">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton5" runat="server" CommandName="Edits" ToolTip="Edit Record" ImageUrl="../../Image/Edit.png"
                                                        Width="25px" CommandArgument='<%#Eval("ID")%>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ID" HeaderText="ID" Visible="false" SortExpression="ID" />
                                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ItemStyle-Width="300px" />
                                            <asp:BoundField DataField="Shift_IN" HeaderText="Shift_IN" SortExpression="Shift_IN" />
                                            <asp:BoundField DataField="Shift_OUT" HeaderText="Shift_OUT" SortExpression="Shift_OUT" />
                                            <asp:BoundField DataField="LateCommingMonthlyMinuts" HeaderText="LateMnth" SortExpression="LateCommingMonthlyMinuts" />
                                            <asp:BoundField DataField="LateCommingDailyMinuts" HeaderText="LateDaily" SortExpression="LateCommingDailyMinuts" />
                                            <asp:BoundField DataField="EarlyGoingMonthlyMinuts" HeaderText="EarlyMnth" SortExpression="EarlyGoingMonthlyMinuts" />
                                            <asp:BoundField DataField="EarlyGoingDailyMinuts" HeaderText="EarlyDaily" SortExpression="EarlyGoingDailyMinuts" />
                                            <asp:BoundField DataField="OverTimeMonthlyMinuts" HeaderText="OverTimeMnthly" SortExpression="OverTimeMonthlyMinuts" />
                                            <asp:BoundField DataField="OverTimeDailyMinuts" HeaderText="OverTimeDaily" SortExpression="OverTimeDailyMinuts" />
                                            <asp:BoundField DataField="RestMinuts" HeaderText="RestMinuts" SortExpression="RestMinuts" />
                                            <asp:BoundField DataField="RestDay" HeaderText="RestDay" SortExpression="RestDay" />
                                            <asp:BoundField DataField="LateSittingMinuts" HeaderText="LateSitting" SortExpression="LateSittingMinuts" />
                                            <%--<asp:BoundField DataField="Missing_OUT_Minuts" HeaderText="MisOUT_Mnts" SortExpression="Missing_OUT_Minuts" />
                                            <asp:BoundField DataField="Missing_INOUT_Minuts" HeaderText="MisINOUT_Mnts" SortExpression="Missing_INOUT_Minuts" />--%>
                                            <%--<asp:BoundField DataField="LateCommingRelaxationMinuts" HeaderText="LateMnts" SortExpression="LateCommingRelaxationMinuts" />
                                            <asp:BoundField DataField="EarlyGoingRelaxationMinuts" HeaderText="EarlyMnts" SortExpression="EarlyGoingRelaxationMinuts" />--%>
                                            <%--<asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" />
                                            <asp:BoundField DataField="DateCreated" HeaderText="DateCreated" SortExpression="DateCreated" />--%>
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
            <div id="ModelPopup">
                <ajax:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="btnadd"
                    CancelControlID="btnClose" BackgroundCssClass="modalBackground" PopupDragHandleControlID="Panel1">
                </ajax:ModalPopupExtender>
                <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" Style="display: none">
                    <div class="row">
                        <div class="block-body" style="cursor: move">
                            <h3>Add Setup
                                <asp:Label ID="lblHeader" runat="server" ForeColor="Blue"></asp:Label>
                            </h3>
                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                        </div>
                        <div class="panel panel-default" style="width: 95%; padding: 10px; margin: 10px">
                            <div id="Tabs" role="tabpanel">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs" role="tablist">
                                    <li><a href="#1" aria-controls="1" role="tab" data-toggle="tab">Attendance
                                    </a></li>
                                    <li><a href="#2" aria-controls="2" role="tab" data-toggle="tab">Late Comming</a></li>
                                    <li><a href="#3" aria-controls="3" role="tab" data-toggle="tab">Early Going</a></li>
                                    <li><a href="#4" aria-controls="4" role="tab" data-toggle="tab">Over Time</a></li>
                                    <li><a href="#5" aria-controls="5" role="tab" data-toggle="tab">Late Sitting</a></li>
                                    <li><a href="#6" aria-controls="6" role="tab" data-toggle="tab">Rest</a></li>
                                    <li><a href="#7" aria-controls="7" role="tab" data-toggle="tab">Leave</a></li>
                                    <li><a href="#8" aria-controls="8" role="tab" data-toggle="tab">Missing Time</a></li>
                                    <li class="active"><a href="#9" aria-controls="9" role="tab" data-toggle="tab">Break & Shift</a></li>
                                </ul>
                                <!-- Tab panes -->
                                <div class="tab-content" style="padding-top: 1px">
                                    <div role="tabpanel" class="tab-pane" id="1">
                                        <div class="well">
                                            <%--<table style="width: 100%">
                                                <tr>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">Name :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtName" MaxLength="40"  runat="server"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 15%; padding-bottom: 12px; text-align: left"></td>
                                                    <td style="width: 20%"></td>
                                                    <td style="width: 10%"></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">Shift IN :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtShiftIN"  MaxLength="40" runat="server"></asp:TextBox>
                                                        <ajax:CalendarExtender ID="CalendarExtender3" Format="dd-MM-yyyy HH':'mm':'ss" runat="server"
                                                            PopupButtonID="txtShiftIN" TargetControlID="txtShiftIN">
                                                        </ajax:CalendarExtender>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">Shift OUT :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtShiftOUT" MaxLength="40"  runat="server"></asp:TextBox>
                                                        <ajax:CalendarExtender ID="CalendarExtender1" Format="dd-MM-yyyy HH':'mm':'ss" runat="server"
                                                            PopupButtonID="txtShiftOUT" TargetControlID="txtShiftOUT">
                                                        </ajax:CalendarExtender>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">Start IN :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtStartIN" MaxLength="40"  runat="server"></asp:TextBox>
                                                        <ajax:CalendarExtender ID="CalendarExtender2" Format="dd-MM-yyyy HH':'mm':'ss" runat="server"
                                                            PopupButtonID="txtStartIN" TargetControlID="txtStartIN">
                                                        </ajax:CalendarExtender>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">End IN :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtEndIN"  MaxLength="40" runat="server"></asp:TextBox>
                                                        <ajax:CalendarExtender ID="CalendarExtender4" Format="dd-MM-yyyy HH':'mm':'ss" runat="server"
                                                            PopupButtonID="txtEndIN" TargetControlID="txtEndIN">
                                                        </ajax:CalendarExtender>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">Start OUT :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="TxtStartOUT" MaxLength="40"  runat="server"></asp:TextBox>
                                                        <ajax:CalendarExtender ID="CalendarExtender5" Format="dd-MM-yyyy HH':'mm':'ss" runat="server"
                                                            PopupButtonID="TxtStartOUT" TargetControlID="TxtStartOUT">
                                                        </ajax:CalendarExtender>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">End OUT :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtEndOUT"  MaxLength="40" runat="server"></asp:TextBox>
                                                        <ajax:CalendarExtender ID="CalendarExtender6" Format="dd-MM-yyyy HH':'mm':'ss" runat="server"
                                                            PopupButtonID="txtEndOUT" TargetControlID="txtEndOUT">
                                                        </ajax:CalendarExtender>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                </tr>
                                            </table>--%>
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">Name :
                                                    </td>
                                                    <td style="width: 20%">
                                                      <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtName" MaxLength="40" Width="230px"  runat="server"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 15%; padding-bottom: 12px; text-align: left"></td>
                                                    <td style="width: 20%"></td>
                                                    <td style="width: 10%"></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">Shift IN :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <div class="input-prepend"><span class="add-on"><i class="icon-time"></i></span><asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtShiftIN" runat="server"></asp:TextBox></div>
                                                        <ajax:CalendarExtender ID="TextBox1_CalendarExtender" runat="server"
                                                            Enabled="True"   TargetControlID="txtShiftIN" PopupButtonID="txtShiftIN" OnClientDateSelectionChanged="AppendTime">
                                                        </ajax:CalendarExtender>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">Shift OUT :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <div class="input-prepend"><span class="add-on"><i class="icon-time"></i></span><asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtShiftOUT" runat="server"></asp:TextBox></div>
                                                       <ajax:CalendarExtender ID="CalendarExtender1" runat="server"
                                                            Enabled="True"   TargetControlID="txtShiftOUT" PopupButtonID="txtShiftOUT" OnClientDateSelectionChanged="AppendTime">
                                                        </ajax:CalendarExtender>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">Start IN :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <div class="input-prepend"><span class="add-on"><i class="icon-time"></i></span><asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtStartIN" runat="server"></asp:TextBox></div>
                                                       <ajax:CalendarExtender ID="CalendarExtender2" runat="server"
                                                            Enabled="True"   TargetControlID="txtStartIN" PopupButtonID="txtStartIN" OnClientDateSelectionChanged="AppendTime">
                                                        </ajax:CalendarExtender>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">End IN :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <div class="input-prepend"><span class="add-on"><i class="icon-time"></i></span><asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtEndIN" runat="server"></asp:TextBox></div>
                                                       <ajax:CalendarExtender ID="CalendarExtender3" runat="server"
                                                            Enabled="True"   TargetControlID="txtEndIN" PopupButtonID="txtEndIN" OnClientDateSelectionChanged="AppendTime">
                                                        </ajax:CalendarExtender>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">Start OUT :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <div class="input-prepend"><span class="add-on"><i class="icon-time"></i></span><asp:TextBox CssClass="form-control"   autocomplete="off" ID="TxtStartOUT" runat="server"></asp:TextBox></div>
                                                       <ajax:CalendarExtender ID="CalendarExtender4" runat="server"
                                                            Enabled="True"  TargetControlID="TxtStartOUT" PopupButtonID="TxtStartOUT" OnClientDateSelectionChanged="AppendTime">
                                                        </ajax:CalendarExtender>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">End OUT :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <div class="input-prepend"><span class="add-on"><i class="icon-time"></i></span><asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtEndOUT" runat="server"></asp:TextBox></div>
                                                       <ajax:CalendarExtender ID="CalendarExtender5" runat="server"
                                                            Enabled="True"   TargetControlID="txtEndOUT" PopupButtonID="txtEndOUT" OnClientDateSelectionChanged="AppendTime">
                                                        </ajax:CalendarExtender>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="2">
                                        <div class="well">
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="width: 20%; padding-bottom: 12px; text-align: left">Per Month Minutes :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtLatePerMonthMinuts"  MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 20%; padding-bottom: 12px; text-align: left">Per Day Minutes :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtLatePerDayMinuts"  MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="3">
                                        <div class="well">
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="width: 20%; padding-bottom: 12px; text-align: left">Per Month Minutes :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtEarlyPerMonthMinuts" MaxLength="40"  runat="server"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 20%; padding-bottom: 12px; text-align: left">Per Day Minutes :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtEarlyPerDayMinuts"  MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="4">
                                        <div class="well">
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="width: 20%; padding-bottom: 12px; text-align: left">Per Month Minutes :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtOverTimePerMonth" MaxLength="40"  runat="server"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 20%; padding-bottom: 12px; text-align: left">Per Day Minutes :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtOverTimePerDay"  MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="5">
                                        <div class="well">
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="width: 20%; padding-bottom: 12px; text-align: left">Time :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtLatesittingTime" MaxLength="40"  runat="server"></asp:TextBox>
                                                        <ajax:CalendarExtender ID="CalendarExtender7" Format="dd-MM-yyyy HH':'mm':'ss" runat="server"
                                                            PopupButtonID="txtLatesittingTime" TargetControlID="txtLatesittingTime">
                                                        </ajax:CalendarExtender>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 20%; padding-bottom: 12px; text-align: left">Minutes :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtLateSittingMinuts"  MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="6">
                                        <div class="well">
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="width: 20%; padding-bottom: 12px; text-align: left">Rest Minuts :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtRestMinuts" MaxLength="40"  runat="server"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 20%; padding-bottom: 12px; text-align: left">Rest Day :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddlRestDay" runat="server">
                                                            <asp:ListItem Text="Sunday" Value="Sunday"> </asp:ListItem>
                                                            <asp:ListItem Text="Monday" Value="Monday"> </asp:ListItem>
                                                            <asp:ListItem Text="Tuesday" Value="Tuesday"> </asp:ListItem>
                                                            <asp:ListItem Text="Wednesday" Value="Wednesday"> </asp:ListItem>
                                                            <asp:ListItem Text="Thursday" Value="Thursday"> </asp:ListItem>
                                                            <asp:ListItem Text="Friday" Value="Friday"> </asp:ListItem>
                                                            <asp:ListItem Text="Saturday" Value="Saturday"> </asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="7">
                                        <div class="well">
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="width: 8%; padding-bottom: 12px; text-align: center">Name :
                                                    </td>
                                                    <td style="width: 10%">
                                                        <asp:DropDownList CssClass="form-control custom-select" ID="ddlLeaveName" Height="36px" runat="server" >
                                                            <asp:ListItem Text="Full Day"></asp:ListItem>
                                                            <asp:ListItem Text="Half Day"></asp:ListItem>
                                                            <asp:ListItem Text="Short Day"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width: 8%; padding-bottom: 12px; text-align: center">Minutes :
                                                    </td>
                                                    <td style="width: 10%">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtLeaveMinuts"  MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 8%; padding-bottom: 12px; text-align: center">Day :
                                                    </td>
                                                    <td style="width: 10%">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtLeaveDay"  MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 10%; padding-bottom: 12px; text-align: center">
                                                        <asp:Button ID="btnSaveLeave" runat="server" Text="Save" Visible="false" CssClass="btn btn-primary pull-left"
                                                            OnClick="btnSaveLeave_Click" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="well">
                                            <asp:GridView ID="grdLeave" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered"
                                                GridLines="None" OnRowCommand="grdLeave_RowCommand">
                                                <Columns>
                                                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                                                    <asp:BoundField DataField="LeaveName" HeaderText="LeaveName" SortExpression="LeaveName" />
                                                    <asp:BoundField DataField="Minuts" HeaderText="Minuts" SortExpression="Minuts" />
                                                    <asp:BoundField DataField="Day" HeaderText="Day" SortExpression="Day" />
                                                    <%--<asp:TemplateField HeaderText="Delete">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImageButton6548" runat="server" CommandName="Delete" ToolTip="Delete Record" ImageUrl="../../Image/Delete.png"
                                                                Width="25px" CommandArgument='<%#Eval("ID")%>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    No Record Found !
                                                </EmptyDataTemplate>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="8">
                                        <div class="well">
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="width: 20%; padding-bottom: 12px; text-align: left">Missing IN Minutes :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtMissingINMinuts" MaxLength="40"  runat="server"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 20%; padding-bottom: 12px; text-align: left">Missing OUT Minutes :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtMissingOUTMinuts"  MaxLength="40" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20%; padding-bottom: 12px; text-align: left">Missing IN & OUT Minutes :
                                                    </td>
                                                    <td style="width: 20%">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtMissingINOUTMinutes" MaxLength="40"  runat="server"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 10%"></td>
                                                    <td style="width: 20%; padding-bottom: 12px; text-align: left"></td>
                                                    <td style="width: 20%"></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane active" id="9">
                                        <div class="well">
                                            <table style="width: 100%">
                                                <tr id="TROutDoorActivityTime" runat="server">
                                                    <td style="width: 5%; padding-bottom: 12px; text-align: center">Day :
                                                    </td>
                                                    <td style="width: 10%; text-align: left">
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
                                                    <td id="td2" runat="server" style="width: 8%; padding-bottom: 12px; text-align: center">Br From  :
                                                    </td>
                                                    <td id="td3" runat="server" style="width: 10%; text-align: center">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtFromBreakTime"  Width="60px" MaxLength="40" runat="server"></asp:TextBox>
                                                        <ajax:CalendarExtender ID="CalendarExtender8" Format="dd-MM-yyyy HH':'mm':'ss" runat="server"
                                                            PopupButtonID="txtFromBreakTime" TargetControlID="txtFromBreakTime">
                                                        </ajax:CalendarExtender>
                                                    </td>
                                                    <td style="width: 5%; padding-bottom: 12px; text-align: center">Br To  :
                                                    </td>
                                                    <td style="width: 10%; text-align: center">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtToBreakTime"  Width="60px" MaxLength="40" runat="server"></asp:TextBox>
                                                        <ajax:CalendarExtender ID="CalendarExtender9" Format="dd-MM-yyyy HH':'mm':'ss" runat="server"
                                                            PopupButtonID="txtToBreakTime" TargetControlID="txtToBreakTime">
                                                        </ajax:CalendarExtender>
                                                    </td>
                                                    <td id="td1" runat="server" style="width: 8%; padding-bottom: 12px; text-align: center">Shift IN  :
                                                    </td>
                                                    <td id="td4" runat="server" style="width: 10%; text-align: center">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtShiftINDaywise"  Width="60px" MaxLength="40" runat="server"></asp:TextBox>
                                                        <ajax:CalendarExtender ID="CalendarExtender10" Format="dd-MM-yyyy HH':'mm':'ss" runat="server"
                                                            PopupButtonID="txtShiftINDaywise" TargetControlID="txtShiftINDaywise">
                                                        </ajax:CalendarExtender>
                                                    </td>
                                                    <td style="width: 8%; padding-bottom: 12px; text-align: center">Shift OUT  :
                                                    </td>
                                                    <td style="width: 10%; text-align: center">
                                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtShiftOUTDaywise"  Width="60px" MaxLength="40" runat="server"></asp:TextBox>
                                                        <ajax:CalendarExtender ID="CalendarExtender11" Format="dd-MM-yyyy HH':'mm':'ss" runat="server"
                                                            PopupButtonID="txtShiftOUTDaywise" TargetControlID="txtShiftOUTDaywise">
                                                        </ajax:CalendarExtender>
                                                    </td>
                                                    <td style="width: 8%; padding-bottom: 12px; text-align: center">
                                                        <asp:Button ID="btnSaveBreakTimeDayWise" runat="server" Text="Save" CssClass="btn btn-primary pull-left"
                                                            OnClick="btnSaveBreakTimeDayWise_Click" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="well">
                                            <asp:GridView ID="grdBreakTimes" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered"
                                                GridLines="None" OnRowCommand="grdBreakTimes_RowCommand">
                                                <Columns>
                                                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                                                    <asp:BoundField DataField="DayName" HeaderText="Day" SortExpression="Day" />
                                                    <asp:BoundField DataField="FromTime" HeaderText="From Time" SortExpression="FromTime" />
                                                    <asp:BoundField DataField="ToTime" HeaderText="To Time" SortExpression="ToTime" />
                                                    <asp:BoundField DataField="ShiftIN" HeaderText="Shift IN" SortExpression="ShiftIN" />
                                                    <asp:BoundField DataField="ShiftOUT" HeaderText="Shift OUT" SortExpression="ShiftOUT" />
                                                    <asp:TemplateField HeaderText="Edit">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImageButton6548" runat="server" CommandName="Edits" ToolTip="Edit Record" ImageUrl="../../Image/Edit.png"
                                                                Width="25px" CommandArgument='<%#Eval("ID") + ";" +Eval("DayName") + ";" +Eval("FromTime") + ";" +Eval("ToTime") + ";" +Eval("ShiftIN") + ";" +Eval("ShiftOUT")%>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    No Record Found !
                                                </EmptyDataTemplate>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div style="text-align: left; float: left">
                                <asp:Button ID="btnClose" runat="server" CssClass="btn btn-inverse" Text="Close" />
                            </div>
                            <div style="text-align: right">
                                <asp:Button ID="btnInsert" OnClientClick=" return  checkvalid()" CssClass="btn btn-primary pull-left" runat="server"
                                    Text="Save" OnClick="btnInsert_Click"  />
                            </div>
                        </div>
                    </div>
                    <br />
                </asp:Panel>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="GridView1" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div style="background-color: Gray; filter: alpha(opacity=60); opacity: 0.60; width: 100%; top: 0px; left: 0px; position: fixed; height: 100%;">
            </div>
            <div style="margin: auto; font-family: Trebuchet MS; filter: alpha(opacity=100); opacity: 1; font-size: small; vertical-align: middle; position: fixed; left: 55%; color: #275721; text-align: center; height: 100px;">
                <table>
                    <tr>
                        <td style="text-align: center;"><img src="../../Image/ajax_loader_gray_49.gif" width="60" /></td>
                    </tr>
                </table>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
