using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Ejercicio5_27_3_2024
{
	public partial class frmHabilitacion : Form
	{
		public frmHabilitacion()
		{
			InitializeComponent();
		}

		private void btnAccion_Click(object sender, EventArgs e)
		{
			if (txtFrase.Enabled)
			{
				txtFrase.Enabled = false;
				btnAccion.Text = "Habilitar";
			}
			else
			{
				txtFrase.Enabled = true;
				btnAccion.Text = "Deshabilitar";
			}
		}

		private void frmHabilitacion_Load(object sender, EventArgs e)
		{
			this.CenterToScreen();
		}
	}
}
