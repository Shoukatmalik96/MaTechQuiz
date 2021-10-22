using Quiz.Data.Services;
using Quiz.Services.Enumerations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Quiz.Web.Models.ViewModels
{
    public class ProductListingModel
    {
        public List<Product> Products { get; set; }
    }
    public class ProductModel
    {
        public int CategoryID { get; set; }
        public int ProductTypeID { get; set; }
        public List<Category> Categories { get; set; }
        public List<ProductType> ProductTypes { get; set; }
        public  Product Product { get; set; }
   
        public ActionTypeEnum Action { get; set; }
    }


    public class createModel
    {
        public int ProductID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string SKU { get; set; }
        public decimal Price { get; set; }
        public string ProductCode { get; set; }
        public int ProductTypeID { get; set; }
        public int CategoryID { get; set; }
        public string State { get; set; }
    }
   
}