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

        private void CargarDGV()
        {
            string sql;

            if (chkTodas.Checked)
            {
                sql = "select c.IdCliente, c.Apellido, c.Nombre, td.TipoDoc, c.NDoc, c.FechaNac, c.Direccion, l.Localidad, c.Cel, c.Email, c.Activo, c.Observaciones from Clientes as c, Localidades as l, TiposDocs as td where (c.IdLocalidad = l.IdLocalidad) and (c.IdTipoDoc = td.IdTipoDoc) order by Apellido";
            }
            else
            {
                sql = $"select c.IdCliente, c.Apellido, c.Nombre, td.TipoDoc, c.NDoc, c.FechaNac, c.Direccion, l.Localidad, c.Cel, c.Email, c.Activo, c.Observaciones from Clientes as c, Localidades as l, TiposDocs as td where (c.IdLocalidad = l.IdLocalidad) and (c.IdTipoDoc = td.IdTipoDoc) and (l.IdLocalidad = {cmbLocalidades.SelectedValue}) order by Apellido";
            }

            DataTable dtClientes = Libreria.Recuperar(sql);
            dgvClientes.DataSource = dtClientes;
            dgvClientes.Columns["IdCliente"].Visible = false;
            dgvClientes.Columns["TipoDoc"].HeaderText = "Tipo Documento";
            dgvClientes.Columns["NDoc"].HeaderText = "Nro Documento";
            dgvClientes.Columns["FechaNac"].HeaderText = "Fecha de Nacimiento";
            dgvClientes.Columns["Localidad"].HeaderText = "Localidad";
            dgvClientes.Columns["Cel"].HeaderText = "Telefono";
            dgvClientes.AllowUserToAddRows = false;
            dgvClientes.AllowUserToDeleteRows = false;
            dgvClientes.ReadOnly = true;
            dgvClientes.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
        }

        private void frmClientes_Load(object sender, EventArgs e)
        {
            this.CenterToScreen();

            DataTable dtLocalidades = Libreria.Recuperar("select * from Localidades order by Localidad asc");
            cmbLocalidades.DataSource = dtLocalidades;
            cmbLocalidades.ValueMember = "IdLocalidad";
            cmbLocalidades.DisplayMember = "Localidad";
            cmbLocalidades.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        private void frmClientes_Activated(object sender, EventArgs e)
        {
            CargarDGV();
        }

        private void nuevoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmAltaCliente frm = new frmAltaCliente();
            frm.Show();
        }

        private void chkTodas_CheckedChanged(object sender, EventArgs e)
        {
            if (chkTodas.Checked)
            {
                cmbLocalidades.Enabled = false;
            }
            else
            {
                cmbLocalidades.Enabled = true;
            }
        }

        private void btnFiltrar_Click(object sender, EventArgs e)
        {
            CargarDGV();
        }
    }
}
