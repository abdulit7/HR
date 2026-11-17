<%@ page title="" language="C#" masterpagefile="~/html/jojo/MasterPage.master" autoeventwireup="true" inherits="html_jojo_ShiftDetailReport, App_Web_xu4ttdni" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $(function () {
            $('[id*=ListBAttendance]').multiselect({
                includeSelectAllOption: true
            });
        });
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">Shift Report</h4>
                    </div>
                </div>
            </div>
            <br />
            <div class="container-fluid">
                <asp:Label ID="Label3" Visible="false" runat="server"></asp:Label>
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
                                       <asp:Button ID="btnsearch" CssClass="btn btn-primary pull-left" runat="server" Text="Show" OnClick="btnsearch_Click" />
                                    &nbsp;
                                        <asp:ImageButton ID="btnExcel" ToolTip="Export Data to Excel" ImageUrl="../../Image/Excel.png" Width="35px" Height="35px" runat="server"
                                            OnClick="btnExcel_Click" />
                                </div>
                                
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <asp:Panel ID="Panel2" ScrollBars="Horizontal" runat="server">
                                    <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="true"
                                        DataKey="ID" GridLines="None">
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
            <asp:PostBackTrigger ControlID="btnExcel" />
           
        </Triggers>
    </asp:UpdatePanel>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" ClientIDMode="Static">
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

