﻿using Microsoft.AspNetCore.Mvc;

namespace MGiangStoreWebClient.Controllers
{
    public class LogoutController : Controller
    {
        public IActionResult Index()
        {
            HttpContext.Session.Remove("loginUser");
            return RedirectToAction("Index", "Home");
        }
    }
}
