using Quiz.Data.Services;
using Quiz.Services.Enumerations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Quiz.Web.Models.ViewModels
{
    public class CategoryListingModel
    {
        public IEnumerable<Category> Categories { get; set; }
        public List<Product> CategoryProducts { get; set; }
    }
    public class CategoryProduct
    {
        public List<Product> ProductModel { get; set; }

    }
    public class CategoryModel
    {
        public Category Category { get; set; }
        public ActionTypeEnum Action { get; set; }
    }

    public class CrateModel
    {
        public int CategoryID { get; set; }
        public string CategoryName { get; set; }
        public string CategoryDescription { get; set;  }
        public int? ParentCategoryID { get; set; }
        public int? DisplaySeqNo { get; set; }
        public bool IsVisible { get; set; }
        public string State { get; set; }
    }
}
