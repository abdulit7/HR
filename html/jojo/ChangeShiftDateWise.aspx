<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="Attendance_ChangeShiftDateWise, App_Web_5bk21qbu" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function Clr() {
            PageMethods.Clear();
        }
    </script>
    <script language="javascript" type="text/javascript">
        //this script will get the date selected from the given calendarextender (ie: "sender") and append the
        //current time to it.
        function AppendTime(sender, args) {
            var selectedDate = new Date();
            selectedDate = sender.get_selectedDate();
            var now = new Date();
            sender.get_element().value = selectedDate.format("mm/dd/yyyy") + " " + now.format("hh:mm tt");
        }
   </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
           <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title"><%--Heading--%>Change Shift Date Wise</h4>
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
                                    &nbsp;                                       
                            <asp:DropDownList CssClass="form-control custom-select" Height="36px"  ID="ddldepartment" runat="server"
                                 AutoPostBack="true" OnSelectedIndexChanged="ddldepartment_SelectedIndexChanged">
                             </asp:DropDownList>
                                    &nbsp;    
                                        <asp:DropDownList CssClass="form-control custom-select" Height="36px"   ID="ddlemployee" runat="server">
                                        </asp:DropDownList>
                                    &nbsp;    
                                        <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtfromdate" runat="server"></asp:TextBox>
                                    <div class="input-group-append">
                                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                    </div>
                                   &nbsp;    
                                        
                                            <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txttodate"   runat="server"></asp:TextBox>
                                      <div class="input-group-append">
                                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                    </div>
                                   &nbsp;    
                                        <asp:Button ID="btnsearch" CssClass="btn btn-primary pull-left" runat="server" Text="Show" OnClick="btnsearch_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Change Shift Date Wise</h5>
                            
                            <%--  Grid--%>
                            <asp:Panel ID="Panel3" ScrollBars="Horizontal" Width="100%" runat="server">
                                <asp:GridView ID="grdShiftdetails" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false"
                                    DataKey="USERID" GridLines="None" DataKeyNames="USERID" OnRowDataBound="grdShiftdetails_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="ID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                        <asp:TemplateField HeaderText="Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFromdate" runat="server" Text='<%#Eval("Date", "{0:dd-MM-yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Shift">
                                            <ItemTemplate>
                                                <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddlShiftDetails" runat="server"
                                                    AutoPostBack="True" OnSelectedIndexChanged="ddlShiftDetails_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="UserID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="UserID" runat="server" Text='<%# Eval("USERID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="Date" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Setup" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="ShiftID" runat="server" Text='<%# Eval("ShiftID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="DateCreated" HeaderText="Created Date Time" SortExpression="CreatedDateTime" />
                                        <asp:BoundField DataField="CreatedBy" HeaderText="Created By" SortExpression="CreatedBy" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        No Record Found !
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </asp:Panel></div>
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

