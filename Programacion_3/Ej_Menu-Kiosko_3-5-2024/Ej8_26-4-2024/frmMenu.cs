using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Ej8_26_4_2024
{
	public partial class frmMenu : Form
	{
		public frmMenu()
		{
			InitializeComponent();
		}

		private void frmMenu_Load(object sender, EventArgs e)
		{
			this.CenterToScreen();
		}

		private void mItemInventario_Click(object sender, EventArgs e)
		{
			frmEjercicio8 frmInventario = new frmEjercicio8();
			frmInventario.Show();
		}

		private void mItemUbicaciones_Click(object sender, EventArgs e)
		{
			frmUbicaciones frmUbicaciones = new frmUbicaciones();
			frmUbicaciones.Show();
		}
	}
}
