using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace QuickNote
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            MainClass instance = new MainClass();


            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new TrayForm());
        }
    }
}
