<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Appointment Scheduler Project.aspx.cs" Inherits="ConnectSQL.Appointment_Scheduler_Project" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cap" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Appointment Scheduler Form</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        .container {
            max-width: 500px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .form-control {
            border-radius: 20px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .error-message {
            color: red;
        }

        .auto-style1 {
            width: 162px;
        }

        .text-blue {
            color: blue;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="mb-4 text-blue"><b>Appointment Scheduler Form</b></h2>
            <div class="form-group">
                <label for="lblName">Username:</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Your Name"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="lblMobile">Mobile No:</label>
                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter Your Mobile No" TextMode="Number"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="lblEmail">Email ID:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Example1234@gmail.com" TextMode="Email"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="lblPassword">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Your Password" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="lblAddress">Address:</label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Your Address" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="lblGender">Select Your Gender:</label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Male">Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                    <asp:ListItem Value="TransGender">TransGender</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="lblTime">Timing:</label>
                <asp:TextBox ID="txtTime" runat="server" CssClass="form-control" type="datetime-local"></asp:TextBox>
            </div>
            <div class="form-group">
                <table class="w-100">
                    <tr>
                        <td>
                            <cap:CaptchaControl ID="captcha1" runat="server" CaptchaLength="5" CaptchaHeight="50" CaptchaWidth="200" CaptchaLineNoise="None" CaptchaMinTimeout="3" CaptchaMaxTimeout="240" CaptchaChars="abcdefghijklmnopqrstuvwxyz123456789" ForeColor="Blue" BackColor="Yellow" Height="46px" Width="200px" />
                            <asp:TextBox ID="txtCaptcha" runat="server" placeholder="Enter Captcha" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnRefresh" runat="server" Text="Refresh" CssClass="btn btn-primary mb-3" />
                        </td>
                    </tr>
                </table>
            </div>
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary mb-3" OnClick="btnSave_Click" />
            <br />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
