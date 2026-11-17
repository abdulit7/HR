<%@ page title="" language="C#" masterpagefile="~/html/jojo/MasterPage.master" autoeventwireup="true" inherits="html_jojo_NewEmployees, App_Web_5bk21qbu" %>

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
                                <h5 class="card-title">Head Office Employee Shifts</h5>

                                <asp:Panel ID="Panel1" runat="server" Width="100%" ScrollBars="Horizontal">
                                    <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false"
                                        DataKey="USERID" GridLines="None" DataKeyNames="USERID"
                                        OnRowDataBound="GridView1_RowDataBound" AllowPaging="True" PageSize="10" >
                                        <Columns>
                                            <asp:TemplateField HeaderText="UserID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="UserID" runat="server" Text='<%# Eval("USERID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                           
                                            <asp:BoundField DataField="MachineCode" HeaderText="Machine Code" SortExpression="MachineCode" />
                                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                            <asp:BoundField DataField="DEPTNAME" HeaderText="Department" SortExpression="DEPTNAME" />

                                            
                                            
                                           
                                            <asp:TemplateField HeaderText="Select Department">
                                                <ItemTemplate>
                                                    <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddlShift" runat="server"
                                                        AutoPostBack="True" OnSelectedIndexChanged="ddlShift_SelectedIndexChanged">
                                                    </asp:DropDownList>
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
           

        </Triggers>
    </asp:UpdatePanel>
    
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

