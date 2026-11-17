<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="Attendance_AttSetup, App_Web_xu4ttdni" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#txtShiftIN').timepicker({
                hourGrid: 4,
                minuteGrid: 10,
                timeFormat: 'hh:mm tt'
            });
        });
    </script>
    <script type="text/javascript">
        function checkvalid() {
            if (document.getElementById("<%=txtName.ClientID %>").value == "") {
                document.getElementById("<%=lblMessage.ClientID%>").innerHTML = "Enter Name !";
                document.getElementById("<%=txtName.ClientID %>").focus();
                return false;
            }
            return true;
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <div class="header">
                <h1 class="page-title">
                    Attendance Setup</h1>
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
                                    <td style="width: 5%">
                                    </td>
                                    <td style="width: 10%; padding-bottom: 12px; text-align: left">
                                        Where
                                    </td>
                                    <td style="width: 20%">
                                        <asp:DropDownList CssClass="form-control custom-select" Height="36px"  ID="ddlsearch" runat="server" >
                                            <asp:ListItem Text="Code" Value="01"></asp:ListItem>
                                            <asp:ListItem Text="Name" Value="02"></asp:ListItem>
                                            <asp:ListItem Text="Description" Value="03"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 5%">
                                    </td>
                                    <td style="width: 10%; padding-bottom: 12px; text-align: left">
                                        Like
                                    </td>
                                    <td style="width: 20%">
                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtsearch"  runat="server"></asp:TextBox>
                                    </td>
                                    <td style="width: 20%; padding-bottom: 12px">
                                        <asp:Button ID="btnsearch" CssClass="btn btn-primary pull-left" runat="server" Text="Show" OnClick="btnsearch_Click" />
                                        <asp:Button ID="btnadd" CssClass="btn btn-success"  runat="server" Text="Add New" OnClick="btnsearch_Click" />
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
                                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ItemStyle-Width="300px" />
                                            <asp:BoundField DataField="Shift_IN" HeaderText="Shift_IN" SortExpression="Shift_IN" />
                                            <asp:BoundField DataField="Shift_OUT" HeaderText="Shift_OUT" SortExpression="Shift_OUT" />
                                           
                                            <asp:BoundField DataField="RestDay" HeaderText="RestDay" SortExpression="RestDay" />
                                            <asp:BoundField DataField="Missing_IN_Minuts" HeaderText="MisIN_Mnts" SortExpression="Missing_IN_Minuts" />
                                            <asp:BoundField DataField="Missing_OUT_Minuts" HeaderText="MisOUT_Mnts" SortExpression="Missing_OUT_Minuts" />
                                            <asp:BoundField DataField="Missing_INOUT_Minuts" HeaderText="MisINOUT_Mnts" SortExpression="Missing_INOUT_Minuts" />
                                            <asp:BoundField DataField="LateCommingRelaxationMinuts" HeaderText="LateMnts" SortExpression="LateCommingRelaxationMinuts" />
                                            <asp:BoundField DataField="EarlyGoingRelaxationMinuts" HeaderText="EarlyMnts" SortExpression="EarlyGoingRelaxationMinuts" />
                                            <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" />
                                            <asp:BoundField DataField="DateCreated" HeaderText="DateCreated" SortExpression="DateCreated" />
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
                            <h3>
                                Add Setup</h3>
                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                        </div>
                        <div class="well">
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 10%">
                                    </td>
                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">
                                        Name :
                                    </td>
                                    <td style="width: 20%">
                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtName" MaxLength="40"  runat="server"></asp:TextBox>
                                    </td>
                                    <td style="width: 10%">
                                    </td>
                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">
                                        Rest Day :
                                    </td>
                                    <td style="width: 20%">
                                        <asp:DropDownList CssClass="form-control custom-select" Height="36px"  ID="ddlRestDay" runat="server">
                                            <asp:ListItem Text="Sunday" Value="Sunday"> </asp:ListItem>
                                            <asp:ListItem Text="Monday" Value="Monday"> </asp:ListItem>
                                            <asp:ListItem Text="Tuesday" Value="Tuesday"> </asp:ListItem>
                                            <asp:ListItem Text="Wednesday" Value="Wednesday"> </asp:ListItem>
                                            <asp:ListItem Text="Thursday" Value="Thursday"> </asp:ListItem>
                                            <asp:ListItem Text="Friday" Value="Friday"> </asp:ListItem>
                                            <asp:ListItem Text="Saturday" Value="Saturday"> </asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 10%">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%">
                                    </td>
                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">
                                        Shift IN :
                                    </td>
                                    <td style="width: 20%">
                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtShiftIN"  MaxLength="40" runat="server"></asp:TextBox>
                                        <ajax:CalendarExtender ID="CalendarExtender3" Format="dd-MM-yyyy HH':'mm':'ss" runat="server"
                                            PopupButtonID="txtShiftIN" TargetControlID="txtShiftIN">
                                        </ajax:CalendarExtender>
                                    </td>
                                    <td style="width: 10%">
                                    </td>
                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">
                                        Shift OUT :
                                    </td>
                                    <td style="width: 20%">
                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtShiftOUT" MaxLength="40"  runat="server"></asp:TextBox>
                                    </td>
                                    <td style="width: 10%">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%">
                                    </td>
                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">
                                        Start IN :
                                    </td>
                                    <td style="width: 20%">
                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtStartIN" MaxLength="40"  runat="server"></asp:TextBox>
                                    </td>
                                    <td style="width: 10%">
                                    </td>
                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">
                                        End IN :
                                    </td>
                                    <td style="width: 20%">
                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtEndIN"  MaxLength="40" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="width: 10%">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%">
                                    </td>
                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">
                                        Start OUT :
                                    </td>
                                    <td style="width: 20%">
                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="TxtStartOUT" MaxLength="40"  runat="server"></asp:TextBox>
                                    </td>
                                    <td style="width: 10%">
                                    </td>
                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">
                                        End OUT :
                                    </td>
                                    <td style="width: 20%">
                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtEndOUT"  MaxLength="40" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="width: 10%">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%">
                                    </td>
                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">
                                        Missing IN Minutes :
                                    </td>
                                    <td style="width: 20%">
                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtMissingINMinuts" MaxLength="40"  runat="server"></asp:TextBox>
                                    </td>
                                    <td style="width: 10%">
                                    </td>
                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">
                                        Missing OUT Minutes :
                                    </td>
                                    <td style="width: 20%">
                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtMissingOUTMinuts"  MaxLength="40" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="width: 10%">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%">
                                    </td>
                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">
                                        Missing IN & OUT Minutes :
                                    </td>
                                    <td style="width: 20%">
                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtMissingINOUTMinutes" MaxLength="40"  runat="server"></asp:TextBox>
                                    </td>
                                    <td style="width: 10%">
                                    </td>
                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">
                                        Late Relaxation Minutes :
                                    </td>
                                    <td style="width: 20%">
                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtLateRelaxationMinutes"  MaxLength="40"
                                            runat="server"></asp:TextBox>
                                    </td>
                                    <td style="width: 10%">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%">
                                    </td>
                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">
                                        Early Going Relexation Minutes :
                                    </td>
                                    <td style="width: 20%">
                                        <asp:TextBox CssClass="form-control"   autocomplete="off" ID="txtEarlyGoingRelexationMinutes" MaxLength="40" 
                                            runat="server"></asp:TextBox>
                                    </td>
                                    <td style="width: 10%">
                                    </td>
                                    <td style="width: 15%; padding-bottom: 12px; text-align: left">
                                    </td>
                                    <td style="width: 20%">
                                        <div>
                                            <div style="text-align: left; float: left">
                                                <asp:Button ID="btnClose" runat="server" CssClass="btn btn-inverse" Text="Close" />
                                            </div>
                                            <div style="text-align: right">
                                                <asp:Button ID="btnInsert" OnClientClick=" return  checkvalid()" CssClass="btn btn-primary pull-left" runat="server"
                                                    Text="Save" OnClick="btnInsert_Click" />
                                            </div>
                                        </div>
                                    </td>
                                    <td style="width: 10%">
                                    </td>
                                </tr>
                            </table>
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
