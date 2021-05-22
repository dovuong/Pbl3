using Models.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.DAO
{
    class ListProductDAO
    {
        FreeCy db = null;
        public ListProductDAO()
        {
            db = new FreeCy();
        }
        public List<Product> ListProducts(int top, User user)
        {
            return db.Products.OrderByDescending(x => x.ID_Product).Take(top).ToList();
        }
    }
}
