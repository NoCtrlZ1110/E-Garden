﻿using Microsoft.AspNetCore.Mvc;
using UET.EGarden.Web.Controllers;

namespace UET.EGarden.Web.Public.Controllers
{
    public class AboutController : EGardenControllerBase
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}