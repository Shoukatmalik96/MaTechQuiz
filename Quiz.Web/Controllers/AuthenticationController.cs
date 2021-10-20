using Quiz.Data.Services;
using Quiz.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Quiz.Web.Controllers
{
    public class AuthenticationController : Controller
    {
        // GET: Authentication
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(FormCollection form)
        {
            string email = form["Email"];
            string password = form["Password"];

            //Backend Validations
            if (String.IsNullOrEmpty(email) || String.IsNullOrEmpty(password))
            {
                TempData["Error"] = "Please fill all required fields!";
                return View();
            }

            User user = UserServices.Instance.Login(email,password);

            if (user == null)
            {
                TempData["Error"] = "Incorrect username or password!";
                return RedirectToAction("Login");

            }
            else
            {
                TempData["Success"] = "Login Success !";
            }
           
            return RedirectToAction("Index", "Home");
        }


    }
}