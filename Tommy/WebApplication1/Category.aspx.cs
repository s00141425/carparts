using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Diagnostics;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class Category : System.Web.UI.Page
    {
        private MightyCarPartsDBContext db = new MightyCarPartsDBContext();
        private static SelectedProduct selectedProduct = new SelectedProduct();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayMaker();

                DisplayProductLists();
            }
            
            Test_Category_Product();
        }

        private void Test_Category_Product()
        {
            var selectedMaker = db.VehicleMakes.SingleOrDefault(m => m.MakerName == selectedProduct.Maker);

            if (selectedMaker != null)
            {
                var makerID = selectedMaker.VehicleMakerID;
                var selectedModel = db.Models.SingleOrDefault(m => m.ModelName == selectedProduct.Model);
                if (selectedModel != null)
                {
                    var modelID = selectedModel.ModelID;
                    var allProducts = db.Products
                        .Where(p => p.ModelID == modelID && p.Model.VehicleMakerID == makerID);

                    int i = 0;
                    foreach (Product product in allProducts)
                    {
                        i++;
                        CategoryProduct categoryProduct = (CategoryProduct)LoadControl("~/CategoryProduct.ascx");
                        categoryProduct.ID = "categoryProduct" + i;
                        categoryProduct.SelectedProduct = product;
                        if (i%2 == 1)
                        {
                            PlaceHolder1.Controls.Add(categoryProduct);
                        }
                        else
                        {
                            PlaceHolder2.Controls.Add(categoryProduct);
                        }
                    }
                }
            }
        }

        private void DisplayMaker()
        {
            var product = Session["SelectedProduct"] as SelectedProduct;

            if (product != null)
            {
                selectedProduct.Maker = product.Maker;
                selectedProduct.Model = product.Model;
                selectedProduct.Year = product.Year;

                divSelectedProduct.InnerHtml
                    = "<strong>Selected Car: " + product.Maker + ", " + product.Model + ", " + product.Year + "</strong>";
            }

            ddlCategorySelector.DataSource = db.VehicleMakes.ToList();
            ddlCategorySelector.DataTextField = "MakerName";
            ddlCategorySelector.DataValueField = "VehicleMakerID";
            ddlCategorySelector.DataBind();
            ddlCategorySelector.Items.Insert(0, "--Select Maker--");
        }

        protected void ddlCategorySelector_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCategorySelector.Items[0].Text == "--Select Maker--")
            {
                selectedProduct.Maker = ddlCategorySelector.SelectedItem.Text;

                var makerId = int.Parse(ddlCategorySelector.SelectedValue);

                var models = db.Models.Where(m => m.VehicleMake.VehicleMakerID == makerId)
                    .OrderBy(m => m.VehicleMakerID)
                    .Select(m =>
                    new
                    {
                        ModelID = m.ModelID,
                        ModelName = m.ModelName
                    });

                ddlCategorySelector.Items.Clear();
                ddlCategorySelector.DataSource = models.ToList();
                ddlCategorySelector.DataValueField = "ModelID";
                ddlCategorySelector.DataTextField = "ModelName";
                ddlCategorySelector.DataBind();
                ddlCategorySelector.Items.Insert(0, "--Select Model--");
            }

            else if (ddlCategorySelector.Items[0].Text == "--Select Model--")
            {
                selectedProduct.Model = ddlCategorySelector.SelectedItem.Text;

                var modelID = int.Parse(ddlCategorySelector.SelectedValue);

                var products = db.Products.Where(p => p.Model.ModelID == modelID)
                    .OrderBy(p => p.Years)
                    .Select(p => new
                    {
                        ProductID = p.ProductID,
                        ProductName = p.ProductName,
                        Years = p.Years
                    });

                ddlCategorySelector.Items.Clear();
                ddlCategorySelector.DataSource = products.ToList();
                ddlCategorySelector.Enabled = true;
                ddlCategorySelector.DataValueField = "ProductID";
                ddlCategorySelector.DataTextField = "Years";
                ddlCategorySelector.DataBind();
                ddlCategorySelector.Items.Insert(0, "--Select Years--");
            }
            else
            {
                selectedProduct.Year = ddlCategorySelector.SelectedItem.Text;

                ddlCategorySelector.Items.Clear();

                Session.Clear();
                Session["SelectedProduct"] = selectedProduct;

                DisplayMaker();

                DisplayProductLists();
            }
        }

        protected void lbnReset_OnClick(object sender, EventArgs e)
        {
            ddlCategorySelector.Items.Clear();
            DisplayMaker();
            divSelectedProduct.InnerHtml = "<strong>Please select the category</strong>";
        }

        protected void DisplayProductLists()
        {
            var selectedVehicle = db.VehicleMakes.SingleOrDefault(m => m.MakerName == selectedProduct.Maker);
            if (selectedVehicle != null)
            {
                var makerID = selectedVehicle.VehicleMakerID;
                var selectedModel = db.Models.SingleOrDefault(m => m.ModelName == selectedProduct.Model);
                if (selectedModel != null)
                {
                    var modelID = selectedModel.ModelID;
                    var selectedProducts = db.Products.Where(p => p.ModelID == modelID && p.Model.VehicleMakerID == makerID)
                        .Select(p => new
                        {
                            categoryName = p.Category.CategoryName
                        });

                    foreach (var product in selectedProducts)
                    {
                        HtmlGenericControl label = new HtmlGenericControl("label");
                        label.InnerText = product.categoryName;
                        label.Attributes.Add("class", "form-control");
                        divSelectedCategory.Controls.Add(label);
                    }
                }
            }
        }

        protected void lbnShippingCart_OnClick(object sender, EventArgs e)
        {

        }
    }
}