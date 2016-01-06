using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;

namespace WebApplication1
{
    public class ProductView
    {
        public string ProductId { get; set; }
        public string ProductName { get; set; }
        public string CategoryId { get; set; }
        public int ViewCounts { get; set; }

    }

    public class ProductViewList
    {
        public List<ProductView> ProductViews { get; set; }
        public ProductViewList()
        {
            ProductViews = new List<ProductView>();    
        }

        public void Add(ProductView newView)
        {
            var view = ProductViews.FirstOrDefault(v => v.ProductId == newView.ProductId);
            if (view == null)
            {
                ProductViews.Add(newView);
            }
            else
            {
                view.ViewCounts ++;
            }
        }

        public List<ProductView> Display()
        {
            return ProductViews.OrderByDescending(p => p.ViewCounts).ThenBy(p => p.ProductName).ToList();
        } 

    }
}