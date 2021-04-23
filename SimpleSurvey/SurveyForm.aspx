<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyForm.aspx.cs" Inherits="SimpleSurvey.SurveyForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table cellpadding="2" class="style1">
            <tr>
                <td style="width: 25%; text-align: left;">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 25%; text-align: left;">
                    Select Survey</td>
                <td>
                    <asp:DropDownList ID="ddlSurveys" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddlSurveys_SelectedIndexChanged" Width="41%">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left;">
                    <asp:Panel ID="pnlSurvey" runat="server">
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td style="width: 25%; text-align: left;">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Enabled="False" 
                        onclick="btnSubmit_Click" Text="Submit" />
                    <asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                        Text="Cancel" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
