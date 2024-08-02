using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Ej_10_04_2024
{
	public partial class frmEjListado : Form
	{
		public frmEjListado()
		{
			InitializeComponent();
		}

		private void frmEjListado_Load(object sender, EventArgs e)
		{
			this.CenterToScreen();

			// Agregar controles necesarios para agregar un registro nuevo a la lista
			// validando los controles a traves de una funcion y presentando un mensaje
			// aclaratorio sobre el primer error detectado

			dtpFechaIngreso.MaxDate = DateTime.Now;

			lsvListado.View = View.Details;

			lsvListado.Columns.Add("Nro");
			lsvListado.Columns.Add("Apellido");
			lsvListado.Columns.Add("Nombre");
			lsvListado.Columns.Add("Cuota");
			lsvListado.Columns.Add("Fecha Ingreso");

			lsvListado.Items.Add("16775");
			lsvListado.Items[0].SubItems.Add("Salazar");
			lsvListado.Items[0].SubItems.Add("Christian");
			lsvListado.Items[0].SubItems.Add("2500");
			lsvListado.Items[0].SubItems.Add("13/03/2023");

			lsvListado.Items.Add("16776");
			lsvListado.Items[1].SubItems.Add("Banino");
			lsvListado.Items[1].SubItems.Add("Gabriel");
			lsvListado.Items[1].SubItems.Add("2200");
			lsvListado.Items[1].SubItems.Add("15/03/2023");

			lsvListado.Items.Add("16777");
			lsvListado.Items[2].SubItems.Add("Cecchi");
			lsvListado.Items[2].SubItems.Add("David");
			lsvListado.Items[2].SubItems.Add("2800");
			lsvListado.Items[2].SubItems.Add("24/05/2019");

			lsvListado.Items.Add("16778");
			lsvListado.Items[3].SubItems.Add("Torres");
			lsvListado.Items[3].SubItems.Add("Sofia");
			lsvListado.Items[3].SubItems.Add("2000");
			lsvListado.Items[3].SubItems.Add("05/07/2024");

			lsvListado.Items.Add("16779");
			lsvListado.Items[4].SubItems.Add("Del Pontigo");
			lsvListado.Items[4].SubItems.Add("Ulises");
			lsvListado.Items[4].SubItems.Add("2500");
			lsvListado.Items[4].SubItems.Add("28/09/2021");

			lsvListado.Columns[0].Width = 100;
			lsvListado.Columns[1].Width = 150;
			lsvListado.Columns[2].Width = 150;
			lsvListado.Columns[3].Width = 100;
			lsvListado.Columns[4].Width = 100;
			lsvListado.FullRowSelect = true;
		}

		private void btnTotal_Click(object sender, EventArgs e)
		{
			int total = 0;
			for (int i = 0; i < lsvListado.Items.Count; i++)
			{
				total += int.Parse(lsvListado.Items[i].SubItems[3].Text);
			}
			lblTotal.Text = "$" + total.ToString();
		}

		private void btnReset_Click(object sender, EventArgs e)
		{
			lblTotal.Text = "$0";
			lblMayor.Text = "$0";
		}

		private void button1_Click(object sender, EventArgs e)
		{
			int Mayor = int.Parse(lsvListado.Items[0].SubItems[3].Text);
			for (int i = 1; i < lsvListado.Items.Count; i++)
			{
				if (Mayor < int.Parse(lsvListado.Items[i].SubItems[3].Text))
				{
					Mayor = int.Parse(lsvListado.Items[i].SubItems[3].Text);
				}
			}
			lblMayor.Text = "$" + Mayor.ToString();
		}

		private void label1_Click(object sender, EventArgs e)
		{

		}

		private void btnSubmit_Click(object sender, EventArgs e)
		{
			if (ValidacionData() == true)
			{
				lsvListado.Items.Add()
			}

		}

		private bool ValidacionData()
		{
			int nro;
			int cuota;
			if (int.TryParse(txtNro.Text, out nro) || txtApellido.Text != String.Empty || txtNombre.Text != String.Empty || int.TryParse(txtCuota.Text, out cuota))
			{
				return true;
			}
			return false;
		}
	}
}
