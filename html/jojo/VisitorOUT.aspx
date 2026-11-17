<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="html_jojo_VisitorOUT, App_Web_5bk21qbu" %>


<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
          
            </script>
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title"><%--Heading--%>Visiter OUT</h4>
                    </div>
                </div>
            </div>
            <br />
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="input-group" style="float: left; width: 100%">
                                    <%--Search--%>
                                    <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddlsearch" runat="server">

                                        <asp:ListItem Text="Name" Value="Name"></asp:ListItem>
                                        <asp:ListItem Text="CNIC" Value="CNIC"></asp:ListItem>
                                        <asp:ListItem Text="MobileNo" Value="MobileNo"></asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp;    
                                    <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtsearch" runat="server"></asp:TextBox>
                                    &nbsp;    
                                    <asp:Button ID="btnsearch" CssClass="btn btn-primary pull-left" runat="server" Text="Show" OnClick="btnsearch_Click" />
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Visiter OUT</h5>

                                <%--  Grid--%>
                                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server"   AutoGenerateColumns="false"
                                    DataKey="DEPTID" GridLines="None" OnRowCommand="GridView1_RowCommand">
                                    <Columns>

                                        <asp:TemplateField HeaderText="OUT">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton2" runat="server" CommandName="OUT" ToolTip="Click On Visiter OUT" ImageUrl="../../Image/OUT.png"
                                                    Width="25px" CommandArgument='<%#Eval("ID")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Image">
                                            <ItemTemplate>
                                                <img src='<%#Eval("FilePath") %>' width="50" height="50"></img>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField='ID' HeaderText='ID' />
                                        <asp:BoundField DataField='Name' HeaderText='Name' />
                                        <asp:BoundField DataField='CNIC' HeaderText='CNIC' />
                                        <asp:BoundField DataField='Mobile No' HeaderText='Mobile No' />
                                        <asp:BoundField DataField='Reason Of Visit' HeaderText='Reason Of Visit' />
                                        <asp:BoundField DataField='Visiter Company Name' HeaderText='Visiter Company Name' />
                                        <asp:BoundField DataField='Meeting With Emoloyee Name' HeaderText='Meeting With Emoloyee Name' />
                                        <asp:BoundField DataField='Created By' HeaderText='Created By' />
                                        <asp:BoundField DataField='IN Time' HeaderText='IN Time' />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        No Record Found !
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                            <%--OnClientClick="if (!confirm('Are you sure you want to delete?')) return false;"--%>
                        </div>


                    </div>
                </div>
                
        </ContentTemplate>
        <Triggers>
            <%--<asp:PostBackTrigger ControlID="GridView1" />--%>
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


