using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Ej3_22_3_2024
{
	public partial class frmEjercicio3 : Form
	{
		public frmEjercicio3()
		{
			InitializeComponent();
		}

		private void btnProcesar_Click(object sender, EventArgs e)
		{
			string tecnologias = "Tecnologías:\n";
			string tipoVeh = "Sedan";

			if (chkABS.Checked )
			{
				tecnologias += "-ABS\n";
			}
			if (chkCierre.Checked)
			{
				tecnologias += "-Cierre Centralizado\n";
			}
			if (chkGPS.Checked)
			{
				tecnologias += "-GPS\n";
			}

			if (!rbSedan.Checked)
			{
				if (rbHatchBack.Checked)
				{
					tipoVeh = "HatchBack";
				}
				else
				{
					tipoVeh = "SUV";
				}
			}

			lblSeleccion.Text = $"Marca: {cmbMarca.Text}\n\n{tecnologias}\n{tipoVeh}";
		}

		private void frmEjercicio3_Load(object sender, EventArgs e)
		{
			this.CenterToScreen();
			rbSedan.Checked = true;
			cmbMarca.Items.Add("Ford");
			cmbMarca.Items.Add("Fiat");
			cmbMarca.Items.Add("BMW");
			cmbMarca.Items.Add("Volkswagen");

			cmbMarca.DropDownStyle = ComboBoxStyle.DropDownList;
			cmbMarca.SelectedIndex = 0;
		}

		private void cmbMarca_SelectedIndexChanged(object sender, EventArgs e)
		{

		}

		private void lblSeleccion_Click(object sender, EventArgs e)
		{

		}

		private void frmEjercicio3_FormClosed(object sender, FormClosedEventArgs e)
		{
			Application.Exit();
		}
	}
}
