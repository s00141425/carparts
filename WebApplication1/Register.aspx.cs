using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevOne.Security.Cryptography.BCrypt;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class Register1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MightyCarPartsDBContext db = new MightyCarPartsDBContext();
            ddlCounty.DataSource = db.Counties.ToList();
            ddlCounty.DataValueField = "CountyName";
            ddlCounty.DataBind();
            ddlCounty.Items.Insert(0, "--Select County--");
        }

        protected void btnRegister_OnClick(object sender, EventArgs e)
        {
            if (!IsValid) return;

            string encriptPassword = BCryptHelper.HashPassword(tbxPassword.Text, BCryptHelper.GenerateSalt(6));

            Customer registerCustomer = new Customer()
            {
                CustomerName = tbxUserName.Text,
                Mobile = tbxPhone.Text,
                Address = tbxAddress.Text,
                CountyID = ddlCounty.SelectedIndex + 1,
                Email = tbxEmail.Text,
                PasswordEncripted = encriptPassword,
            };

            bool result = MightyCarParts.AddUser(registerCustomer);
            if (result)
            {
                lblMsg.Text = "it has inserted successfully";
                Response.Redirect("/Login");
            }
            else
            {
                lblMsg.Text = "it fail, it has duplicated name";
            }
        }
    }
}