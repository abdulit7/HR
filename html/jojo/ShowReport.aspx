<%@ page language="C#" autoeventwireup="true" inherits="html_ltr_ShowReport, App_Web_5k25ydlk" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src='<%=ResolveUrl("~/crystalreportviewers13/js/crviewer/crv.js")%>' type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
        <div>
            <%--<CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />--%>
            <%--<CR:CrystalReportViewer ID="CrystalReportViewer2" runat="server" AutoDataBind="true" />--%>
            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" 
                EnableDatabaseLogonPrompt="true" HasToggleGroupTreeButton="false" EnableParameterPrompt="true" Style="position: absolute;"
                DisplayToolbar="True"  HasExportButton="True" HasPrintButton="True" PrintMode="ActiveX"
                HasCrystalLogo="False"  OnInit="CrystalReportViewer1_Init"  ToolPanelView="None" />
        </div>
    </div>
    </form>
</body>
</html>
