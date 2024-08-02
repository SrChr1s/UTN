using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Ejercicio20240520
{
    public partial class frmLocalidades : Form
    {
        public frmLocalidades()
        {
            InitializeComponent();
        }

        private void CargarDGV()
        {
            string sql;

            if (txtLocalidad.Text.Trim() == String.Empty)
            {
                sql = $"select * from Localidades order by Localidad asc";
            }
            else
            {
                sql = $"select * from Localidades where Localidad like '{txtLocalidad.Text}%' order by Localidad asc";
            }
            
            DataTable dtLocalidades = Libreria.Recuperar(sql);
            dgvLocalidades.DataSource = dtLocalidades;
            dgvLocalidades.Columns["IdLocalidad"].Visible = false;
            dgvLocalidades.Columns["CodigoPostal"].HeaderText = "Cod. Pos.";
            dgvLocalidades.AllowUserToAddRows = false;
            dgvLocalidades.AllowUserToDeleteRows = false;
            dgvLocalidades.ReadOnly = true;
            dgvLocalidades.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
        }

        private void Localidades_Load(object sender, EventArgs e)
        {
            this.CenterToScreen();
        }

        private void menuNueva_Click(object sender, EventArgs e)
        {
            frmAltaLocalidad frmNueva = new frmAltaLocalidad();
            frmNueva.Show();
        }

        private void Localidades_Activated(object sender, EventArgs e)
        {
            CargarDGV();
        }

        private void modificarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (dgvLocalidades.CurrentRow != null)
            {
                frmAltaLocalidad frm = new frmAltaLocalidad();
                frm.IdLocalidadSelec = int.Parse(dgvLocalidades.CurrentRow.Cells["IdLocalidad"].Value.ToString());
                frm.Show();
            }
            else
            {
                MessageBox.Show("Debe seleccionar una localidad a modificar!", "Atencion", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void btnFiltrar_Click(object sender, EventArgs e)
        {
            CargarDGV();
        }

        private void txtLocalidad_TextChanged(object sender, EventArgs e)
        {
            CargarDGV();
        }

        private void dgvLocalidades_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
