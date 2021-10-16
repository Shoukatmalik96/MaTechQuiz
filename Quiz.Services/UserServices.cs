using PetaPoco;
using Quiz.Data.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz.Services
{
    public class UserServices
    {
        #region Define as Singleton
        public static UserServices _Instance;
        public static UserServices Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new UserServices();
                return _Instance;
            }
        }
        #endregion

        public User Login(string email, string password)
        {
            using (var context = new QuizRepository())
            {
                return context.Fetch<User>("Select * from Users U where U.Email=@0 AND U.Password=@1", email, password).FirstOrDefault();
            }
        }

    }
}
