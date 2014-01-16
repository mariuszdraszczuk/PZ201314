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
    public partial class AddNoteForm : Form
    {
        private Note note;

        public AddNoteForm()
        {
            InitializeComponent();
            MainClass.instance.addNoteView = this;
            note = new Note("", "");
        }

        private void AddNoteView_Load(object sender, EventArgs e)
        {
        }
        
        private void button3_Click(object sender, EventArgs e)
        {
            //Hide();
        }

        private void AddNoteView_LostFocus(object sender, EventArgs e)
        {
            //Hide();
            //TODO: zapisywanie w internetach
        }

        private void AddNoteView_Deactivate(object sender, EventArgs e)
        {
            Hide();
            //TODO: zapisywanie w internetach
        }

        private void AddNoteView_Resize(object sender, EventArgs e)
        {
            Hide();
            //TODO: zapisywanie w internetach
        }

        private void button1_Click(object sender, EventArgs e)
        {
            richTextBox1.Text = note.noteText;
            Hide();
        }

        public void setTextBackup()
        {
            note.noteText = richTextBox1.Text;
        }

    }
}
