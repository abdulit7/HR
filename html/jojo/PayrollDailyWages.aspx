<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="html_jojo_PayrollDailyWages, App_Web_xu4ttdni" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $(function () {
            $('[id*=ListBAttendance]').multiselect({
                includeSelectAllOption: true
            });
        });
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">Payroll Daily Wages Report</h4>
                    </div>
                </div>
            </div>
            <br />
            <div class="container-fluid">
                <asp:Label ID="Label3" Visible="false" runat="server"></asp:Label>
                <div class="row">
                    <div class="col-12">
                        <div id="Alert" class="alert alert-warning" role="alert" visible="false" runat="server">
                        </div>
                        <div class="card">
                            <div class="card-body">
                                Department
                                <div class="input-group" style="float: left; width: 100%">
                                    &nbsp;
                                   <asp:ListBox SelectionMode="Multiple" CssClass="select2 form-control m-t-15" Height="36px" ID="ddldepartment" runat="server"
                                       AutoPostBack="true" OnSelectedIndexChanged="ddldepartment_SelectedIndexChanged"></asp:ListBox>

                                </div>
                                <br />
                                <br />
                                <br />
                                Employee
                                <div class="input-group" style="float: left; width: 100%">


                                    <asp:DropDownList CssClass="select2 form-control custom-select" Height="36px" ID="ddlemployee" runat="server">
                                    </asp:DropDownList>

                                    &nbsp;
                                       <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtfromdate" runat="server"></asp:TextBox>
                                    <div class="input-group-append">
                                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                    </div>
                                    &nbsp;
                                         <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txttodate" runat="server"></asp:TextBox>
                                    <div class="input-group-append">
                                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                    </div>
                                    &nbsp;
                                        <asp:DropDownList CssClass="form-control" Height="36px" ID="ddlReports" runat="server">
                                            <asp:ListItem Text="Payroll Detail" Value="Payroll Detail"></asp:ListItem>
                                            <asp:ListItem Text="Payroll Summary" Value="Payroll Summary"></asp:ListItem>
                                            <asp:ListItem Text="Payroll Present Today" Value="Payroll Present Today"></asp:ListItem>
                                            <asp:ListItem Text="Return Data" Value="Return Data"></asp:ListItem>
                                        </asp:DropDownList>

                                    &nbsp;
                                       <asp:Button ID="btnsearch" CssClass="btn btn-primary pull-left" runat="server" Text="Show" OnClick="btnsearch_Click" />
                                    &nbsp;
                                        <asp:ImageButton ID="btnExcel" ToolTip="Export Data to Excel" ImageUrl="../../Image/Excel.png" Width="35px" Height="35px" runat="server"
                                            OnClick="btnExcel_Click" />
                                    &nbsp;
                                        <asp:ImageButton ID="btnCrRep" ToolTip="Export Data to Excel" ImageUrl="../../Image/cr.jpg" Width="35px" Height="35px" runat="server"
                                            OnClick="btnCrRep_Click" />
                                    &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;
                                </div>
                                <%--<br />
                                <br />
                                <div class="input-group" style="float: left; width: 100%">
                                    <asp:ListBox ID="ListBAttendance" Width="90%" CssClass="select2 form-control m-t-15" SelectionMode="Multiple" runat="server">
                                        <asp:ListItem Text="IN OUT Time" Value=",[IN],OUT"></asp:ListItem>
                                        <asp:ListItem Text="Working Time" Value=",[dbo].[GetTimeDiffInHHMMSS](IN_Org,OUT_Org) [Working Time]"></asp:ListItem>

                                        <asp:ListItem Text="Late Minuts and Early Minuts" Value=",LateMinuts,EarlyMinuts"></asp:ListItem>

                                        <asp:ListItem Text="Shift" Value=",Shift_IN,Shift_OUT"></asp:ListItem>
                                        <asp:ListItem Text="Absent Days" Value=",[Absent Days]"></asp:ListItem>
                                        <asp:ListItem Text="Time Adjustment" Value=",IN_Adj,OUT_Adj"></asp:ListItem>

                                        <asp:ListItem Text="Out Door Visit" Value=",OutDoor_FromTime,OutDoor_ToTime"></asp:ListItem>
                                        <asp:ListItem Text="Late Sitting" Value=",LateSittingAmount"></asp:ListItem>
                                        <asp:ListItem Text="OverTime" Value=",OverTime"></asp:ListItem>
                                        <asp:ListItem Text="Daily Exemptions" Value=",LateCommingDailyMinuts [Daily Late Exempt], EarlyGoingDailyMinuts [Daily Early Exempt]"></asp:ListItem>
                                        <asp:ListItem Text="Monthly Exemptions" Value=",LateCommingMonthlyMinuts [Monthly Late Exempt],EarlyGoingMonthlyMinuts [Monthly Early Exempt]"></asp:ListItem>
                                        <asp:ListItem Text="Machine Time" Value=",IN_Org,OUT_Org"></asp:ListItem>
                                        <asp:ListItem Text="Joining Date" Value=",HIREDDAY"></asp:ListItem>
                                        <asp:ListItem Text="Holiday / Gazette" Value=",[Holiday/Gazette]"></asp:ListItem>
                                        <asp:ListItem Text="Morning and Evening Leaves" Value=",Morning,Evening"></asp:ListItem>
                                        <asp:ListItem Text="Days Before Joining" Value=",[Days Before Joining]"></asp:ListItem>
                                        <asp:ListItem Text="Days After Separation" Value=",[Days After Separation]"></asp:ListItem>

                                        <asp:ListItem Text="Unpaid Leaves" Value=",[Unpaid Leaves]"></asp:ListItem>
                                       
                                    </asp:ListBox>

                                </div>--%>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <asp:Panel ID="Panel2" ScrollBars="Horizontal" runat="server">
                                    <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="true" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound"
                                        DataKey="ID" GridLines="None">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Return">
                                                <ItemTemplate>
                                                    <asp:Button ID="ImageButtonReturn"  Visible='<%# Eval("RetID").ToString() == "0" ? true : false %>' Text="Return" 
                                                        CssClass="btn btn-danger"  runat="server" CommandName="Return" ToolTip="Edit Record" ImageUrl="../../Image/Edit.png"
                                                        CommandArgument='<%#Eval("UserID") + ";" +Eval("Dates")+ ";" +Eval("Salary")+ ";" +Eval("[Over Time Amount]")+ ";" +Eval("Loan")+ ";" +Eval("Fine")+ ";" +Eval("[Net Amount]") %>' />
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

            <script type="text/javascript">
                window.onload = function () {
                    var grid = document.getElementById("<%= GridView1.ClientID %>");

                    // header row index = 0
                    for (var i = 1; i < grid.rows.length; i++) {
                        // Status column (2nd index = 1, 3rd index = 2)
                        var statusCell = grid.rows[i].cells[1];

                        if (statusCell && statusCell.innerText.trim() === "Closed") {
                            var btn = grid.rows[i].querySelector("input[id*='ImageButtonReturn']");
                            if (btn) {
                                btn.disabled = true;
                                btn.style.backgroundColor = "green";
                                btn.style.color = "white";
                            }
                        }
                    }
                }
            </script>
            

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExcel" />
            <asp:PostBackTrigger ControlID="btnCrRep" />

        </Triggers>
    </asp:UpdatePanel>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" ClientIDMode="Static">
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


