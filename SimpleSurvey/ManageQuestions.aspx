<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageQuestions.aspx.cs" Inherits="SimpleSurvey.ManageQuestions" %>

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
                    Question Type</td>
                <td>
                    <asp:DropDownList ID="ddlTypes" runat="server" Width="41%">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 25%; text-align: left;">
                    Title</td>
                <td>
                    <asp:TextBox ID="txtTitle" runat="server" Width="40%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 25%; text-align: left;">
                    Description</td>
                <td>
                    <asp:TextBox ID="txtDesc" runat="server" Rows="3" TextMode="MultiLine" 
                        Width="40%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 25%; text-align: left;">
                    Values</td>
                <td>
                    <asp:TextBox ID="txtValues" runat="server" Rows="3" TextMode="MultiLine" 
                        Width="40%"></asp:TextBox>
                    (Enter values as comma seperated)</td>
            </tr>
            <tr>
                <td style="width: 25%; text-align: left;">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                        onclick="btnSubmit_Click" />
                    <asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                        Text="Cancel" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
