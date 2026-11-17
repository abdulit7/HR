<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="Attendance_DataArea, App_Web_5bk21qbu" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <script type="text/javascript">
                function checkvalid() {
                    if (document.getElementById("<%=txtName.ClientID %>").value == "") {
                        document.getElementById("<%=Alert.ClientID%>").innerHTML = "Enter Name !";
                        document.getElementById("<%=txtName.ClientID %>").focus();
                        return false;
                    }
                    if (document.getElementById("<%=txtAlias.ClientID %>").value == "") {
                        document.getElementById("<%=Alert.ClientID%>").innerHTML = "Enter Alias !";
                        document.getElementById("<%=txtAlias.ClientID %>").focus();
                        return false;
                    }
                    return true;
                }
            </script>
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">
                            <%--Heading--%>
                            Data Area</h4>
                    </div>
                </div>
            </div>
            <br />
            <div class="container-fluid">
                <asp:Label ID="Label4" Visible="false" runat="server"></asp:Label>
                <div class="row">
                    <div class="col-12">
                        <div id="Alert" class="alert alert-warning" role="alert" visible="false" runat="server">
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <div class="input-group" style="float: left; width: 100%">
                                    <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddlsearch"
                                        runat="server">
                                        <asp:ListItem Text="CompanyName" Value="01"></asp:ListItem>
                                        <asp:ListItem Text="Address" Value="02"></asp:ListItem>
                                        <asp:ListItem Text="City" Value="03"></asp:ListItem>
                                        <asp:ListItem Text="Phone" Value="03"></asp:ListItem>
                                        <asp:ListItem Text="EmailSystem" Value="03"></asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp;
                                    <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtsearch" runat="server"></asp:TextBox>
                                    &nbsp;
                                    <asp:Button ID="btnsearch" CssClass="btn btn-primary pull-left" runat="server" Text="Show"
                                        OnClick="btnsearch_Click" />
                                    &nbsp;
                                    <asp:Button ID="btnadd" CssClass="btn btn-success" runat="server" Text="Add New"
                                        OnClick="btnadd_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Data Area</h5>
                                <asp:Panel ID="Panel2" runat="server" Width="100%" ScrollBars="Horizontal">
                                    <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server"
                                        AutoGenerateColumns="false" DataKey="ID" GridLines="None" OnRowCommand="GridView1_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Rights">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton2551" runat="server" ImageUrl="../../Image/Key.png"
                                                        Width="25px" CommandName="Rights" CommandArgument='<%#Eval("ID") + ";" +Eval("CompanyName") + ";" +Eval("Address")  + ";" +Eval("City")+ ";" +Eval("Phone") + ";" +Eval("CompanyAlias")%>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
											<asp:TemplateField HeaderText="Edit">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton1erterte" runat="server" CommandName="Edits" ToolTip="Edit Record"
                                                        ImageUrl="../../Image/Edit.png" Width="25px" CommandArgument='<%#Eval("ID") + ";" +Eval("CompanyName") + ";" +Eval("Address")  + ";" +Eval("City")+ ";" +Eval("Phone") + ";" +Eval("CompanyAlias")%>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Dates">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton324321" runat="server" CommandName="Dates" ToolTip="Date"
                                                        ImageUrl="../../Image/calendar.png" Width="25px" CommandArgument='<%#Eval("ID") + ";" +Eval("CompanyName") + ";" +Eval("Address")  + ";" +Eval("City")+ ";" +Eval("Phone") + ";" +Eval("CompanyAlias")%>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Delete">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Deletes" ToolTip="Delete Record"
                                                        ImageUrl="../../Image/Delete.png" OnClientClick="if (!confirm('Are you sure you want to delete?')) return false;"
                                                        Width="25px" CommandArgument='<%#Eval("ID") + ";" +Eval("CompanyName") + ";" +Eval("Address")  + ";" +Eval("City")+ ";" +Eval("Phone") + ";" +Eval("CompanyAlias")%>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ID" Visible="false" HeaderText="ID" SortExpression="ID" />
                                            <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
                                            <asp:BoundField DataField="CompanyAlias" HeaderText="Alias" SortExpression="CompanyAlias" />
                                            
                                            <asp:BoundField DataField="AdminCode" HeaderText="AdminCode" SortExpression="AdminCode" />
                                            <asp:BoundField DataField="AdminPassword" HeaderText="AdminPassword" SortExpression="AdminPassword" />
                                        
                                            <asp:BoundField DataField="IsActive" HeaderText="Is Active" SortExpression="IsActive" />

                                            <asp:BoundField DataField="TotUser" HeaderText="TotUser" SortExpression="TotUser" />
                                            <asp:BoundField DataField="ActUser" HeaderText="ActUser" SortExpression="ActUser" />
                                            <asp:BoundField DataField="AttUser" HeaderText="AttUser" SortExpression="AttUser" />
                                            <asp:BoundField DataField="PayUser" HeaderText="PayUser" SortExpression="PayUser" />
                                            <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />

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
            <div class="modal fade" id="Modal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                aria-hidden="true ">
                <div class="modal-dialog modal-xl" role="document ">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">
                                <%--Head popup--%>
                                Add Company</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true ">&times;</span>
                            </button>
                        </div>
                        <asp:Label ID="Label5" runat="server" ForeColor="Blue"></asp:Label>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label col-form-label">
                                        Name</label>
                                    <asp:TextBox CssClass="form-control" autocomplete="off" placeholder="Name" ID="txtName"
                                        MaxLength="40" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label col-form-label">
                                        Address</label>
                                    <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtAddress" placeholder="Address"
                                        MaxLength="40" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label col-form-label">
                                        City</label>
                                    <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtCity" placeholder="City"
                                        MaxLength="40" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label col-form-label">
                                        Phone</label>
                                    <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtPhone" placeholder="Phone"
                                        MaxLength="40" runat="server"></asp:TextBox>
                                </div>
                            </div>
                              <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label col-form-label">
                                       Company Alias</label>
                                    <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtAlias" placeholder=" Company Alias"
                                        MaxLength="40" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label col-form-label">
                                        Is Active</label>
                                    <asp:CheckBox ID="chkIsActive" CssClass="form-control"  runat="server" Checked="true" />
                                </div>
                            </div>

                             <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label col-form-label">
                                       Admin Password</label>
                                    <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtAdminPassword" placeholder=" Company Alias"
                                        MaxLength="40" runat="server"></asp:TextBox>
                                </div>
                                 
                            </div>


                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnInsert" OnClientClick=" return  checkvalid()" CssClass="btn btn-primary pull-left"
                                runat="server" Text="Save" OnClick="btnInsert_Click" />
                            <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">
                                Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="Modal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                aria-hidden="true ">
                <div class="modal-dialog modal-xl" role="document ">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel12">
                                <%--Head popup--%>
                                Edit Employee Rights</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true ">&times;</span>
                            </button>
                        </div>
                        <asp:Label ID="Label6" runat="server" ForeColor="Blue"></asp:Label>
                        <div class="modal-body">
                            <div class="input-group" style="float: left; width: 100%">
                                <asp:Panel ID="Panel5" Height="300px" Width="100%" ScrollBars="Vertical" runat="server">
                                    <div class="well">
                                        <asp:TreeView ID="TreeView1" runat="server" onclick="ShowText()" ShowCheckBoxes="Leaf"
                                            NodeIndent="15" ShowLines="True" Font-Bold="False" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged">
                                            <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                                            <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                                                NodeSpacing="0px" VerticalPadding="2px" Font-Bold="True"></NodeStyle>
                                            <ParentNodeStyle Font-Bold="True" />
                                            <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                                                VerticalPadding="0px" />
                                        </asp:TreeView>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnRights" CssClass="btn btn-primary pull-left" runat="server" Text="Update"
                                OnClick="btnRights_Click" />
                            <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">
                                Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="Modal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                aria-hidden="true ">
                <div class="modal-dialog modal-xl" role="document ">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel1212">
                                <%--Head popup--%>
                                Create date for new company</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true ">&times;</span>
                            </button>
                        </div>
                        <asp:Label ID="Label1" runat="server" ForeColor="Blue"></asp:Label>
                        <div class="modal-body">
                            <div class="row">
                                <table>
                                    <tr class="row" id="TRFromDateTodate" runat="server">
                                        <td class="col-md-4">
                                            <div class="input-prepend">
                                                <span class="add-on"><i class="icon-calendar"></i></span>
                                                <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtFromDate" placeholder="From Date" runat="server"></asp:TextBox>
                                            </div>
                                        </td>
                                        <td class="col-md-4" id="TDToDate" runat="server">
                                            <div class="input-prepend">
                                                <span class="add-on"><i class="icon-calendar"></i></span>
                                                <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtToDate" placeholder="To Date" runat="server"></asp:TextBox>
                                            </div>
                                        </td>
                                        <td class="col-md-4" id="TD1" runat="server">
                                            <div class="input-prepend">
                                                <asp:Button ID="btnInsertDates" CssClass="btn btn-primary pull-left"
                                                    runat="server" Text="Dates" OnClick="btnInsertDates_Click" />
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">
                                Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <%--/////////////////////////////////////////////////////////////////--%>
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
                            <img src="../../Image/ajax_loader_gray_49.gif" width="60" />
                        </td>
                    </tr>
                </table>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
