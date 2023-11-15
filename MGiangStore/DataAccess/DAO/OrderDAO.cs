using BusinessObjects.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DAO
{
    public class OrderDAO
    {
        public static void CreateOrder(Order o)
        {
            try
            {
                using (var context = new MGiangStoreContext())
                {
                    context.Orders.Add(o);
                    context.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public static List<Order> GetAllOrder()
        {
            var listOrders = new List<Order>();
            try
            {
                using (var context = new MGiangStoreContext())
                {
                    listOrders = context.Orders.ToList();
                }
                foreach (var item in listOrders)
                {
                    item.Account = AccountDAO.GetAccountById(item.AccountId);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return listOrders;
        }

        public static Order GetOrderById(int id)
        {
            Order o = new Order();
            try
            {
                using (var context = new MGiangStoreContext())
                {
                    o = context.Orders.SingleOrDefault(x => x.OrderId == id);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return o;
        }

        public static List<Order> AdminFillOrder(string startDate, string endDate)
        {
            var listOrders = new List<Order>();
            try
            {
                using (var context = new MGiangStoreContext())
                {
                    listOrders = context.Orders.ToList();
                }
                foreach (var item in listOrders)
                {
                    item.Account = AccountDAO.GetAccountById(item.AccountId);
                }
                if(startDate!= null)
                {
                    DateTime start = Convert.ToDateTime(startDate);
                    listOrders = listOrders.Where(x=>x.OrderDate >= start).ToList();
                }
                if(endDate != null)
                {
                    DateTime end = Convert.ToDateTime(endDate); ;
                    listOrders = listOrders.Where(x => x.OrderDate <= end).ToList();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return listOrders;
        }

        public static List<Order> GetOrderByAccountId(int id)
        {
            var listOrders = new List<Order>();
            try
            {
                using (var context = new MGiangStoreContext())
                {
                    listOrders = context.Orders.Where(x=>x.AccountId == id).ToList();
                }
                foreach (var item in listOrders)
                {
                    item.Account = AccountDAO.GetAccountById(item.AccountId);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return listOrders;
        }
    }
}
