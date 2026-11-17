<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="html_finex_HRAttSummary, App_Web_5bk21qbu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">HR Attendance Summary Report</h4>
                    </div>
                </div>
            </div>
            <br />
            <div class="container-fluid">
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <div class="row">
                    <div class="col-12">
                        <div id="Alert" class="alert alert-warning" role="alert" visible="false" runat="server">
                       </div>
                        <div class="card">
                            <div class="card-body">
                                <div class="input-group" style="float: left; width: 100%">
                                    <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddldepartment" runat="server"
                                       AutoPostBack="true" OnSelectedIndexChanged="ddldepartment_SelectedIndexChanged">
                                   </asp:DropDownList>
                                    &nbsp;
                                    <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddluser" runat="server">
                                    </asp:DropDownList>
                                    &nbsp;
                                        <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtFromDate" runat="server"></asp:TextBox>
                                     <div class="input-group-append">
                                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                    </div>
                                    &nbsp;
                                         <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtToDate" runat="server"></asp:TextBox>
                                    <div class="input-group-append">
                                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                    </div>
                                    &nbsp;
                                        <asp:Button ID="btnsearch" CssClass="btn btn-primary" runat="server" Text="Show" OnClick="btnsearch_Click" />
                                    &nbsp;
                                         <asp:ImageButton ID="btnExcel" ToolTip="Export Data to Excel" ImageUrl="../../Image/Excel.png" Width="35px" Height="35px" runat="server" OnClick="btnExcel_Click" />
                                </div>
                            </div>
                        </div>
                        <div id="DivBody" runat="server" visible="false">
                            <h4>Day Deduction Summary</h4>
                            <div class="card"> <div class="card-body">
                                 <asp:Panel ID="Panel2" runat="server" Width="100%" ScrollBars="Horizontal">
                                <asp:GridView ID="GRDDaySummary" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="true"
                                    GridLines="None">
                                    <EmptyDataTemplate>
                                        No Record Found !
                                    </EmptyDataTemplate>
                                </asp:GridView> </asp:Panel> </div>
                            </div>
                            <h4>Time Deduction Summary</h4>
                            <div class="card"> <div class="card-body">
                                 <asp:Panel ID="Panel1" runat="server" Width="100%" ScrollBars="Horizontal">
                                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="true"
                                    GridLines="None">
                                    <EmptyDataTemplate>
                                        No Record Found !
                                    </EmptyDataTemplate>
                                </asp:GridView> </asp:Panel> </div>
                            </div>
                            <h4>Attendance Details</h4>
                            <div class="card"> <div class="card-body">
                                 <asp:Panel ID="Panel3" runat="server" Width="100%" ScrollBars="Horizontal">
                                <asp:GridView ID="grdDetail" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false"
                                    GridLines="None" OnRowDataBound="grdDetail_RowDataBound">
                                    <Columns>
                                       <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                        <asp:TemplateField HeaderText="Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFromdate" runat="server" Text='<%#Eval("Date", "{0:dd-MM-yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="IN" HeaderText="IN" SortExpression="IN" />
                                        <asp:BoundField DataField="OUT" HeaderText="OUT" SortExpression="OUT" />
                                        <asp:BoundField DataField="LateMinuts" HeaderText="Late" SortExpression="Late" />
                                        <asp:BoundField DataField="EarlyMinuts" HeaderText="Early" SortExpression="Early" />
                                        <asp:BoundField DataField="Holiday/Gazette" HeaderText="Holiday/Gazette" SortExpression="Holiday/Gazette" />
                                        <asp:BoundField DataField="LateSittingAmount" HeaderText="LateSittingAmount" SortExpression="LateSittingAmount" />
                                        <asp:BoundField DataField="LeaveName" HeaderText="LeaveName" SortExpression="LeaveName" />
                                   </Columns>
                                    <EmptyDataTemplate>
                                        No Record Found !
                                    </EmptyDataTemplate>
                                </asp:GridView></asp:Panel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
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

