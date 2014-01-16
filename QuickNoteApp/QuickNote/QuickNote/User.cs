using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace QuickNote
{
    public class User
    {
        public String username;
        public String userEmail;

        public User(String _username, String _userEmail)
        {
            username = _username;
            userEmail = _userEmail;
        }
    }
}
