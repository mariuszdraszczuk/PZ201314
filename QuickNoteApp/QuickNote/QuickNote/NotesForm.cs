using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace QuickNote
{
    public partial class NotesForm : Form
    {
        private List<Note> notesList;

        public NotesForm()
        {
            InitializeComponent();
            MainClass.instance.notesView = this;
            //TODO: SET NOTES LIST
        }


    }
}
