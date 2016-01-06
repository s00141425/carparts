using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class CategoryProduct : System.Web.UI.UserControl
    {
        private const string APP_KEY = "MosfOfViews";
          
        protected void Page_Load(object sender, EventArgs e)
        {
            imgProduct.ImageUrl = "~/Images/Products/" + SelectedProduct.ImageFile;
            lblDesc.Text = SelectedProduct.ProductDescription;

            ProductViewList viewList;
            if (Application[APP_KEY] == null)
            {
                viewList = new ProductViewList();
                Application.Add(APP_KEY, viewList);
            }
            else
            {
                viewList = (ProductViewList) Application[APP_KEY];

                ((GridView) this.Parent.FindControl("grdMostView")).DataSource = viewList.Display();
                ((GridView)this.Parent.FindControl("grdMostView")).DataBind();
            }
        }

        protected void lbnView_OnClick(object sender, EventArgs e)
        {
            ProductView view = new ProductView()
            {
                ProductId = SelectedProduct.ProductID.ToString(),
                CategoryId = SelectedProduct.CategoryID.ToString(),
                ProductName = SelectedProduct.ProductName,
                ViewCounts = 1
            };
            
            Application.Lock();
            ProductViewList viewList = (ProductViewList) Application[APP_KEY];
            viewList.Add(view);
            Application.UnLock();

            ((GridView)this.Parent.FindControl("grdMostView")).DataSource = viewList.Display();
            ((GridView)this.Parent.FindControl("grdMostView")).DataBind();

            //needs to pass the selected product with the Session
            //Debug.WriteLine(SelectedProduct.ImageFile + " !!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

            //Response.Redirect("/Details");
        }

        protected void lblAdd_OnClick(object sender, EventArgs e)
        {
            //need to added the selected product in basket

            //Response.Redirect("/Basket");
        }

        public Product SelectedProduct { get; set; }
    }
}