<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="TiaanOdendaal.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your contact page.</h3>
    <address>
        Tiaan Odendaal<br />
        Bedford Gardens<br />
        <abbr title="Phone">Cell: </abbr>
        060 880 6316
    </address>

    <address>
        <strong>Contact me:</strong>   <a href="mailto:Support@example.com">tiaanodendaal@gmail.com</a>
    </address>
</asp:Content>
