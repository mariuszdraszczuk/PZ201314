using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace QuickNote
{
    public class Connection
    {
        public bool ConnectToDatabase(String parameters)
        {
            return true;
        }

        public bool SaveToDatabase(object toSave)
        {
            return true;
        }

        public bool GetFromDatabase(object toGet)
        {
            return true;
        }



        public bool ConnectToLocalDatabase()
        {
            return true;
        }

        public bool SaveToLocalDatabase(object toSave)
        {
            return true;
        }

        public bool GetFromLocalDatabase(object toGet)
        {
            return true;
        }


        public bool CheckIfSynchronized()
        {
            return true;
        }

    }
}
