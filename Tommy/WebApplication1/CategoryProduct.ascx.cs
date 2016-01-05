using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class CategoryProduct : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            imgProduct.ImageUrl = "~/Images/Products/" + SelectedProduct.ImageFile;
            lblDesc.Text = SelectedProduct.ProductDescription;
        }

        protected void lbnView_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("/Details");
            //needs to pass the selected product with the Session
        }

        protected void lblAdd_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("/Basket");
            //need to added the selected product in basket
        }

        public Product SelectedProduct { get; set; }
    }
}