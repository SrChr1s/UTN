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

        private void Localidades_Load(object sender, EventArgs e)
        {
            this.CenterToScreen();
        }

        private void menuNueva_Click(object sender, EventArgs e)
        {
            frmEjercicio8 frmNueva = new frmEjercicio8();
            frmNueva.Show();
        }

        private void Localidades_Activated(object sender, EventArgs e)
        {
            string sql = $"select * from Localidades order by Localidad asc";
            DataTable dtLocalidades = Libreria.Recuperar(sql);
            dgvLocalidades.DataSource = dtLocalidades;
            dgvLocalidades.Columns["IdLocalidad"].Visible = false;
            dgvLocalidades.Columns["CodigoPostal"].HeaderText = "Cod. Pos.";
            dgvLocalidades.AllowUserToAddRows = false;
            dgvLocalidades.AllowUserToDeleteRows = false;
            dgvLocalidades.ReadOnly = true;
            dgvLocalidades.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
        }
    }
}
