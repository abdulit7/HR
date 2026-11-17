<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="html_ltr_PunchTimeManualTime, App_Web_5bk21qbu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        var x = document.getElementById("demo")
        document.body.onload = function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition, showError);
            }
            else { x.innerHTML = "Geolocation is not supported by this browser."; }
        }
        function showPosition(position) {

            var Lat = position.coords.latitude;
            var Lon = position.coords.longitude;
            var latlondata = Lat + "," + Lon;
            document.getElementById("<%=txtLatLon.ClientID %>").value = latlondata;

            var latlon = "Your Latitude Position is:=" + position.coords.latitude + "," + "Your Longitude Position is:=" + position.coords.longitude;


            var img_url = "http://maps.googleapis.com/maps/api/staticmap?center="
                + latlondata + "&zoom=14&size=400x300&sensor=false";
            document.getElementById("mapholder").innerHTML = "<img src='" + img_url + "' />";
        }

        function showError(error) {
            if (error.code == 1) {
                x.innerHTML = "User denied the request for Geolocation."
            }
            else if (err.code == 2) {
                x.innerHTML = "Location information is unavailable."
            }
            else if (err.code == 3) {
                x.innerHTML = "The request to get user location timed out."
            }
            else {
                x.innerHTML = "An unknown error occurred."
            }
        }


    </script>
    <script language="javascript" type="text/javascript">
        function OpenPopupCenter(pageURL, title, w, h) {
            var left = (screen.width - w) / 2;
            var top = (screen.height - h) / 4;  // for 25% - devide by 4  |  for 33% - devide by 3
            var targetWin = window.open(pageURL, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
        }
    </script>
    <script type="text/javascript">
        function openWindow() {
            var code = document.getElementById("<%=txtLatLon.ClientID %>").value;
            window.open('https://www.google.com/maps/@' + code + ',19z?hl=en-US', 'open_window', ' width=640, height=480, left=0, top=0');
        }
    </script>

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
            <%--<script type="text/javascript">
    var x = document.getElementById("demo");
    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition, showError);
        }
        else { x.innerHTML = "Geolocation is not supported by this browser."; }
    }

    function showPosition(position) {
        var latlondata = position.coords.latitude + "," + position.coords.longitude;
        document.getElementById("<%=txtLatLon.ClientID %>").value = latlondata;
        var latlon = "Your Latitude Position is:=" + position.coords.latitude + "," + "Your Longitude Position is:="  +position.coords.longitude;
        alert(latlon)

        var img_url = "http://maps.googleapis.com/maps/api/staticmap?center="
  + latlondata + "&zoom=14&size=400x300&sensor=false";
        document.getElementById("mapholder").innerHTML = "<img src='" + img_url + "' />";
    }

    function showError(error) {
        if (error.code == 1) {
            x.innerHTML = "User denied the request for Geolocation."
        }
        else if (err.code == 2) {
            x.innerHTML = "Location information is unavailable."
        }
        else if (err.code == 3) {
            x.innerHTML = "The request to get user location timed out."
        }
        else {
            x.innerHTML = "An unknown error occurred."
        }
    }
</script>--%>
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title"><%--Heading--%>Punch IN Time , OUT Time Manualy</h4>
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
                                <div class="input-group" style="float: left; width: 100%">
                                    <%--Search--%>
                                    <asp:Button ID="btnLocation" Visible="false" OnClientClick="openWindow();" CssClass="btn btn-primary pull-left" runat="server" Text="Location" />

                                    &nbsp;    
                                    <asp:TextBox CssClass="form-control" Visible="false" autocomplete="off" Enabled="false" ID="txtLatLon" runat="server"></asp:TextBox>
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
                                <div class="input-group" style="float: left; width: 100%">
                                    <asp:DropDownList CssClass="form-control custom-select" Height="36px" ID="ddluser" runat="server">
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
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <asp:Panel ID="Panel2" runat="server" Width="100%" ScrollBars="Horizontal">
                                        <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false"
                                            GridLines="None">
                                            <Columns>
                                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                                <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" />
                                                <asp:TemplateField HeaderText="Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFromdate" runat="server" Text='<%#Eval("Date", "{0:dd-MM-yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Day" HeaderText="Day" SortExpression="Day" />
                                                <asp:BoundField DataField="IN" HeaderText="IN" SortExpression="IN" />
                                                <asp:BoundField DataField="OUT" HeaderText="OUT" SortExpression="OUT" />
                                                <asp:BoundField DataField="Diff Time" HeaderText="Diff Time" SortExpression="Diff Time" />

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
            <%-- <asp:PostBackTrigger ControlID="btnInsert" />--%>
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

