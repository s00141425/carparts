using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net.Mime;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(HttpContext.Current.User.Identity.Name))
            {
                HtmlAnchor anchorLogin = new HtmlAnchor() { HRef = "Login.aspx", InnerText = "LogIn" };
                anchorLogin.Attributes.Add("class", "navbar-brand");

                HtmlAnchor anchorRegister = new HtmlAnchor { HRef = "Register.aspx", InnerText = "Register" };
                anchorRegister.Attributes.Add("class", "navbar-brand");

                divUserInfo.Controls.Add(anchorLogin);
                divUserInfo.Controls.Add(anchorRegister);
            }
            else
            {
                HtmlAnchor anchorUser = new HtmlAnchor
                {
                    InnerText = "Welcome " +
                                CultureInfo.InvariantCulture.TextInfo.ToTitleCase(
                                    HttpContext.Current.User.Identity.Name + " !")
                };
                anchorUser.Attributes.Add("class", "navbar-brand");

                HtmlAnchor anchorLogOut = new HtmlAnchor()
                {
                    InnerText = "LogOut",
                };
                anchorLogOut.Attributes.Add("class", "navbar-brand");
                anchorLogOut.ServerClick += LnkLogout_Click;

                divUserInfo.Controls.Add(anchorUser);
                divUserInfo.Controls.Add(anchorLogOut);
            }
        }

        private void LnkLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Abandon();

            var cookie = Response.Cookies[FormsAuthentication.FormsCookieName];
            if (cookie != null)
                cookie.Expires = DateTime.Now.AddYears(-1);

            var httpCookie = Response.Cookies["ASP.NET_SessionId"];
            if (httpCookie != null)
                httpCookie.Expires = DateTime.Now.AddYears(-1);

            Response.Redirect("~/Index.aspx");
        }
    }
}