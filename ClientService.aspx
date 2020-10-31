<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ClientService.aspx.cs" Inherits="TiaanOdendaal.ClientService" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   
    <div class="jumbotron">
        <h1>CLIENTS (Using WCF)</h1>
        <p class="lead">Find all clients below and select for details</p>
        <asp:HiddenField EnableViewState="true" ID="hdnLoaded" runat="server" Value="0" />
    </div>

    <div class="row">
        <div class="col-md-3">
            <p style="display:none;"><asp:Button ID="btnSearchClients" runat="server" Text="Get Clients" OnClick="btnSearchClients_Click" /></p>
            <p><b>Select Client..</b></p>
            <p style="width:100%">
                <asp:ListBox Width="100%" EnableViewState="true" AutoPostBack="true" ID="lstClients" runat="server" Height="250" OnSelectedIndexChanged="lstClients_SelectedIndexChanged" ></asp:ListBox>
            </p>
            <p style="width:100%">
                <asp:Button Width="100%" ID="btnAddNewClient" runat="server" Text="Add new client" OnClick="btnAddNewClient_Click" />
            </p>
            <p style="width:100%">
                <asp:Button Width="100%" ID="btnExportAll" runat="server" Text="Export" OnClick="btnExportAll_Click" />
            </p>
        </div>        
        <div runat="server" id="divClientDetails" class="col-md-5" visible="false">
            <h2>Client Details</h2>
            <table class="table">
                <tr>
                    <td>First Name</td>
                    <td><asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td><asp:Label ID="lblLastName" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><asp:Label ID="lblGender" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Client Email</td>
                    <td><asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Birth Date</td>
                    <td><asp:Label ID="lblBirtdate" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center">
                        <asp:Button ID="btnEditClient" runat="server" Text="Edit Client" OnClick="btnEditClient_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div  runat="server" id="divClientEdit" class="col-md-5" visible="false">
            <h2>Client Details</h2>
            <asp:HiddenField ID="hdnClientID" Value="0" runat="server" />
            <table class="table">
                <tr>
                    <td>First Name</td>
                    <td><asp:TextBox ID="txtFirstName" runat="server" required="true"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td><asp:TextBox ID="txtLastName" runat="server" required="true"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>
                        Male<asp:RadioButton ID="radMale" runat="server" GroupName="groupGender" />
                        Female<asp:RadioButton ID="radFemale" runat="server" GroupName="groupGender" />
                    </td>
                </tr>
                <tr>
                    <td>Client Email</td>
                    <td><asp:TextBox ID="txtEmail" runat="server" TextMode="Email" required="true"  ></asp:TextBox></td>
                </tr>                
                <tr>
                    <td style="vertical-align:top">Birth Date</td>
                    <td>
                        <asp:TextBox ID="ClientBirthCalendar1" runat="server" TextMode="Date" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:right;">
                        <asp:Button  ID="btnAddClient" runat="server" Text="Add/Edit Client" OnClick="btnAddClient_Click"    />
                    </td>
                </tr>
            </table>
        </div>
        <div  runat="server" id="divAddressList" class="col-md-4" visible="false">
            <h2>Address Details</h2>
            <asp:RadioButtonList OnSelectedIndexChanged="RradAddressList_SelectedIndexChanged" AutoPostBack="true" ID="radAddressList" runat="server"></asp:RadioButtonList>
            <p>
                <asp:Button ID="btnAddAddress" runat="server" Text="Add new Address" OnClick="btnAddAddress_Click" />
            </p>
        </div>
        <div  runat="server" id="divAddressDetails" class="col-md-4" visible="false">
            <asp:HiddenField ID="hdnAddres" runat="server" Value="0" />
            <h2>Address Details</h2>
            <table class="table">
                <tr>
                    <td>Address Line 1</td>
                    <td><asp:TextBox ID="txtAddress1" runat="server" Text="" required="true"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Address Line 2</td>
                    <td><asp:TextBox ID="txtAddress2" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Suburb</td>
                    <td><asp:TextBox ID="txtSuburb" runat="server" required="true"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td><asp:TextBox ID="txtCity" runat="server" required="true"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Address Type</td>
                    <td>
                        <asp:RadioButtonList ID="radAddressType" runat="server">
                            <asp:ListItem Text="Home" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Work" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="2"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td><asp:Button ID="btnAddressBack" runat="server" Text="<< Cancel" OnClick="btnAddressBack_Click" /></td>
                    <td><asp:Button ID="btnSaveAddress" runat="server" Text="Save Address" OnClick="btnSaveAddress_Click" /></td>
                </tr>
            </table>
        </div>
    </div>

</asp:Content>
