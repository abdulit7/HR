<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="Attendance_AllowanceDeduction, App_Web_xu4ttdni" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <script type="text/javascript">
                function checkvalid() {
                    var ddldepartment = document.getElementById("<%=ddldepartment.ClientID %>");
                    if (ddldepartment.selectedIndex == 0) {
                        document.getElementById("<%=lblMessage.ClientID%>").innerHTML = "Select Department !";
                        document.getElementById("<%=ddldepartment.ClientID %>").focus();
                        return false;
                    }
                    var ddlType = document.getElementById("<%=ddlType.ClientID %>");
                    if (ddlType.selectedIndex == 0) {
                        document.getElementById("<%=lblMessage.ClientID%>").innerHTML = "Select Type !";
                        document.getElementById("<%=ddlType.ClientID %>").focus();
                        return false;
                    }
                    var ddlAllowanceDeduction = document.getElementById("<%=ddlAllowanceDeduction.ClientID %>");
                    if (ddlAllowanceDeduction.selectedIndex == 0) {
                        document.getElementById("<%=lblMessage.ClientID%>").innerHTML = "Select Allowance / Deduction !";
                        document.getElementById("<%=ddlAllowanceDeduction.ClientID %>").focus();
                        return false;
                    }
                    var ddlMonth = document.getElementById("<%=ddlAmountType.ClientID %>");
                    if (ddlMonth.selectedIndex == 0) {
                        document.getElementById("<%=lblMessage.ClientID%>").innerHTML = "Select Amount Type !";
                        document.getElementById("<%=ddlAmountType.ClientID %>").focus();
                        return false;
                    }
                    if (document.getElementById("<%=txtAmount.ClientID %>").value == "") {
                        document.getElementById("<%=lblMessage.ClientID%>").innerHTML = "Enter Amount !";
                        document.getElementById("<%=txtAmount.ClientID %>").focus();
                        return false;
                    }
                    return true;
                }
            </script>
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title"><%--Heading--%>Allowance Deduction Entry</h4>
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
                                        <asp:ListItem Text="ID" Value="01"></asp:ListItem>
                                        <asp:ListItem Text="Name" Value="02"></asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp;        
                                    <asp:TextBox autocomplete="off" CssClass="form-control" ID="txtsearch" runat="server"></asp:TextBox>
                                    &nbsp;           
                                    <asp:Button ID="btnsearch" CssClass="btn btn-primary pull-left" runat="server" Text="Show" OnClick="btnsearch_Click" />
                                    &nbsp;    
                                    <asp:Button ID="btnadd" CssClass="btn btn-success" runat="server" Text="Add New" OnClick="btnadd_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Allowance Deduction</h5>
                          
                           <asp:Panel ID="Panel2" runat="server" Width="100%" ScrollBars="Horizontal">
                            <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false"
                                DataKey="ID" GridLines="None" OnRowCommand="GridView1_RowCommand">
                                <Columns>
                                    <%-- ID, UserID, Type, Description, Amount, Month, CreatedDateTime, CreatedBy, ModifiedDateTime, ModifiedBy--%>
                                    <asp:TemplateField HeaderText="Edit">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="DataCommand" ToolTip="Edit Record" ImageUrl="../../Image/Edit.png"
                                                Width="25px" CommandArgument='<%#Eval("ID") + ";" +Eval("UserID")+ ";" +Eval("Type") + ";" +Eval("Description")+ ";" +Eval("Amount") + ";" +Eval("Month") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ID" Visible="false" HeaderText="ID" SortExpression="ID" />
                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                    <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                                    <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
                                  <%--  <asp:BoundField DataField="CreatedDateTime" HeaderText="Entry Date" SortExpression="CreatedDateTime" />
                                    <asp:BoundField DataField="CreatedBy" HeaderText="Created By" SortExpression="CreatedBy" />
                                    <asp:BoundField DataField="ModifiedDateTime" HeaderText="Modified Date" SortExpression="ModifiedDateTime" />
                                    <asp:BoundField DataField="ModifiedBy" HeaderText="Modifie dBy" SortExpression="ModifiedBy" />--%>
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
                        <%--Head popup--%>Add  Allowance Deduction</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true ">&times;</span>
                    </button>
                </div>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">Department</label>
                                    <asp:DropDownList Height="36px" CssClass="form-control custom-select" ID="ddldepartment" runat="server"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddldepartment_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">Employee</label>
                                    <asp:DropDownList Height="36px" ID="ddlemployee" runat="server" CssClass="form-control custom-select">
                                    </asp:DropDownList>
                                </div>
                            </div>
                           <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">Type</label>
                                    <asp:DropDownList Height="36px" ID="ddlType" CssClass="form-control custom-select" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                                        <asp:ListItem Text="Allowance" Value="Allowance"></asp:ListItem>
                                        <asp:ListItem Text="Deduction" Value="Deduction"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">Allowance Deduction</label>
                                    <asp:DropDownList Height="36px" ID="ddlAllowanceDeduction" runat="server" CssClass="form-control custom-select">
                                    </asp:DropDownList>
                                </div>
                            </div>
                           <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">Amount Type</label>
                                    <asp:DropDownList Height="36px" ID="ddlAmountType" runat="server" CssClass="form-control custom-select">
                                        <asp:ListItem Text="-= Select =-" Value="Select"></asp:ListItem>
                                        <asp:ListItem Text="Percentage of basic Salary" Value="Percentage"></asp:ListItem>
                                        <asp:ListItem Text="Amount" Value="Amount"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">Value</label>
                                    <asp:TextBox autocomplete="off" ID="txtAmount" CssClass="form-control" placeholder="Amount Or Percentage" onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;" MaxLength="40" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="input-group" style="float: left; width: 100%">
                            </div>
                        </div>
                         <div class="modal-footer">
                               <asp:Button ID="btnInsert" OnClientClick=" return  checkvalid()" CssClass="btn btn-primary pull-left" runat="server"
                                    Text="Save" OnClick="btnInsert_Click" />
                                <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Close</button>
                            </div>
                   </ContentTemplate>
                </asp:UpdatePanel>
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
                        <td style="text-align: center;"><img src="../../Image/ajax_loader_gray_49.gif" width="60" /></td>
                    </tr>
                </table>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
