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
    public partial class SettingsView : Form
    {
        public SettingsView()
        {
            InitializeComponent();
            MainClass.instance.settingsView = this;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //TODO: przekierowanie do strony zarządzania kontem
        }

        private void button3_Click(object sender, EventArgs e)
        {
            //TODO: wylogowywanie
        }

        private void SettingsView_Load(object sender, EventArgs e)
        {
            //TODO: zbieranie danych z danymi aktualnego logowania
            //TODO: widok gdy jest sie niezalogowanym
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (MainClass.instance.trayView == null)
            {
                TrayView trayView = new TrayView();
            }

            MainClass.instance.trayView.Show();

            this.Hide();
            
        }
    }
}
