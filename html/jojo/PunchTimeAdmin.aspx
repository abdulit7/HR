<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="html_ltr_PunchTimeAdmin, App_Web_5bk21qbu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function checkvalid() {

            if (document.getElementById("<%=txtFromDateInsert.ClientID %>").value == "") {
                document.getElementById("<%=txtFromDateInsert.ClientID %>").focus();
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
                        <h4 class="page-title"><%--Heading--%>Punch IN Time , OUT Time Manualy By Admin</h4>
                    </div>
                </div>
            </div>

            <br />
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div id="Alert" class="alert alert-warning" role="alert" visible="false" runat="server">
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h4 class="page-title">Punch IN Time , OUT Time</h4>
                                <div class="input-group" style="float: left; width: 100%">

                                    <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddldepartment" runat="server"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddldepartment_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    &nbsp;
                                        <asp:DropDownList CssClass="select2 form-control custom-select" AutoPostBack="true" Height="36px" ID="ddlemployee" runat="server" OnSelectedIndexChanged="ddlemployee_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    &nbsp;   
                                    <%--<asp:TextBox CssClass="form-control" autocomplete="off" Enabled="true" ID="txtDateTime" runat="server"></asp:TextBox>--%>
                                    <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtFromDateInsert" placeholder="Date" runat="server"></asp:TextBox>
                                    <div class="input-group-append">
                                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                    </div>
                                    &nbsp;  
                                    <div>

                                        <asp:DropDownList CssClass="form-control custom-select" ID="ddlShiftINHour" Width="60px" runat="server" onChange="LateSittingOverTime();">
                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                            <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                            <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                            <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                            <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                        </asp:DropDownList>&nbsp;  
                                                        <asp:DropDownList CssClass="form-control custom-select" ID="ddlShiftINMinut" Width="60px" runat="server" onChange="LateSittingOverTime();">
                                                            <asp:ListItem Text="5" Value="05"></asp:ListItem>
                                                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                                            <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                                            <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                                            <asp:ListItem Text="25" Value="25"></asp:ListItem>
                                                            <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                                            <asp:ListItem Text="35" Value="35"></asp:ListItem>
                                                            <asp:ListItem Text="40" Value="40"></asp:ListItem>
                                                            <asp:ListItem Text="45" Value="45"></asp:ListItem>
                                                            <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                                            <asp:ListItem Text="55" Value="55"></asp:ListItem>
                                                            <asp:ListItem Text="00" Value="00"></asp:ListItem>
                                                        </asp:DropDownList>&nbsp;  
                                                        <asp:DropDownList CssClass="form-control custom-select" ID="ddlShiftINAMPM" Width="70px" runat="server" onChange="LateSittingOverTime();">
                                                            <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                                            <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                                                        </asp:DropDownList>
                                    </div>

                                    &nbsp;   
                                    <asp:Button ID="btnPunchINTime" OnClientClick=" return  checkvalid()" CssClass="btn btn-primary pull-left" runat="server" Text="Punch IN Time" OnClick="btnPunchINTime_Click" />
                                    &nbsp;    
                                    <asp:Button ID="btnPunchOUTTime" OnClientClick=" return  checkvalid()" CssClass="btn btn-danger" runat="server" Text="Punch OUT Time" OnClick="btnPunchOUTTime_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h4 class="page-title">Search IN Time and OUT Time Records</h4>
                                <div class="input-group" style="float: left; width: 100%">
                                    <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddlDepSearch" runat="server"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlDepSearch_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    &nbsp;
                                        <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddlEmployeeSearch" runat="server">
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
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <asp:Panel ID="Panel2" runat="server" Width="100%" ScrollBars="Horizontal">
                                        <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="true"
                                            GridLines="None" OnRowCommand="GridView1_RowCommand">

                                            <Columns>
                                               <%-- <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                                <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" />
                                                <asp:TemplateField HeaderText="Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFromdate" runat="server" Text='<%#Eval("Date", "{0:dd-MM-yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Day" HeaderText="Day" SortExpression="Day" />
                                                <asp:BoundField DataField="Shift" HeaderText="Shift" SortExpression="Shift" />
                                                <asp:BoundField DataField="IN" HeaderText="IN" SortExpression="IN" />
                                                <asp:BoundField DataField="OUT" HeaderText="OUT" SortExpression="OUT" />
                                                <asp:BoundField DataField="Diff Time" HeaderText="Diff Time" SortExpression="Diff Time" />--%>
                                                <asp:TemplateField HeaderText="Delete">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Delete" ToolTip="Delete Record" ImageUrl="../../Image/Delete.png"
                                                            OnClientClick="if (!confirm('Are you sure you want to delete?')) return false;"
                                                            Width="25px" CommandArgument='<%#Eval("UserID") + ";" +Eval("CHECKTIME")%>' />
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
            </div>

        </ContentTemplate>
        <Triggers>
             <asp:PostBackTrigger ControlID="btnExcel" />
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

