<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="Attendance_Password, App_Web_xu4ttdni" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <script type="text/javascript">
                function checkvalid() {
                   
                    if (document.getElementById("<%=txtOldPassword.ClientID %>").value == "") {
                        document.getElementById("<%=Alert.ClientID%>").innerHTML = "Enter Old Password !";
                        document.getElementById("<%=txtOldPassword.ClientID %>").focus();
                        return false;
                    }
                    if (document.getElementById("<%=txtpassword.ClientID %>").value == "") {
                        document.getElementById("<%=Alert.ClientID%>").innerHTML = "Enter New Password !";
                        document.getElementById("<%=txtpassword.ClientID %>").focus();
                        return false;
                    }
                    if (document.getElementById("<%=txtpassword1.ClientID %>").value == "") {
                        document.getElementById("<%=Alert.ClientID%>").innerHTML = "Enter Confirm Password !";
                        document.getElementById("<%=txtpassword1.ClientID %>").focus();
                        return false;
                    }
                    if (document.getElementById("<%=txtpassword1.ClientID %>").value != document.getElementById("<%=txtpassword.ClientID %>").value) {
                        document.getElementById("<%=Alert.ClientID%>").innerHTML = "Password not match !";
                         document.getElementById("<%=txtpassword1.ClientID %>").focus();
                        return false;
                     }
                    return true;
                }
            </script>

            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title"><%--Heading--%>  Change Password</h4>
                    </div>
                </div>
            </div>
            <br />
            <div class="container-fluid">
                <asp:Label ID="Label2" Visible="false" runat="server"></asp:Label>
                <div class="row">
                    <div class="col-12">
                        <div id="Alert" class="alert alert-warning" role="alert"  runat="server">
                        </div>
                        <div class="card">
                            <div class="card-body">

                                <div class="form-group">
                                    <label for="hue-demo">Old Password</label>
                                    <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtOldPassword" placeholder="Old Password" TextMode="Password" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="position-bottom-left">New Password</label>
                                    <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtpassword" ToolTip="For Example : pass@123" placeholder="eg. pass@123" TextMode="Password" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="Regex2" runat="server" ControlToValidate="txtpassword"
                                        ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
                                        ErrorMessage="Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character"
                                        ForeColor="Red" />
                                </div>
                                <div class="form-group">
                                    <label for="position-top-right">Confirm Password</label>
                                    <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtpassword1" placeholder="Confirm Password" TextMode="Password" runat="server"></asp:TextBox>
                                </div>

                            </div>
                            <div class="border-top">
                                <div class="card-body">

                                    <asp:Button ID="btnsearch" OnClientClick=" return  checkvalid()" CssClass="btn btn-success" runat="server" Text="Save"
                                        OnClick="btnsearch_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="modal-backdrop">
                <div class="center">
                    <img alt="" src="images/ajax_loader_gray_49.gif" />
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

