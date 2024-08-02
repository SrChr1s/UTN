using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms.VisualStyles;

namespace Ej2_20_3_2024
{
	public partial class FrmEjercicio2 : Form
	{
		public FrmEjercicio2()
		{
			InitializeComponent();
		}

		private void rbNativo_CheckedChanged(object sender, EventArgs e)
		{
			
		}

		private void FrmEjercicio2_Load(object sender, EventArgs e)
		{
			this.CenterToScreen();
			rbArg.Checked = true;
		}

		private void btnRegistrar_Click(object sender, EventArgs e)
		{
			if (txtApellido.Text.Trim() != String.Empty && txtApellido.Text.Trim().Length >= 10)
			{
				string rangoEdad = "Menor";
				string nacionalidad = "Argentino";

				if (chkAdulto.Checked == true)
				{
					rangoEdad = "Adulto";
				}
				if (!rbArg.Checked)
				{
					if (rbVzlno.Checked)
					{
						nacionalidad = "Venezolano";
					}
					else if (rbBrazil.Checked)
					{
						nacionalidad = "Brasileño";
					}
					else
					{
						nacionalidad = "Peruano";
					}
				}
				MessageBox.Show($"Sr/a. {txtApellido.Text}\nUd. Seleccionó:\n{rangoEdad}\n{nacionalidad}", "Datos", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
			else
			{
				MessageBox.Show("Datos Faltantes o Erroneos","Error",MessageBoxButtons.OK,MessageBoxIcon.Error);
			}
		}

		private void txtApellido_TextChanged(object sender, EventArgs e)
		{

		}

		private void rbVzlno_CheckedChanged(object sender, EventArgs e)
		{

		}
	}
}
