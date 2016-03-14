using System;
using System.Collections.Generic;
using System.Diagnostics;
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

        private delegate void DisplaySelectDelegate(DropDownList list, string message);
        private event DisplaySelectDelegate DisplaySelectEvent;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplaySelectEvent = (dropDownList, message) =>
            {
                dropDownList.Items.Insert(0, "--Select " + message + "--");
            };

            if (!IsPostBack)
            {
                ddlMaker.DataSource = db.VehicleMakes.ToList();
                ddlMaker.DataTextField = "MakerName";
                ddlMaker.DataValueField = "VehicleMakerID";
                ddlMaker.DataBind();

                //ddlMaker.Items.Insert(0, "--Select Maker--");
                DisplaySelectEvent?.Invoke(ddlMaker, "Maker");

                Session.Clear();
            }
            
            RandomComment();
        }

        private void RandomComment()
        {
            var reviewCount = db.Reviews.Count();
            Random rng = new Random((int) DateTime.Now.Ticks);
            var rngReview = rng.Next(1, reviewCount + 1);

            var rngOrderDetail = db.OrderDetails.FirstOrDefault(od => od.ReviewID == rngReview);
            if (rngOrderDetail != null)
            {
                var rngProductImg = rngOrderDetail.Product.ImageFile;

                lblProdDesc.Text = rngOrderDetail.Product.ProductDescription;
                imgComment.ImageUrl = "~/Images/Products/" + rngProductImg;
            }
            lblUser.Text = "Buyer: " + rngOrderDetail.Order.Customer.CustomerName;
            lblComment.Text = db.Reviews.Find(rngReview).Comment;
            
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

            //ddlModel.Items.Insert(0, "--Select Model--");
            DisplaySelectEvent?.Invoke(ddlModel, "Model");
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

            //ddlYear.Items.Insert(0, "--Select Years--");
            DisplaySelectEvent?.Invoke(ddlYear, "Years");
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
                Response.Redirect("/Category");
            }
        }

        protected void btnComment_OnClick(object sender, EventArgs e)
        {
            
        }
    }
}