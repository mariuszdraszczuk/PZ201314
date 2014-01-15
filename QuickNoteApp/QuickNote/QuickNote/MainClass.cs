using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace QuickNote
{
    public class MainClass
    {
        public AddNoteView addNoteView;
        public SettingsView settingsView;
        public TrayView trayView;

        public static MainClass instance;

        public MainClass()
        {
            instance = this;
        }

    }
}
