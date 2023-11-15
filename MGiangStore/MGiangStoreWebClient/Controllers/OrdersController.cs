using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using BusinessObjects.Models;
using System.Net.Http.Headers;
using Newtonsoft.Json;
using System.Diagnostics.Metrics;

namespace MGiangStoreWebClient.Controllers
{
    public class OrdersController : Controller
    {
        private readonly HttpClient client = null;
        private readonly IConfiguration configuration;
        private string ApiPort = "";


        public OrdersController(IConfiguration configuration)
        {
            client = new HttpClient();
            var contentType = new MediaTypeWithQualityHeaderValue("application/json");
            client.DefaultRequestHeaders.Accept.Add(contentType);
            this.configuration = configuration;
            ApiPort = configuration.GetSection("ApiHost").Value;
        }

        // GET: Orders
        public async Task<IActionResult> Index()
        {
            HttpResponseMessage response = await client.GetAsync(ApiPort + "api/Orders");
            string strData = await response.Content.ReadAsStringAsync();
            List<Order> listOrders = JsonConvert.DeserializeObject<List<Order>>(strData);
            var session = HttpContext.Session.GetString("loginUser");
            if (session != null)
            {
                var member = JsonConvert.DeserializeObject<Account>(session);
                ViewData["RoleId"] = member.RoleId;
                ViewData["Account"] = member;
            }
            return View(listOrders);
        }
        
        public async Task<IActionResult> AdminFillOrder(string startDate, string endDate)
        {
            HttpResponseMessage response = await client.GetAsync(ApiPort + "api/Orders/Admin/"+startDate+"/"+endDate);
            string strData = await response.Content.ReadAsStringAsync();
            List<Order> listOrders = JsonConvert.DeserializeObject<List<Order>>(strData);
            var session = HttpContext.Session.GetString("loginUser");
            if (session != null)
            {
                var member = JsonConvert.DeserializeObject<Account>(session);
                ViewData["RoleId"] = member.RoleId;
                ViewData["Account"] = member;
            }

            ViewData["startDate"] = startDate;
            ViewData["endDate"] = endDate;
            return View("Index", listOrders);
        }

        // GET: Orders/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            HttpResponseMessage response = await client.GetAsync(ApiPort + "api/OrderDetails/" + id);
            string strData = await response.Content.ReadAsStringAsync();
            List<OrderDetail> listOrderDetails = JsonConvert.DeserializeObject<List<OrderDetail>>(strData);
            if (id == null || listOrderDetails == null)
            {
                return NotFound();
            }
            var session = HttpContext.Session.GetString("loginUser");
            if (session != null)
            {
                var member = JsonConvert.DeserializeObject<Account>(session);
                ViewData["RoleId"] = member.RoleId;
                ViewData["Account"] = member;
            }
            ViewData["ListOrderDetails"] = listOrderDetails;
            return View(listOrderDetails);
        }

        //// GET: Orders/Create
        //public IActionResult Create()
        //{
        //    ViewData["AccountId"] = new SelectList(_context.Accounts, "AccountId", "Email");
        //    return View();
        //}

        //// POST: Orders/Create
        //// To protect from overposting attacks, enable the specific properties you want to bind to.
        //// For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> Create([Bind("OrderId,AccountId,OrderDate,TotalAmount")] Order order)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        _context.Add(order);
        //        await _context.SaveChangesAsync();
        //        return RedirectToAction(nameof(Index));
        //    }
        //    ViewData["AccountId"] = new SelectList(_context.Accounts, "AccountId", "Email", order.AccountId);
        //    return View(order);
        //}

        //// GET: Orders/Edit/5
        //public async Task<IActionResult> Edit(int? id)
        //{
        //    if (id == null || _context.Orders == null)
        //    {
        //        return NotFound();
        //    }

        //    var order = await _context.Orders.FindAsync(id);
        //    if (order == null)
        //    {
        //        return NotFound();
        //    }
        //    ViewData["AccountId"] = new SelectList(_context.Accounts, "AccountId", "Email", order.AccountId);
        //    return View(order);
        //}

        //// POST: Orders/Edit/5
        //// To protect from overposting attacks, enable the specific properties you want to bind to.
        //// For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> Edit(int id, [Bind("OrderId,AccountId,OrderDate,TotalAmount")] Order order)
        //{
        //    if (id != order.OrderId)
        //    {
        //        return NotFound();
        //    }

        //    if (ModelState.IsValid)
        //    {
        //        try
        //        {
        //            _context.Update(order);
        //            await _context.SaveChangesAsync();
        //        }
        //        catch (DbUpdateConcurrencyException)
        //        {
        //            if (!OrderExists(order.OrderId))
        //            {
        //                return NotFound();
        //            }
        //            else
        //            {
        //                throw;
        //            }
        //        }
        //        return RedirectToAction(nameof(Index));
        //    }
        //    ViewData["AccountId"] = new SelectList(_context.Accounts, "AccountId", "Email", order.AccountId);
        //    return View(order);
        //}

        //// GET: Orders/Delete/5
        //public async Task<IActionResult> Delete(int? id)
        //{
        //    if (id == null || _context.Orders == null)
        //    {
        //        return NotFound();
        //    }

        //    var order = await _context.Orders
        //        .Include(o => o.Account)
        //        .FirstOrDefaultAsync(m => m.OrderId == id);
        //    if (order == null)
        //    {
        //        return NotFound();
        //    }

        //    return View(order);
        //}

        //// POST: Orders/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> DeleteConfirmed(int id)
        //{
        //    if (_context.Orders == null)
        //    {
        //        return Problem("Entity set 'MGiangStoreContext.Orders'  is null.");
        //    }
        //    var order = await _context.Orders.FindAsync(id);
        //    if (order != null)
        //    {
        //        _context.Orders.Remove(order);
        //    }

        //    await _context.SaveChangesAsync();
        //    return RedirectToAction(nameof(Index));
        //}

        //private bool OrderExists(int id)
        //{
        //  return (_context.Orders?.Any(e => e.OrderId == id)).GetValueOrDefault();
        //}
    }
}
