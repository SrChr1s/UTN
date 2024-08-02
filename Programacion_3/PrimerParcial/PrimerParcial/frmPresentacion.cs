using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PrimerParcial
{
    public partial class frmPresentacion : Form
    {
        public frmPresentacion()
        {
            InitializeComponent();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            timer1.Stop();
            frmParcial frm = new frmParcial();
            frm.Show();
            this.Hide();
        }

        private void frmPresentacion_Load(object sender, EventArgs e)
        {
            this.CenterToScreen();
            timer1.Interval = 2000;
            timer1.Start();
        }
    }
}
