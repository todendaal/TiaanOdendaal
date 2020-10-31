using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Configuration;
using System.IO;

namespace TiaanOdendaal
{
    public partial class Client : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (hdnLoaded.Value=="0") 
            { 
                getClients();
                hdnLoaded.Value = "1";
            }
        }

        protected void getClients()
        {
            ClientData db = new ClientData();
            List<BL.Client> ClientList = db.GetClient(0);
            lstClients.DataTextField = "FullName";
            lstClients.DataValueField = "ID";
            lstClients.DataTextField = "FullName";
            lstClients.DataSource = ClientList;
            lstClients.DataBind();
        }

        protected void getClientData(int clientID)
        {
            ClientData db = new ClientData();
            List<BL.Client> ClientList = db.GetClient(clientID);
            txtFirstName.Text = ClientList[0].ClientName;lblFirstName.Text = ClientList[0].ClientName;
            txtLastName.Text = ClientList[0].ClientSurname; lblLastName.Text = ClientList[0].ClientSurname;
            txtEmail.Text = ClientList[0].ClientEmail; lblEmail.Text = ClientList[0].ClientEmail;
            lblGender.Text = ClientList[0].FullGender;
            hdnClientID.Value = clientID.ToString();
            lblBirtdate.Text = ClientList[0].DateOfBirth.ToShortDateString();
            radMale.Checked = true; radFemale.Checked = false;
            ClientBirthCalendar1.Text = ClientList[0].DateOfBirth.ToString("yyyy-MM-dd");
            btnAddClient.Text = "Update Client";
            if (ClientList[0].Gender == 1) { radMale.Checked = false; ; radFemale.Checked = true; }
            divClientDetails.Visible = true;divClientEdit.Visible = false;

            ListAddresses(clientID);
        }

        protected void ListAddresses(int ClientID)
        {
            AddressData dbA = new AddressData();
            List<BL.Address> AddressList = dbA.GetAddresses(ClientID, 0);
            radAddressList.DataSource = AddressList;
            radAddressList.DataTextField = "FullAddress";
            radAddressList.DataValueField = "ID";
            radAddressList.DataBind();
            divAddressDetails.Visible = false;
            divAddressList.Visible = true;

        }

        protected void lstClients_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (lstClients.SelectedItem != null)
            {
                int selectedVal = Convert.ToInt32(lstClients.SelectedItem.Value);
                getClientData(selectedVal);
            }
        }

        protected void btnSearchClients_Click(object sender, EventArgs e)
        {
            getClients();
        }

        protected void btnAddNewClient_Click(object sender, EventArgs e)
        {
            lstClients.ClearSelection();
            hdnClientID.Value = "0";
            clearClient();
            ClientBirthCalendar1.Text = DateTime.Today.ToString("yyyy-MM-dd");
            btnAddClient.Text = "Save new Client";
            divClientDetails.Visible = false; divClientEdit.Visible = true;
            divAddressDetails.Visible = false;
            divAddressList.Visible = false;
        }

        protected void clearClient()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            radMale.Checked = false; radFemale.Checked = false;
        }

        protected void btnAddClient_Click(object sender, EventArgs e)
        {
            int clientID = Convert.ToInt32(hdnClientID.Value);
            ClientData db = new ClientData();
            System.Globalization.CultureInfo culture = new System.Globalization.CultureInfo("en-US");
            int SelectedGender = 0;
            if (radFemale.Checked) { SelectedGender = 1; };
            int userin = db.SaveClient(clientID,txtFirstName.Text, txtLastName.Text, SelectedGender,txtEmail.Text, ClientBirthCalendar1.Text);
            if (userin>0)
            {
                
                clearClient();
                ClientBirthCalendar1.Text = DateTime.Today.ToString("yyyy-MM-dd");
                divClientDetails.Visible = false; divClientEdit.Visible = false;
                divAddressDetails.Visible = false; divAddressList.Visible = false;
                getClientData(userin);
                getClients();
                ListAddresses(userin);
                hdnClientID.Value = userin.ToString();
                lstClients.SelectedValue = userin.ToString();
                btnAddClient.Text = "Save new Client";
            }
        }

        protected void btnEditClient_Click(object sender, EventArgs e)
        {
            divClientDetails.Visible = false; divClientEdit.Visible = true;
        }

        protected void RradAddressList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int AddressID = Convert.ToInt32(radAddressList.SelectedValue);
            AddressData dbA = new AddressData();
            hdnAddres.Value = AddressID.ToString();
            List<BL.Address> AddressList = dbA.GetAddresses(Convert.ToInt32(hdnClientID.Value), AddressID);
            if (AddressList.Count != 0)
            {
                txtAddress1.Text = AddressList[0].AddressLine1;
                txtAddress2.Text = AddressList[0].AddressLine2;
                txtSuburb.Text = AddressList[0].Suburb;
                txtCity.Text = AddressList[0].City;
                radAddressType.SelectedValue = AddressList[0].AddressTypeID.ToString();
            }
            divAddressDetails.Visible = true;
            divAddressList.Visible = false;
        }

        protected void btnAddressBack_Click(object sender, EventArgs e)
        {
            ListAddresses(Convert.ToInt32(hdnClientID.Value));
            divAddressDetails.Visible = false;
            divAddressList.Visible = true;
        }

        protected void btnAddAddress_Click(object sender, EventArgs e)
        {
            hdnAddres.Value = "0";
            clearAddress();
            radAddressType.SelectedValue ="0";
            divAddressList.Visible = false;
            divAddressDetails.Visible = true;
        }

        protected void btnSaveAddress_Click(object sender, EventArgs e)
        {
            int clientid = Convert.ToInt32(hdnClientID.Value);
            int addressid = Convert.ToInt32(hdnAddres.Value);
            AddressData dba = new AddressData();
            bool addrin = dba.AddAddress(addressid,txtAddress1.Text,txtAddress2.Text,txtSuburb.Text,txtCity.Text, Convert.ToInt32(radAddressType.SelectedValue), clientid);
            if (addrin)
            {
                hdnAddres.Value = "0";
                clearAddress();
                radAddressType.SelectedValue = "0";
                divAddressList.Visible = false;
                divAddressDetails.Visible = true;
                ListAddresses(clientid);
            }
        }

        protected void clearAddress()
        {
            txtAddress1.Text = "";
            txtAddress2.Text = "";
            txtSuburb.Text = "";
            txtCity.Text = "";
            radAddressType.SelectedValue = "0";
        }

        protected void btnExportAll_Click(object sender, EventArgs e)
        {
            string directory = Server.MapPath("/txtFiles");
            string filename = String.Format("{0:yyyy-MM-dd---HH-mm}__{1}", DateTime.Now, ".txt");
            string path = Path.Combine(directory, filename);

            StreamWriter xwritr = new StreamWriter(path, false);
            ClientData db = new ClientData();
            List<BL.Client> ClientList = db.GetClient(0);
            foreach (BL.Client WriteClient in ClientList)
            {
                xwritr.Write(WriteClient.ClientName + ",");
                xwritr.Write(WriteClient.ClientSurname + ",");
                xwritr.Write(WriteClient.DateOfBirth + ",");
                xwritr.Write(WriteClient.FullGender + ",");
                xwritr.Write(WriteClient.ClientEmail + ",");

                AddressData dbA = new AddressData();
                List<BL.Address> AddresList = dbA.GetAddresses(WriteClient.ID, 0);
                int AddressCount = 0;
                if (AddresList.Count() != 0)
                {
                    foreach (BL.Address WriteClient2 in AddresList)
                    {
                        if (AddressCount != 0) { xwritr.Write(Environment.NewLine); xwritr.Write(",,,,"); }
                        xwritr.Write(WriteClient2.AddressType + ",");
                        xwritr.Write(WriteClient2.AddressLine1 + ",");
                        xwritr.Write(WriteClient2.AddressLine2 + ",");
                        xwritr.Write(WriteClient2.Suburb + ",");
                        xwritr.Write(WriteClient2.City);
                        AddressCount++;
                    }
                    xwritr.Write(Environment.NewLine);
                }
                else
                {
                    xwritr.Write(",,,,");
                    xwritr.Write(Environment.NewLine);
                }


            }
            xwritr.Flush();
            xwritr.Close();
            System.Diagnostics.Process.Start(path);
        }
    }
}