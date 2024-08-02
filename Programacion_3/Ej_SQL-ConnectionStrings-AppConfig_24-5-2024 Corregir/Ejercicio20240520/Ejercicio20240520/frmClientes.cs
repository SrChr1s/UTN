using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Ejercicio20240520
{
    public partial class frmClientes : Form
    {
        public frmClientes()
        {
            InitializeComponent();
        }

        private void frmClientes_Load(object sender, EventArgs e)
        {
            this.CenterToScreen();
        }

        private void frmClientes_Activated(object sender, EventArgs e)
        {
            string sql = $"select * from Clientes order by Apellido";
            DataTable dtClientes = Libreria.Recuperar(sql);
            dgvClientes.DataSource = dtClientes;
            dgvClientes.Columns["IdCliente"].Visible = false;
            dgvClientes.Columns["IdTipoDoc"].HeaderText = "Tipo Documento";
            dgvClientes.Columns["NDoc"].HeaderText = "Nro Documento";
            dgvClientes.Columns["FechaNac"].HeaderText = "Fecha de Nacimiento";
            dgvClientes.Columns["IdLocalidad"].HeaderText = "Localidad";
            dgvClientes.Columns["Cel"].HeaderText = "Telefono";
            dgvClientes.AllowUserToAddRows = false;
            dgvClientes.AllowUserToDeleteRows = false;
            dgvClientes.ReadOnly = true;
            dgvClientes.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
        }

        private void nuevoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmAltaCliente frm = new frmAltaCliente();
            frm.Show();
        }
    }
}
