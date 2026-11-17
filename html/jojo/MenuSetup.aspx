<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="Attendance_MenuSetup, App_Web_5bk21qbu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function checkvalid() {
            if (document.getElementById("<%=txtMenuName.ClientID %>").value == "") {
                
                document.getElementById("<%=txtMenuName.ClientID %>").focus();
                return false;
            }
            if (document.getElementById("<%=txtFileName.ClientID %>").value == "") {
                
                 document.getElementById("<%=txtFileName.ClientID %>").focus();
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
                        <h4 class="page-title">Menu Setup</h4>
                    </div>
                </div>
            </div>
            <br />
            <div class="container-fluid">
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <div class="row">
                    <div class="col-12">
                        <div id="Alert" class="alert alert-warning" role="alert" visible="false" runat="server">
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <div class="input-group" style="float: left; width: 100%">
                                    <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtMenuName" placeholder="Menu Name" runat="server"></asp:TextBox>
                                    &nbsp;
                                    <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtFileName" placeholder="File Name" runat="server"></asp:TextBox>
                                    &nbsp;
                                   <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddlParentMenu" runat="server" OnSelectedIndexChanged="ddlParentMenu_SelectedIndexChanged">
                                   </asp:DropDownList>
                                    &nbsp;
                                    <asp:TextBox CssClass="form-control small" Visible="false" Text="0" autocomplete="off" ID="txtMenuOrder" placeholder="Order" runat="server"></asp:TextBox>
                                    <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddlChildMenu" runat="server">
                                    </asp:DropDownList>
                                    &nbsp;
                                     <asp:DropDownList CssClass="select2 form-control custom-select" Height="36px" ID="ddlIcon" runat="server">
                                     </asp:DropDownList>
                                     &nbsp;
                                        <asp:Button ID="btnShow" CssClass="btn btn-success" runat="server" Text="Show" OnClick="btnShow_Click" />

                                    &nbsp;
                                        <asp:Button ID="btnSave" CssClass="btn btn-primary" OnClientClick=" return  checkvalid()" runat="server" Text="Save" OnClick="btnSave_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Basic Datatable</h5>
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" GridLines="None" runat="server" OnRowCommand="GridView1_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Delete">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton2sdfsdfsd" runat="server" CommandName="Deletes" ToolTip="Delete Record" ImageUrl="../../Image/Delete.png"
                                                        OnClientClick="if (!confirm('Are you sure you want to delete?')) return false;"
                                                        Width="25px" CommandArgument='<%#Eval("ID")%>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Edit">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandName="DataCommand" ToolTip="Edit Record" ImageUrl="../../Image/Edit.png"
                                                        Width="25px" CommandArgument='<%#Eval("ID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
    <%--<div class="modal fade" id="Modal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true ">
                <div class="modal-dialog modal-xl" role="document ">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Edit Menu</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true ">&times;</span>
                            </button>
                        </div>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-sm-12 col-md-6">
                                    <div class="form-group">
                                        <label for="inputname" class="control-label col-form-label">Menu Name</label>
                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtMenuNameEdit" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-6">
                                    <div class="form-group">
                                        <label for="inputname" class="control-label col-form-label">Flie Name</label>
                                        <asp:TextBox CssClass="form-control" autocomplete="off" ID="txtFlieNameEdit" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 col-md-6">
                                    <div class="form-group">
                                        <label for="inputname" class="control-label col-form-label">Perant Menu</label>
                                        <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddlPerantIDEdit" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <asp:DropDownList CssClass="select2 form-control" Width="100%" Height="36px" ID="ddlIconEdit" runat="server">
                                </asp:DropDownList>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnInsert" OnClientClick="return  checkvalidEdit()" CssClass="btn btn-primary pull-left" runat="server" Text="Save" OnClick="btnInsert_Click" />
                            <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>--%>
        </ContentTemplate>
    </asp:UpdatePanel>

   

    <!-- this page js -->
    <script src="../../assets/extra-libs/multicheck/datatable-checkbox-init.js"></script>
    <script src="../../assets/extra-libs/multicheck/jquery.multicheck.js"></script>
    <script src="../../assets/extra-libs/DataTables/datatables.min.js"></script>
    <script>
        /****************************************
         *       Basic Table                   *
         ****************************************/
        $('#GridView1').DataTable();
    </script>
</asp:Content>

