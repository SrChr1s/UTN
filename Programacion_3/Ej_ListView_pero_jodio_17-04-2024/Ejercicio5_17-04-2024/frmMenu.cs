using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Ejercicio5_17_04_2024
{
	public partial class frmMenu : Form
	{
		public frmMenu()
		{
			InitializeComponent();
		}

		private void registrosToolStripMenuItem_Click(object sender, EventArgs e)
		{
			frmEjercicio5 frm = new frmEjercicio5();
			frm.Show();
		}

		private void frmMenu_Load(object sender, EventArgs e)
		{
			this.CenterToScreen();
		}

		private void salirToolStripMenuItem_Click(object sender, EventArgs e)
		{
			Application.Exit();
		}

		private void frmMenu_FormClosing(object sender, FormClosingEventArgs e)
		{
			Application.Exit();
		}
	}
}
