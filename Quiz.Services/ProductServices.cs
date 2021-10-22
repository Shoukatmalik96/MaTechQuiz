using Quiz.Data.Services;
using Quiz.Services.Enumerations;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Quiz.Services
{
    public class ProductServices
    {
        #region Define as Singleton
        public static ProductServices _Instance;
        public static ProductServices Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ProductServices();
                return _Instance;
            }
        }
        #endregion

        #region Product Functions
        public List<Product> GetProducts()
        {
            using (var context = new QuizRepository())
            {
                return context.Fetch<Product>("Select * from Products").ToList();
            }
        }
        public Product GetProdutByProductID(int ProductID)
        {
            using (var context = new QuizRepository())
            {
                Product products = context.Fetch<Product>("Select * from Products P where P.ProductID = @0 AND  P.IsActive = 1 AND P.IsDeleted= 0",ProductID).FirstOrDefault();
                return products;
            }
        }
        public List<ProductType> GetProductTypes()
        {
            using (var context = new QuizRepository())
            {
                return context.Fetch<ProductType>("Select * from ProductType").ToList();
            }
        }

        public int GetCategoryIDFromProductsByProductID(int productID)
        {
            using (var context = new QuizRepository())
            {
                return context.ExecuteScalar<int>("Select P.CategoryID from Products P where P.ProductID = @0", productID);
            }
        }
        public int GetProductTpyeIDFromProductsByProductID(int productID)
        {
            using (var context = new QuizRepository())
            {
                return context.ExecuteScalar<int>("Select P.ProductTypeID from Products P where P.ProductID = @0", productID);
            }
        }

        private string GetlastProductCodeByProductTypeID(int productID)
        {

            using (var context = new QuizRepository())
            {
                return context.ExecuteScalar<string>("Select top 1 P.ProductCode from Products P where P.ProductTypeID =1 order by P.CreatedOn desc");
            }
        }
        private int GetLastNumber(string productCode)
        {
            //Get the serial number from lastProductCode
            string numberFromCode = productCode.Substring(productCode.Length - 1);
            //Adding 1 to lastProductCode for generating new
            return int.Parse(numberFromCode) + 1;
        }

        public string GenerateProductCode(int productTypeID)
        {
            try
            {
                //Get lastProductCode Against Product Type
                string lastProductCode = GetlastProductCodeByProductTypeID(productTypeID);
                //Get LastNumber From ProductCode 
                int lastNumber = GetLastNumber(lastProductCode);

                using (var context = new QuizRepository())
                {
                    return context.ExecuteScalar<string>("select dbo.GenerateProductCode(@0,@1) as 'productCode'", productTypeID, lastNumber);
                }
            }
            catch (Exception)
            {

                return "ABC00001";
            }
            
        }
        public bool PopulatingDataToProductEntity(int productID, string Name, string SKU ,string Description ,decimal price,string productCode,int productTypeId,int categoryID, string actionType)
        {

            using (var repo = new QuizRepository())
            {
                try
                {

                    repo.EnableAutoSelect = false;
                    var pSql = repo.Execute("EXEC [PopulateDataInProductTable] @ProductID,@Name,@SKU,@Description,@Price,@ProductCode,@ProductTypeID,@CategoryID,@StatementType", new
                    {
                       ProductID = productID,
                       Name =Name,
                       SKU = SKU,
                       Description =Description,
                       Price = price,
                       ProductCode = productCode,
                       ProductTypeID = productTypeId,
                       CategoryID = categoryID,
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
