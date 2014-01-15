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
    public partial class TrayView : Form
    {

        public TrayView()
        {
            InitializeComponent();
            this.LostFocus += new EventHandler(MainView_LostFocus);
            MainClass.instance.trayView = this;
        }

        private void OnExit(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void MainView_Load(object sender, EventArgs e)
        {
            
        }


        private void MainView_Resize(object sender, EventArgs e)
        {
            if (FormWindowState.Minimized == WindowState)
                Hide();
        }

        private void notifyIcon1_MouseClick(object sender, MouseEventArgs e)
        {
            BringToFront();
            Show();
            WindowState = FormWindowState.Normal;
            
        }

        private void MainView_LostFocus(object sender, EventArgs e)
        {
            Hide();
            WindowState = FormWindowState.Minimized;
        }

        private void MainView_Deactivate(object sender, EventArgs e)
        {
            Hide();
            WindowState = FormWindowState.Minimized;
        }


        private void button1_Click(object sender, EventArgs e)
        {
            if (MainClass.instance.addNoteView == null)
            {
                AddNoteView addNoteView = new AddNoteView();
            }

            MainClass.instance.addNoteView.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //TODO: otwieranie strony internetowej
        }

        private void button4_Click(object sender, EventArgs e)
        {
            //TODO: share linka do online'owej wersji + button widoczny po najechaniu pod odpowiednim wierszem
        }

        private void button3_Click(object sender, EventArgs e)
        {


            if (MainClass.instance.settingsView == null)
            {
                SettingsView settingsView = new SettingsView();
            }
            
            MainClass.instance.settingsView.Show();
            //TODO: niech przy kliknieciu sie nie zmienia pozycja
        }
    }
}
