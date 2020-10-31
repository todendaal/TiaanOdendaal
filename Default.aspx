<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TiaanOdendaal._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>TIAAN ODENDAAL</h1>
        <p class="lead">
            RTT Assesment including multitier development and the use of WCF<br /><br />
            I have developed two pages with the same functionality, the first one was done using standard 3 tier dev using Data access layer and Models<br />
            The second page makes use of the same front end but use the WCF services rather than the DAL.<br /><br />
            Please remember to start the WCF service by opening <a href="http://localhost:60000/Service1.svc">http://localhost:60000/Service1.svc</a>
        </p>
        <p style="width:100%;"><a style="width:400px;" href="/Client"" class="btn btn-primary btn-lg">Clients (DAL)&raquo;</a></p>
        <p style="width:100%;"><a style="width:400px;" href="/ClientService"" class="btn btn-primary btn-lg">Clients (WCF)&raquo;</a></p>        
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Time Used</h2>
            <p>
                I knew this was a 4 our assesment.
                I did as much as I could on the assesment but initally started using a Data access layer until that worked fine.
                I then wanted to copy over the Business layers to my WCF project but ran out of time on implementing all.
                So I have to admit I did finish off the WCF addition and copied my front end to a new page to represent the app working via WCF
                So you will see Client pages, one with a business layer and other one with WCF
            </p>            
        </div>
        <div class="col-md-4">
            <h2>Thoughts</h2>
            <p>
                This was an interresting experience cause we got so used to MVC and everything included with entity framework that it has been a while since I worked with postbacks.
                If I could make my change it would be to implement a WebAPI project rather.
            </p>
        </div>
        <div class="col-md-4">
            <h2>More Dynamic</h2>
            <p>
                With lost more time It would be much better making use of jquery to map the data from front to back rather than postbacks.
                Plan was to do that but I rather let it be as per my limited time. So lots of postbacks now.
            </p>
        </div>
    </div>

</asp:Content>
