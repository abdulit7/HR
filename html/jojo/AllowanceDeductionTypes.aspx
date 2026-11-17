<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="Attendance_AllowanceDeductionTypes, App_Web_5bk21qbu" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        function checkvalid() {
            if (document.getElementById("<%=txtName.ClientID %>").value == "") {
                document.getElementById("<%=lblMessage.ClientID%>").innerHTML = "Enter Name !";
                document.getElementById("<%=txtName.ClientID %>").focus();
                return false;
            }
            if (document.getElementById("<%=txtDescription.ClientID %>").value == "") {
                document.getElementById("<%=lblMessage.ClientID%>").innerHTML = "Enter Description !";
                document.getElementById("<%=txtDescription.ClientID %>").focus();
                return false;
            }
            return true;
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title"><%--Heading--%> Allowance and Deduction Types  Entry</h4>
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
                                    <%--Search--%>
                                    <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddlsearch" runat="server">
                                        <asp:ListItem Text="ID" Value="ID"></asp:ListItem>
                                        <asp:ListItem Text="Name" Value="Name"></asp:ListItem>
                                        <asp:ListItem Text="Description" Value="Description"></asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp;    
                                    <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtsearch" runat="server"></asp:TextBox>
                                    &nbsp;           
                                    <asp:Button ID="btnsearch" CssClass="btn btn-primary pull-left" runat="server" Text="Show" OnClick="btnsearch_Click" />
                                    &nbsp;      
                                    <asp:Button ID="btnadd" CssClass="btn btn-success" runat="server" Text="Add New" OnClick="btnadd_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Allowance and Deduction Types</h5>

                                <asp:Panel ID="Panel2" runat="server" Width="100%" ScrollBars="Horizontal">
                                    <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false"
                                        DataKey="ID" GridLines="None" OnRowCommand="GridView1_RowCommand">
                                        <Columns>
                                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                                            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                            <asp:BoundField DataField="CreatedDateTime" HeaderText="Entry Date" SortExpression="CreatedDateTime" />
                                            <asp:BoundField DataField="CreatedBy" HeaderText="Created By" SortExpression="CreatedBy" />
                                            <asp:BoundField DataField="ModifiedDateTime" HeaderText="Modified Date" SortExpression="ModifiedDateTime" />
                                            <asp:BoundField DataField="ModifiedBy" HeaderText="Modifie dBy" SortExpression="ModifiedBy" />
                                            <asp:TemplateField HeaderText="Edit">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandName="DataCommand" ToolTip="Edit Record" ImageUrl="../../Image/Edit.png"
                                                        Width="25px" CommandArgument='<%#Eval("ID") + ";" +Eval("Name")+ ";" +Eval("Description") + ";" +Eval("Type") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Delete">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Delete" ToolTip="Delete Record" ImageUrl="../../Image/Delete.png"
                                                        OnClientClick="if (!confirm('Are you sure you want to delete?')) return false;"
                                                        Width="25px" CommandArgument='<%#Eval("ID")%>' />
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
    </asp:UpdatePanel>
    <div class="modal fade" id="Modal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true ">
        <div class="modal-dialog modal-xl" role="document ">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">
                        <%--Head popup--%>Add  Allowance and Deduction Types</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true ">&times;</span>
                    </button>
                </div>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-12 col-md-6">
                            <div class="form-group">
                                <label for="inputname" class="control-label col-form-label">Type</label>
                                <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddlType" runat="server">
                                    <asp:ListItem Text="Allowance" Value="Allowance"></asp:ListItem>
                                    <asp:ListItem Text="Deduction" Value="Deduction"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-6">
                            <div class="form-group">
                                <label for="inputname" class="control-label col-form-label">Name</label>
                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtName" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-6">
                            <div class="form-group">
                                <label for="inputname" class="control-label col-form-label">Description</label>
                                <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtDescription" runat="server"></asp:TextBox>
                            </div>
                        </div>
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
