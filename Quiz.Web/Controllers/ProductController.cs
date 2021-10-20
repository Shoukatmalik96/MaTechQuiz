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
    public class ProductController : Controller
    {
        public ActionResult Index()
        {
         
            //Initialize view model object
            CategoryListingModel model = new CategoryListingModel();
            //Assign categories
            model.Categories = CategoryServices.Instance.GetCategories();
            //GetList of categories
            List<int> categoryIdsList = model.Categories.Select(x=>x.CategoryID).ToList();
            //fetching list of products by Ids
            var productList = CategoryServices.Instance.GetProdutByCategoryIDS(categoryIdsList);
            //Assign productlist to categoryProducts
            model.CategoryProducts = productList.ToList();
            //Passing model to parital view
            return PartialView(model);
        }
        public ActionResult GetCatoryModal(int categoryID, string actionType)
        {
            //Initialize categoryModel object
            CategoryModel model =new CategoryModel();
            //Fetch cateory from db by CategoryID
            model.Category = CategoryServices.Instance.GetCategoryByID(categoryID);
            //Assgin ActionType to model
            model.Action = actionType.Equals("insert") ? ActionTypeEnum.Insert : actionType.Equals("update") ? ActionTypeEnum.Update : ActionTypeEnum.delete;
            //Retrun model to view
            return PartialView("_CategoryModal",model);
        }
        public JsonResult CategoryAction(CrateModel model)
        {
            //Initializing json object
            JsonResult result = new JsonResult();
            //Allow JsonRequestBehviour
            result.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            //checking operation Status
            var categorySuccess = CategoryServices.Instance.PopulatingDataToCategoryEntity( 
                                                                          model.CategoryID, 
                                                                          model.CategoryName,  
                                                                          model.CategoryDescription, 
                                                                          model.DisplaySeqNo.HasValue ? model.DisplaySeqNo.Value:0, 
                                                                          true,model.State
                                                                          );
            //create response
            result.Data = new  { Message = categorySuccess ? "Sucessfuly Created" : "oops something wrong", Success = categorySuccess };
            //return response
            return result;
        }
       
    }
}