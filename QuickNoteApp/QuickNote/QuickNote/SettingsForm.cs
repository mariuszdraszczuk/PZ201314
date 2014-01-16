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
    public partial class SettingsForm : Form
    {
        public SettingsForm()
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
                TrayForm trayView = new TrayForm();
            }

            MainClass.instance.trayView.Show();

            this.Hide();
            
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void SettingsView_LostFocus(object sender, EventArgs e)
        {
            Hide();
            //TODO: zapisywanie w internetach
        }

        private void SettingsView_Deactivate(object sender, EventArgs e)
        {
            Hide();
            //TODO: zapisywanie w internetach
        }

        private void SettingsView_Resize(object sender, EventArgs e)
        {
            Hide();
            //TODO: zapisywanie w internetach
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            Hide();
        }


    }
}
