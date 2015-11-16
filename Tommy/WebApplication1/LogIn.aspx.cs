using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevOne.Security.Cryptography.BCrypt;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string encriptPassword;
            var singleOrDefault = MightyCarParts.FindTheUser(txtUserName.Text);

            if (singleOrDefault != null)
                encriptPassword = singleOrDefault.PasswordEncripted;
            else
            {
                lblError.Text = "Invalid UserName and/or password";
                return;
            }

            if (BCryptHelper.CheckPassword(txtPassword.Text, encriptPassword))
            {
                FormsAuthentication.RedirectFromLoginPage(txtUserName.Text, chkBoxRememberMe.Checked);
            }
            else
            {
                lblError.Text = "Invalid UserName and/or password";
            }
        }
    }
}