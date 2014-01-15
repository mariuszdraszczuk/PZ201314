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
    public partial class AddNoteView : Form
    {
        public AddNoteView()
        {
            InitializeComponent();
            MainClass.instance.addNoteView = this;
        }

        private void AddNoteView_Load(object sender, EventArgs e)
        {
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void AddNoteView_LostFocus(object sender, EventArgs e)
        {
            Hide();
            //TODO: zapisywanie w internetach
        }

        private void AddNoteView_Deactivate(object sender, EventArgs e)
        {
            Hide();
            //TODO: zapisywanie w internetach
        }

    }
}
