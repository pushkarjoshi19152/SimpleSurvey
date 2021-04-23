<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageSurveys.aspx.cs" Inherits="SimpleSurvey.ManageSurveys" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 40%;
            height: 76px;
        }
        .style3
        {
            width: 20%;
            height: 76px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table cellpadding="2" class="style1">
        <tr>
            <td style="width: 25%; text-align: left;">
                &nbsp;</td>
            <td>
                &nbsp;</td>
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
                <asp:TextBox ID="txtDesc" runat="server" Width="40%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 25%; text-align: left;">
                Expires On</td>
            <td>
                <asp:TextBox ID="txtDate" runat="server" Width="40%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 25%; text-align: left;">
                Select Questions</td>
            <td>
                <table cellpadding="2" class="style1">
                    <tr>
                        <td style="width: 40%;">
                            Source</td>
                        <td style="width: 20%;">
                            &nbsp;</td>
                        <td style="width: 40%;">
                            Target</td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:ListBox ID="lbSource" runat="server" Rows="6" Width="100%"></asp:ListBox>
                        </td>
                        <td class="style3" style="text-align: center;">
                            <asp:Button ID="btnAddAll" runat="server" CausesValidation="False" 
                                onclick="btnAddAll_Click" Text="&gt;&gt;" />
                            <br />
                            <asp:Button ID="btnAddOne" runat="server" CausesValidation="False" 
                                onclick="btnAddOne_Click" Text=" &gt; " />
                            <br />
                            <asp:Button ID="btnRemoveOne" runat="server" CausesValidation="False" 
                                onclick="btnRemoveOne_Click" Text=" &lt; " />
                            <br />
                            <asp:Button ID="btnRemoveAll" runat="server" CausesValidation="False" 
                                onclick="btnRemoveAll_Click" Text="&lt;&lt;" />
                        </td>
                        <td class="style2">
                            <asp:ListBox ID="lbTarget" runat="server" Rows="6" Width="100%"></asp:ListBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 25%; text-align: left;">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                    Text="Submit" />
                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                    Text="Cancel" />
            </td>
        </tr>
        <tr>
            <td style="width: 25%; text-align: left;">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <div>
    
    </div>
    </form>
</body>
</html>
