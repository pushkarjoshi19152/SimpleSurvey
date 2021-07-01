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
        .auto-style1 {
            width: 311px;
        }
        .auto-style2 {
            height: 31px;
        }
        .auto-style3 {
            width: 311px;
            height: 31px;
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
                        <br />
                        <table style="width:100%;">
                             <tr id="tb1">
                                <td>&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr id="tb2">
                                <td class="auto-style2">
                                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td class="auto-style3">
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </td>
                                <td class="auto-style2"></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                            </tr><tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                                 </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                 </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                            </tr><tr>
                                <td class="auto-style2">
                                    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                                 </td>
                                <td class="auto-style3">
                                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                                 </td>
                                <td class="auto-style2"></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td style="width: 25%; text-align: left;">
                    <br />
                    <br />
                    <br />
                </td>
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
