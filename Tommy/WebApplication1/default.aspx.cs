using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class Index : System.Web.UI.Page
    {
        MightyCarPartsDBContext db = new MightyCarPartsDBContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlMaker.DataSource = db.VehicleMakes.ToList();
                ddlMaker.DataTextField = "MakerName";
                ddlMaker.DataValueField = "VehicleMakerID";
                ddlMaker.DataBind();
                ddlMaker.Items.Insert(0, "--Select Maker--");

                Session.Clear();
            }
            imgComment.ImageUrl = "~/Images/Products/p" + new Random().Next(1, 19) + ".png";
        }

        protected void ddlMaker_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            //var makerId = int.Parse(ddlMaker.SelectedValue);

            int makerId;
            if (!int.TryParse(ddlMaker.SelectedValue, out makerId))
                return;

            var models = db.Models.Where(m => m.VehicleMake.VehicleMakerID == makerId)
                .OrderBy(m => m.VehicleMakerID)
                .Select(m =>
                new
                {
                    ModelID = m.ModelID,
                    ModelName = m.ModelName
                });

            ddlModel.DataSource = models.ToList();
            ddlModel.Enabled = true;
            ddlModel.DataValueField = "ModelID";
            ddlModel.DataTextField = "ModelName";
            ddlModel.DataBind();
            ddlModel.Items.Insert(0, "--Select Model--");
        }

        protected void ddlModel_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            //var modelID = int.Parse(ddlModel.SelectedValue);
            int modelID;
            if (!int.TryParse(ddlModel.SelectedValue, out modelID))
                return;


            var products = db.Products.Where(p => p.Model.ModelID == modelID)
                .OrderBy(p => p.Years)
                .Select(p => new
                {
                    ProductID = p.ProductID,
                    ProductName = p.ProductName,
                    Years = p.Years
                });

            ddlYear.DataSource = products.ToList();
            ddlYear.Enabled = true;
            ddlYear.DataValueField = "ProductID";
            ddlYear.DataTextField = "Years";
            ddlYear.DataBind();
            ddlYear.Items.Insert(0, "--Select Years--");
        }

        protected void lbnSearch_OnClick(object sender, EventArgs e)
        {
            if (IsValid)
            {
                if (ddlMaker.SelectedIndex == 0
                    || ddlModel.SelectedIndex == 0
                    || ddlYear.SelectedIndex == 0)
                    return;
                
                SelectedProduct selectedProduct = new SelectedProduct()
                {
                    Maker = ddlMaker.SelectedItem.Text,
                    Model = ddlModel.SelectedItem.Text,
                    Year = ddlYear.SelectedItem.Text
                };

                Session["SelectedProduct"] = selectedProduct;
                Response.Redirect("~/Category.aspx");
            }
        }

        protected void btnComment_OnClick(object sender, EventArgs e)
        {
            
        }
    }
}