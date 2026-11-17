<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="html_jojo_VisiterEntry, App_Web_5bk21qbu" %>


<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="../../dist/js/WebCam.js"></script>
    <script type="text/javascript">
        $(function () {
            Webcam.set({
                width: 320,
                height: 240,
                image_format: 'jpeg',
                jpeg_quality: 90
            });
            Webcam.attach('#webcam');
            $("#btnCapture").click(function () {
                Webcam.snap(function (data_uri) {
                    $("#imgCapture")[0].src = data_uri;
                    $("#btnUpload").removeAttr("disabled");
                });
            });
            $("#btnUpload").click(function () {                
                $.ajax({
                    type: "POST",
                    url: "VisiterEntry.aspx/SaveCapturedImage",
                    data: "{data: '" + $("#imgCapture")[0].src + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) { },
                   
                });
              
            });
        });
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <script type="text/javascript">
                function checkvalid() {
                    if (document.getElementById("<%=txtName.ClientID %>").value == "") {
                        document.getElementById("<%=lblMessage.ClientID%>").innerHTML = "Enter Name !";
                        document.getElementById("<%=txtName.ClientID %>").focus();
                        return false;
                    }
                    return true;
                }
                function Enable() {
                    $(document).ready(

                        function () {
                            
                            document.getElementById("<%=btnInsert.ClientID%>").disabled = false;
                        });
                }
            </script>
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title"><%--Heading--%>Visiter Entry</h4>
                    </div>
                </div>
            </div>
            <br />
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div id="Alert" class="alert alert-warning" role="alert" visible="false" runat="server">
                        </div>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                        <div class="col-md-6" style="float: left">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label col-form-label">Name</label>
                                            <asp:TextBox autocomplete="off" ID="txtName" CssClass="form-control" placeholder="Visiter Name" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label col-form-label">CNIC</label>
                                            <asp:TextBox autocomplete="off" ID="txtCNIC" CssClass="form-control" placeholder="Visiter CNIC" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label col-form-label">Mobile No</label>
                                            <asp:TextBox autocomplete="off" ID="txtMobileNo" CssClass="form-control" placeholder="Visiter Mobile No" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label col-form-label">Host</label>
                                            <asp:TextBox autocomplete="off" ID="txtMeetingWithEmoloyeeName" CssClass="form-control" placeholder="Visiter meet with" runat="server"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label col-form-label">Reason Of Visit</label>
                                            <asp:TextBox autocomplete="off" ID="txtReasonOfVisit" CssClass="form-control" placeholder="Reason Of Visit" runat="server"></asp:TextBox>

                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label col-form-label">Company Name</label>
                                            <asp:TextBox autocomplete="off" ID="txtVisiterCompanyName" CssClass="form-control" placeholder="Visiter Company Name" runat="server"></asp:TextBox>

                                        </div>

                                    </div>

                                    <div class="modal-footer">
                                        <asp:Button ID="btnInsert" OnClientClick=" return  checkvalid()"  CssClass="btn btn-primary pull-left" runat="server"
                                            Text="Save" OnClick="btnInsert_Click" />
                                        <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6" style="float: right">
                            <div class="row el-element-overlay" style="float: right">
                                <div style="float:left">
                                    <div class="card">
                                        <div class="el-card-item">
                                            <div class="el-card-avatar el-overlay-1">
                                                <div id="webcam"></div>
                                            </div>
                                            <div class="el-card-content">
                                                <input type="button" id="btnCapture" class="btn btn-info" value="Capture" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4"  style="float: right">
                                    <div class="card">
                                        <div class="el-card-item">
                                            <div class="el-card-avatar el-overlay-1">
                                                <img id="imgCapture" /></td>                               
                                            </div>
                                            <div class="el-card-content">
                                                <%--<asp:Button id="btnUpload"  CssClass="btn btn-success" runat="server" Text="Save" OnClick="btnUpload_Click" Enabled="false" />--%>
                                                <input type="button" id="btnUpload" class="btn btn-success" value="Upload" disabled="disabled" />
                                            </div>
                                        </div>
                                    </div>
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
                                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server"
                                    DataKey="DEPTID" GridLines="None" OnRowCommand="GridView1_RowCommand">
                                    <Columns>

                                        <asp:TemplateField HeaderText="OUT">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton2" runat="server" CommandName="OUT" ToolTip="Click On Visiter OUT" ImageUrl="../../Image/OUT.png"
                                                    Width="25px" CommandArgument='<%#Eval("ID")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
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

