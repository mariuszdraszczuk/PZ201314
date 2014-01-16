using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace QuickNote
{
    public class MainClass
    {
        public AddNoteForm addNoteView;
        public SettingsForm settingsView;
        public TrayForm trayView;
        public NotesForm notesView;

        public Connection connection;

        private User currentUser;

        public static MainClass instance;

        public MainClass()
        {
            instance = this;
        }
    }
}
