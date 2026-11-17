<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="Attendance_SecurityRole, App_Web_5bk21qbu" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">SecurityRole</h4>
                    </div>
                </div>
            </div>
            <br />
            <div class="container-fluid">
                <asp:Label ID="Label4" runat="server"></asp:Label>
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <div class="row">
                    <div class="col-12">
                        <div id="Alert" class="alert alert-warning" role="alert" visible="false" runat="server">
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <div class="input-group" style="float: left; width: 100%">
                                    <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddlsearch" runat="server">
                                        <asp:ListItem Text="ID" Value="ID"></asp:ListItem>
                                        <asp:ListItem Text="Role Name" Value="RoleName"></asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp;
                                         <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtsearch" runat="server"></asp:TextBox>
                                    &nbsp;
                                   <asp:Button ID="btnsearch" CssClass="btn btn-primary" runat="server" Text="Show" OnClick="btnsearch_Click" />
                                    &nbsp;
                                    <asp:Button ID="btnadd" CssClass="btn btn-primary" runat="server" Text="Add New" OnClick="btnadd_Click2" />
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false"
                                    DataKey="ID" GridLines="None" OnRowCommand="GridView1_RowCommand">
                                    <Columns>
                                        <asp:BoundField DataField="ID" Visible="false" HeaderText="ID" SortExpression="ID" />
                                        <asp:BoundField DataField="RoleName" HeaderText="Name" SortExpression="Name" />
                                        <asp:BoundField DataField="NoofPages" HeaderText="No of Pages" SortExpression="NoofPages" />
                                        <asp:TemplateField HeaderText="Edit">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="DataCommand" ImageUrl="../../Image/Edit.png"
                                                    Width="25px" CommandArgument='<%#Eval("ID") + ";" +Eval("RoleName") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Delete" ImageUrl="../../Image/Delete.png"
                                                    OnClientClick="if (!confirm('Are you sure you want to delete?')) return false;"
                                                    Width="25px" CommandArgument='<%#Eval("ID") + ";" +Eval("RoleName") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Rights">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton2551" runat="server" ImageUrl="../../Image/Key.png"
                                                    Width="25px" CommandName="Rights" CommandArgument='<%#Eval("ID") + ";" +Eval("RoleName") %>' />
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
            <div class="modal fade" id="Modal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true ">
                <div class="modal-dialog modal-xl" role="document ">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">
                                <%--Head popup--%>Add Role Name</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true ">&times;</span>
                            </button>
                        </div>
                        <asp:Label ID="Label5" runat="server" ForeColor="Blue"></asp:Label>
                        <div class="modal-body">
                            <div class="input-group" style="float: left; width: 100%">
                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtName" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnInsert" OnClientClick=" return  checkvalid()" CssClass="btn btn-primary pull-left" runat="server"
                                Text="Save" OnClick="btnInsert_Click" />
                            <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="Modal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true ">
                <div class="modal-dialog modal-xl" role="document ">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel1">
                                <%--Head popup--%>Edit Employee Rights (<asp:Label ID="Label2" ForeColor="Red" runat="server"></asp:Label>)</h3>
                                        <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
                                <h5></h5>
                                <button aria-label="Close" class="close" data-dismiss="modal" type="button">
                                    <span aria-hidden="true ">×</span>
                                </button>
                            </h5>
                        </div>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Blue"></asp:Label>
                        <div class="modal-body">
                            <div class="input-group" style="float: left; width: 100%">
                            <asp:Panel ID="Panel5" Height="300px" Width="100%" ScrollBars="Vertical" runat="server">
                                <asp:TreeView ID="TreeView1" runat="server" onclick="ShowText()" ShowCheckBoxes="Leaf" NodeIndent="15" ShowLines="True" Font-Bold="False" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged">
                                    <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                                    <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                                        NodeSpacing="0px" VerticalPadding="2px" Font-Bold="True"></NodeStyle>
                                    <ParentNodeStyle Font-Bold="True" />
                                    <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                                        VerticalPadding="0px" />
                                </asp:TreeView>
                                </asp:Panel>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnRights" CssClass="btn btn-primary pull-left" runat="server"
                                Text="Update" OnClick="btnRights_Click" />
                            <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>

            <asp:PostBackTrigger ControlID="btnInsert" />

            <asp:PostBackTrigger ControlID="btnRights" />
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
