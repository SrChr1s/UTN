using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace JuegoMemoria
{
	public partial class frmMenu : Form
	{
		public frmMenu()
		{
			InitializeComponent();
		}

		private void btnNewGame_Click(object sender, EventArgs e)
		{
			frmJuegoMemoria Juego = new frmJuegoMemoria();
			Juego.Show();
			this.Close();
		}

		private void frmMenu_Load(object sender, EventArgs e)
		{
			this.CenterToScreen();
		}

		private void btnSalir_Click(object sender, EventArgs e)
		{
			Application.Exit();
		}
	}
}
