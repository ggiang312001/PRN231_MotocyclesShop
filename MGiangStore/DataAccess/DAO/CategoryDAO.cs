using BusinessObjects.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DAO
{
    public class CategoryDAO
    {
        public static List<Category> GetAllCategories()
        {
            var listCategories = new List<Category>();
            try
            {
                using (var context = new MGiangStoreContext())
                {
                    listCategories = context.Categories.ToList();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return listCategories;
        }

        public static Category GetCategoryById(int id)
        {
            var category = new Category();
            try
            {
                using (var connection = new MGiangStoreContext())
                {
                    category = connection.Categories.SingleOrDefault(x => x.CategoryId == id);
                    //category.Products = ProductDAO.GetAllProductsByCategoryId(category.CategoryId);
                }
            }
            catch (Exception)
            {
                throw;
            }
            return category;
        }

        public static void CreateCategory(Category cate)
        {
            try
            {
                using (var context = new MGiangStoreContext())
                {
                    context.Categories.Add(cate);
                    context.SaveChanges();
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public static void UpdateCategory(Category cate)
        {
            try
            {
                using (var context = new MGiangStoreContext())
                {
                    context.Entry(cate).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                    context.SaveChanges();
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public static void DeleteCategory(Category cate)
        {
            try
            {
                using (var context = new MGiangStoreContext())
                {
                    var p1 = context.Categories.SingleOrDefault(c => c.CategoryId == cate.CategoryId);
                    context.Categories.Remove(p1);
                    context.SaveChanges();
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
    }
}
