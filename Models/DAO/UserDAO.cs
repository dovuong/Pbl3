using Models.Common;
using Models.Framework;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.DAO
{
    public class UserDAO
    {
        static long _Id;
        FreeCy db = null;

        private static UserDAO _Instance;
        public static UserDAO Instance
        {
            get
            {
                if (_Instance == null)
                {
                    _Instance = new UserDAO();
                }
                return _Instance;
            }
            set
            {
                ;
            }
        }
        public UserDAO()
        {
            db = new FreeCy();
        }
        public int SaveChanges()
        {
            try
            {
                return db.SaveChanges();
            }
            catch (DbEntityValidationException ex)
            {
                string errorMessages = string.Join("; ", ex.EntityValidationErrors.SelectMany(x => x.ValidationErrors).Select(x => x.PropertyName + ": " + x.ErrorMessage));
                throw new DbEntityValidationException(errorMessages);
            }
        }
        public bool CheckUserName(string userName)
        {
            return db.Users.Count(x => x.UserName == userName) > 0;
        }
        public bool CheckUserEmail(string email)
        {
            return db.Users.Count(x => x.Email == email) > 0;
        }
        public int Insert(User entity)
        {

            db.Users.Add(entity);
            SaveChanges();
            return entity.ID_User;
        }
        public long InsertForFacebook(User entity)
        {
            var user = db.Users.SingleOrDefault(x => x.UserName == entity.UserName);
            if (user == null)
            {
                db.Users.Add(entity);
                SaveChanges();
                return entity.ID_User;
            }
            else
            {
                return user.ID_User;
            }

        }
        public void ValidateOnSaveEnabled()
        {
            db.Configuration.ValidateOnSaveEnabled = false;
        }
        public User CheckUserByActivationCode(Guid code)
        {
            return db.Users.Where(x => x.ActivationCode == code).FirstOrDefault();
        }
        public int Login(string userName, string passWord, bool isLoginAdmin = false)
        {
            var result = db.Users.SingleOrDefault(x => x.UserName == userName);
            if (result == null)
            {
                return 0;
            }
            else
            {
                if (isLoginAdmin == true)
                {
                    if (result.GroupID == CommonConstant.ADMIN_GROUP || result.GroupID == CommonConstant.MOD_GROUP)
                    {
                        if (result.Status == false)
                        {
                            return -1;
                        }
                        else
                        {
                            if (result.Password == passWord)
                                return 1;
                            else
                                return -2;
                        }
                    }
                    else
                    {
                        return -3;
                    }
                }
                else
                {
                    if (result.Status == false)
                    {
                        return -1;
                    }
                    else
                    {
                        if (result.Password == passWord)
                            return 1;
                        else
                            return -2;
                    }
                }
            }
        }
        public List<string> GetListCredential(string userName)
        {
            var user = db.Users.Single(x => x.UserName == userName);
            var data = (from a in db.Credentials
                        join b in db.UserGroups on a.UserGroupID equals b.ID
                        join c in db.Roles on a.RoleID equals c.ID
                        where b.ID == user.GroupID
                        select new
                        {
                            RoleID = a.RoleID,
                            UserGroupID = a.UserGroupID
                        }).AsEnumerable().Select(x => new Credential()
                        {
                            RoleID = x.RoleID,
                            UserGroupID = x.UserGroupID
                        });
            return data.Select(x => x.RoleID).ToList();

        }
        public User GetById(string userName)
        {
            return db.Users.SingleOrDefault(x => x.UserName == userName);
        }
        public void SaveUserId(long id)
        {
            _Id = id;
        }
        public long GetUserId()
        {
            return _Id;
        }
        public User ViewDetails(long id)
        {
            return db.Users.Find(id);
        }
        public User GetUserByEmail(string email)
        {
            return db.Users.Where(x => x.Email == email).FirstOrDefault();
        }
        public User GetUserByResetCode(string code)
        {
            User user = new User();
            List<User> list = db.Users.ToList();
            foreach (User item in list)
            {
                if (item.ResetPasswordCode == code)
                {
                    user = item;
                }
            }
            return user;
        }
        public int GetTotalRecords()
        {
            return db.Users.OrderByDescending(x => x.ID_User).Count();
        }
        public List<User> ListUsers(int top, int soTrang, User user)
        {
            return db.Users.Where(x => x.Status == true).OrderByDescending(x => x.ID_User).Skip((soTrang - 1) * top).Take(top).ToList();
        }

    }
}