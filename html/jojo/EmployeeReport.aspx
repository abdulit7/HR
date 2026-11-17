<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="html_jojo_EmployeeReport, App_Web_5bk21qbu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="page-breadcrumb">
                    <div class="row">
                        <div class="col-12 d-flex no-block align-items-center">
                            <h4 class="page-title">Employee Report</h4>
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
                                        
                                        <asp:ImageButton ID="btnExcel" ToolTip="Excel format to uplaod leave balance" ImageUrl="../../Image/Excel.png" Width="35px" Height="35px" runat="server"
                                            OnClick="btnExcel_Click" />

                                    </div>
                                </div>
                              <div class="input-group" style="float: left; width: 100%">
                                   <asp:ListBox SelectionMode="Multiple" CssClass="select2 form-control m-t-15" Height="36px" Width="100%" ID="ListBox1" runat="server"
                                                ></asp:ListBox>
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
                                                AutoGenerateColumns="true" DataKey="UserID" GridLines="None">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Name" HeaderStyle-Width="300px">
                                                        <ItemTemplate>
                                                            <div class="d-flex no-block align-items-center">
                                                                <div class="mr-2">
                                                                    <img src="./ShowSmallImage.ashx?id='<%#Eval("UserID")%>'" alt="user" class="rounded-circle" />
                                                                </div>
                                                                <div class="">
                                                                    <h5 class="mb-0 font-16 font-medium">
                                                                        <asp:Label ID="lblDateLeave" runat="server" Text='<%#Eval("Name") %>'></asp:Label></h5>
                                                                    <span>
                                                                        <asp:Label ID="Label634" ForeColor="Gray" runat="server" Text='<%#Eval("Designation") %>'></asp:Label></span>
                                                                    <br />
                                                                    <span>
                                                                        <asp:Label ID="Label7234" runat="server" ForeColor="Green" Text='<%#Eval("Department") %>'></asp:Label></span>
                                                                </div>
                                                            </div>
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
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExcel" />
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

