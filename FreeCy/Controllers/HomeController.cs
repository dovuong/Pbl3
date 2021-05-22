using FreeCy.Code;

using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models.DAO;
using Models.Framework;
using System.Net;
using Models.Common;
using System.Net.Mail;

namespace FreeCy.Controllers
{
    public class HomeController : Controller
    {
        
        public ActionResult Index()
        {
            var productDao = new ProductDAO();
            User user = new User();
            ViewBag.Products = productDao.ListProduct(5, user);

            return View();
        }

        public ActionResult ListProduct(int page = 1, int pageSize = 10, string sort = "")
        {
            var listproductDAO = new ProductDAO();
            User user = new User();
            ViewBag.Products = listproductDAO.ListProduct(pageSize, page, user, sort);
            //var model = listproductDAO.ListAllPaging(page, pageSize);
            int totalRecord = listproductDAO.GetTotalRecords();
            ViewBag.sort = sort;
            ViewBag.Total = totalRecord;
            ViewBag.Page = page;
            ViewBag.Size = pageSize;
            int maxPage = 5;
            int totalPage = 0;

            totalPage = (int)(totalRecord / pageSize) + 1;
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;
            return View();
        }
        public ActionResult Detail(int productID)
        {

            if (productID == 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            var listproductDAO = new ProductDAO();
            var product = new ProductDAO().ViewDetail(productID);

            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.Category = listproductDAO.ViewDetail(product.ID_Product);
            return View(product);
        }

        
       
    }
}