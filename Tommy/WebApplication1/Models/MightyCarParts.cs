using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class MightyCarParts
    {
        static MightyCarPartsDBContext db = new MightyCarPartsDBContext();

        public static Customer FindTheUser(string userName)
        {
            return db.Customers.SingleOrDefault(u => u.CustomerName == userName);
        }

        public static bool AddUser(Customer registerCustomer)
        {
            var checkDuplicatedCustomer = db.Customers.SingleOrDefault(c => c.Email == registerCustomer.Email);
            if (checkDuplicatedCustomer != null)
                return false;

            db.Customers.Add(registerCustomer);

            db.SaveChanges();
            return true;
        }
    }
}