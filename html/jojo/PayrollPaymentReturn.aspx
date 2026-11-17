<%@ page title="" language="C#" masterpagefile="~/html/jojo/MasterPage.master" autoeventwireup="true" inherits="html_jojo_PayrollPaymentReturn, App_Web_5bk21qbu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function ShowPopup(message) {
            $(function () {
                $("#dialog").html(message);
                $("#dialog").dialog({
                    title: "jQuery Dialog Popup",
                    buttons: {
                        Close: function () {
                            $(this).dialog('close');
                        }
                    },
                    modal: true
                });
            });
        };
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">Payroll Process</h4>
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

                        <h5 class="card-title">Run Payroll upto date</h5>
                        <div class="card">
                            <div class="card-body">
                                <div class="input-group" style="float: left; width: 100%">
                                    &nbsp;
                                         <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtMasterPayrollDate" runat="server"></asp:TextBox>
                                    <div class="input-group-append">
                                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                    </div>
                                    &nbsp;
                                         <asp:DropDownList CssClass="form-control" Height="36px" ID="ddldepartment" runat="server">
                                         </asp:DropDownList>
                                    &nbsp;
                                      <asp:Button ID="btnshowMasterPayroll" CssClass="btn btn-info" runat="server" Text="Show Master Payroll" OnClick="btnshowMasterPayroll_Click" />
                                    &nbsp;
                                       <asp:Button ID="btnPaymentAllEmployees" CssClass="btn btn-danger" runat="server" Text="Run Payroll" OnClick="btnPaymentAllEmployees_Click" />
                                    &nbsp;
                                    <asp:ImageButton ID="ImageButtonsdfs2sdfsdf2" runat="server" ImageUrl="../../Image/cr.jpg" ToolTip="Crystal Report" Width="35px" OnClick="ImageButtonsdfs2sdfsdf2_Click" />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                </div>
                            </div>

                        </div>
                        <h5 class="card-title">Master Payroll</h5>
                        <div class="card">
                            <div class="card-body">

                                <asp:GridView ID="grdMasterPayroll" CssClass="table editable-table table-bordered table-striped m-b-0" runat="server" AutoGenerateColumns="false" OnRowCommand="grdMasterPayroll_RowCommand"
                                    GridLines="None" DataKey="ID">
                                    <Columns>
                                        <asp:BoundField DataField='ID' HeaderText='ID' SortExpression='ID' />
                                        <asp:TemplateField HeaderText="Details">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton2sdf2" runat="server" ImageUrl="../../Image/Details.png" ToolTip="Click for Details"
                                                    Width="25px" CommandName="Details" CommandArgument='<%#Eval("ID") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:BoundField DataField='Department' HeaderText='Department' SortExpression='Department' />
                                        <asp:BoundField DataField='PayrollDate' HeaderText='Payroll Date' SortExpression='Payroll Date' />
                                        <asp:BoundField DataField='NoEmp' HeaderText='No Present Emp' SortExpression='NoEmp' />
                                        <asp:BoundField DataField='Total Amount of Payroll' HeaderText='Total Amount of Payroll' SortExpression='Total Amount of Payroll' />
                                        <asp:BoundField DataField='TransBy' HeaderText='Created By' SortExpression='TransBy' />
                                        <asp:BoundField DataField='TransDate' HeaderText='Created Date Time' SortExpression='Trans Date' />
                                        <asp:TemplateField HeaderText="Crystal Report">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton2sdfsdf2" runat="server" ImageUrl="../../Image/cr.jpg" ToolTip="Crystal Report"
                                                    Width="25px" CommandName="CrytatReport" CommandArgument='<%#Eval("ID") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Export Excel">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton2werwr2" runat="server" ImageUrl="../../Image/Excel.png" ToolTip="Export to Excel"
                                                    Width="25px" CommandName="Excel" CommandArgument='<%#Eval("ID") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete Payroll">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton2wesdfsdfrwr2" Visible='<%# Eval("Status").ToString() == "1" ? true : false %>' runat="server" ImageUrl="../../Image/Delete.png" ToolTip="Delete Payroll"
                                                    Width="25px" OnClientClick="if (!confirm('Are you sure you want to delete?')) return false;" CommandName="Deletes" CommandArgument='<%#Eval("ID") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        No Record Found !
                                    </EmptyDataTemplate>
                                </asp:GridView>

                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Payroll Payment Records </h5>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:Panel ID="Panel1" ScrollBars="Horizontal" runat="server">
                                            <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false"
                                                GridLines="None" DataKey="ID">
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
                                                    <asp:TemplateField HeaderText="Unpaid">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImageButton22" runat="server" ImageUrl="../../Image/Reject.png" ToolTip="Reject the Request"
                                                                Width="25px" CommandName="Excel" CommandArgument='<%#Eval("UserID") + ";" +Eval("TransDate") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField='Net Amount' HeaderText='Net Amount' SortExpression='Net Amount' />
                                                    <asp:BoundField DataField='TransDate' HeaderText='Trans Date' SortExpression='Trans Date' />
                                                    <%--<asp:BoundField DataField='UserID' HeaderText='UserID' SortExpression='UserID' />--%>
                                                    <%-- <asp:BoundField DataField='No of Days' HeaderText='No of Days' SortExpression='No of Days' />--%>
                                                    <asp:BoundField DataField='Salary' HeaderText='Salary' SortExpression='Salary' />
                                                    <asp:BoundField DataField='Late Comming & Early Going Deduction' HeaderText='Time Deduction' SortExpression='Late Comming & Early Going Deduction' />
                                                    <asp:BoundField DataField='Over Time Amount' HeaderText='Over Time Amount' SortExpression='Over Time Amount' />
                                                    <asp:BoundField DataField='Loan' HeaderText='Loan' SortExpression='Loan' />
                                                    <asp:BoundField DataField='Fine' HeaderText='Fine' SortExpression='Fine' />
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    No Record Found !
                                                </EmptyDataTemplate>
                                            </asp:GridView>
                                        </asp:Panel>
                                    </ContentTemplate>
                                    <Triggers>
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="container-fluid">
            </div>


        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="grdMasterPayroll" />
            <asp:PostBackTrigger ControlID="ImageButtonsdfs2sdfsdf2" />

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
