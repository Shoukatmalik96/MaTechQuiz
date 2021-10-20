using Quiz.Data.Services;
using Quiz.Services.Enumerations;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz.Services
{
    public class CategoryServices
    {
        #region Define as Singleton
        public static CategoryServices _Instance;
        public static CategoryServices Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new CategoryServices();
                return _Instance;
            }
        }
        #endregion

        #region Category Functions
        public List<Category> GetCategories()
        {
            using (var context = new QuizRepository())
            {
                return context.Fetch<Category>("Select * from Categories").ToList();
            }
        }
        public List<Product> GetProdutByCategoryID(int CategoryID)
        {
            using (var context = new QuizRepository())
            {
                List<Product> products = context.Fetch<Product>("Select * from Prodcuts P inner join Categories C on P.CategoryID = C.CategoryID where P.IsActive = 1 AND P.IsDeleted= 0 AND C.CategoryID = @0", CategoryID).ToList();
                return products;
            }
        }
        public List<Product> GetProdutByCategoryIDS(List<int> categoryIDs)
        {
            using (var context = new QuizRepository())
            {
                List<Product> products = context.Fetch<Product>("Select * from Products P inner join Categories C on P.CatgoryID = C.CategoryID where P.IsActive = 1 AND P.IsDeleted = 0 AND C.CategoryID IN(@0)", categoryIDs).ToList();
                return products;
            }
        }
        public Category GetCategoryByID(int categoryID)
        {
            using (var context = new QuizRepository())
            {
                return context.Fetch<Category>("Select * from Categories C where C.CategoryID = @0", categoryID).FirstOrDefault();
            }
        }
        public bool PopulatingDataToCategoryEntity(int categoryID, string categoryName, string categoryDescription, int DisplaySeqNo, bool IsVisisble, string actionType)
        {

            using (var repo = new QuizRepository())
            {
                try
                {

                    repo.EnableAutoSelect = false;

                    var pSql = repo.Execute("EXEC [PopulateDataInCategoryTable] @CategoryID ,@CategoryName,@categoryDescription,@DisplaySeqNo,@IsVisible,@StatementType", new
                    {
                        CategoryID = categoryID,
                        CategoryName = categoryName,
                        categoryDescription = categoryDescription,
                        DisplaySeqNo = DisplaySeqNo,
                        IsVisible = IsVisisble,
                        StatementType = actionType

                    });
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }

            }
        }
        
        #endregion

    }
}
