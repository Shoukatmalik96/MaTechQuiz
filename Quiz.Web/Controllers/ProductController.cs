using Quiz.Data.Services;
using Quiz.Services;
using Quiz.Services.Enumerations;
using Quiz.Web.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Quiz.Web.Controllers
{
    // GET: Product
    public class ProductController : Controller
    {
        public ActionResult Index()
        {

            //Initialize view model object
            ProductListingModel model = new ProductListingModel();
            //Assign categories
            model.Products = ProductServices.Instance.GetProducts();
            //Passing model to parital view
            return PartialView(model);
        }
        public ActionResult GetProductModal(int? productID, string actionType)
        {

            ProductModel model = new ProductModel()
            {
                CategoryID    = productID.HasValue  && productID.Value > 0 ? ProductServices.Instance.GetCategoryIDFromProductsByProductID(productID.Value):0,
                ProductTypeID = productID.HasValue  && productID.Value > 0 ? ProductServices.Instance.GetProductTpyeIDFromProductsByProductID(productID.Value):0,
                Product       = productID.HasValue  && productID.Value > 0 ? ProductServices.Instance.GetProdutByProductID(productID.Value): new Product(),
                Categories    = CategoryServices.Instance.GetCategories(),
                ProductTypes  = ProductServices.Instance.GetProductTypes(),
                Action        = actionType.Equals("insert") ? ActionTypeEnum.Insert : actionType.Equals("update") ? ActionTypeEnum.Update : ActionTypeEnum.delete
            };
            return PartialView("_ProductModal", model);
        }
        public JsonResult ProductAction(createModel model)
        {
            //Initializing json object
            JsonResult result = new JsonResult();
            //Allow JsonRequestBehviour
            result.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            //Generate ProductCode In DB and Fetch
            string productCode = ProductServices.Instance.GenerateProductCode(model.ProductTypeID);
            //checking weather productCode is updated or Not 
            productCode = productCode.Equals(model.ProductCode) ? model.ProductCode : productCode;
            //Create Product In DB
            var productSuccess = ProductServices.Instance.PopulatingDataToProductEntity( model.ProductID,model.Name, model.SKU, model.Description,model.Price,productCode,model.ProductTypeID,model.CategoryID,model.State);
            //create response
            result.Data = new  { Message = productSuccess ? "Sucessfuly Created" : "oops something wrong", Success = productSuccess };
            //return response
            return result;
        }
       
    }
}