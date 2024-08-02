using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Ejercicio20240520
{
    public partial class frmPrincipal : Form
    {
        public frmPrincipal()
        {
            InitializeComponent();
        }

        private void menuLocalidades_Click(object sender, EventArgs e)
        {
            frmLocalidades frm = new frmLocalidades();
            frm.Show();
        }

        private void menuClientes_Click(object sender, EventArgs e)
        {
            frmClientes frm = new frmClientes();
            frm.Show();
        }

        private void frmPrincipal_Load(object sender, EventArgs e)
        {
            this.CenterToScreen();
        }
    }
}
