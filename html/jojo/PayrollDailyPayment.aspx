<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="html_HRIS_Demo_PayrollDailyPayment, App_Web_5bk21qbu" %>

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
                    <asp:Label ID="lblTotalEmployees" runat="server"></asp:Label>
                    <asp:Label ID="lblFilterEmployees" runat="server"></asp:Label>
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

                                       <%-- <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtDate" runat="server"></asp:TextBox>
                                        <div class="input-group-append">
                                            <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                        </div>--%>
                                        <asp:Button ID="btnsearch" CssClass="btn btn-primary pull-left w-50" runat="server" Text="Show" OnClick="btnsearch_Click" />

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 col-xl-6">
                            <div class="card card-hover">
                                <div class="card-body">
                                    <div class="d-md-flex align-items-center">
                                        <div>
                                            <h4 class="card-title">
                                                <asp:Label ID="lblEmpName" runat="server"></asp:Label>
                                            </h4>
                                            <h5 class="card-subtitle">
                                                <asp:Label ID="lblEmpFatherName" runat="server"></asp:Label></h5>
                                        </div>
                                        <div class="ml-auto align-items-center">
                                            <asp:Button ID="BtnPayment" Enabled="false" CssClass="btn btn-danger" runat="server" Text="Proceed to payment " OnClick="BtnPayment_Click" />
                                        </div>

                                    </div>
                                    <div class="pull-right m-t-30 text-right">
                                        <hr>
                                        <h3>
                                            <asp:Label ID="lblNetAmount" runat="server"></asp:Label></h3>
                                    </div>
                                    <!-- column -->
                                    <div class="row mt-5">
                                        <!-- column -->
                                        <div class="col-lg-12">
                                            <asp:Panel ID="Panel2" runat="server" ScrollBars="Horizontal">
                                                <asp:GridView ID="GRDSumData" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false"
                                                    GridLines="None">
                                                    <Columns>
                                                        <asp:BoundField DataField='Salary' HeaderText='Salary' />
                                                        <asp:BoundField DataField='Late Comming & Early Going Deduction' HeaderText='Late & Early Deduction' />
                                                        <asp:BoundField DataField='Over Time Amount' HeaderText='Over Time Amount' />
                                                        <asp:BoundField DataField='Loan' HeaderText='Loan' />
                                                        <asp:BoundField DataField='Fine' HeaderText='Fine' />
                                                        <%--<asp:BoundField DataField='Net Amount' HeaderText='Net Amount' />--%>
                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        No Record Found !
                                                    </EmptyDataTemplate>
                                                </asp:GridView>
                                            </asp:Panel>

                                        </div>
                                        <!-- column -->

                                    </div>
                                    <!-- column -->
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-xl-6">
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
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-md-flex align-items-center">
                                        <div>
                                            <h4 class="card-title">Payment Details Date wise</h4>
                                          
                                        </div>

                                    </div>
                                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal">
                                        <asp:GridView ID="GRDDetails" CssClass="table table-striped table-bordered" runat="server"
                                            GridLines="None">
                                            <%--<Columns>
                                                        <asp:BoundField DataField='Salary' HeaderText='Salary' />
                                                        <asp:BoundField DataField='Late Comming & Early Going Deduction' HeaderText='Late & Early Deduction' />
                                                        <asp:BoundField DataField='Over Time Amount' HeaderText='Over Time Amount' />
                                                        <asp:BoundField DataField='Loan' HeaderText='Loan' />
                                                        <asp:BoundField DataField='Fine' HeaderText='Fine' />
                                                        <asp:BoundField DataField='Net Amount' HeaderText='Net Amount' />
                                                    </Columns>--%>
                                            <EmptyDataTemplate>
                                                No Record Found !
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-md-flex align-items-center">
                                        <div>
                                            <h4 class="card-title">Security Record</h4>
                                          
                                        </div>

                                    </div>
                                    <asp:Panel ID="Panel3" runat="server" ScrollBars="Horizontal">
                                        <asp:GridView ID="GRDSecRec" CssClass="table table-striped table-bordered" runat="server"
                                            GridLines="None">
                                            <%--<Columns>
                                                        <asp:BoundField DataField='Salary' HeaderText='Salary' />
                                                        <asp:BoundField DataField='Late Comming & Early Going Deduction' HeaderText='Late & Early Deduction' />
                                                        <asp:BoundField DataField='Over Time Amount' HeaderText='Over Time Amount' />
                                                        <asp:BoundField DataField='Loan' HeaderText='Loan' />
                                                        <asp:BoundField DataField='Fine' HeaderText='Fine' />
                                                        <asp:BoundField DataField='Net Amount' HeaderText='Net Amount' />
                                                    </Columns>--%>
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
            </div>
        </ContentTemplate>
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

