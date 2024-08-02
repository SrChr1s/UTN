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
	public partial class frmPrincipal : Form
	{
		public frmPrincipal()
		{
			InitializeComponent();
		}

		private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
		{

		}

		private void toolStripMenuItem1_Click(object sender, EventArgs e)
		{

		}

		private void mnuHabilitacion_Click(object sender, EventArgs e)
		{
			frmHabilitacion frm = new frmHabilitacion();
			frm.ShowDialog();
		}

		private void frmPrincipal_Load(object sender, EventArgs e)
		{
			this.CenterToScreen();
		}

		private void visualizacionToolStripMenuItem_Click(object sender, EventArgs e)
		{
			frmVisualizar frm = new frmVisualizar();
			frm.ShowDialog();
		}

		private void mnuSalir_Click(object sender, EventArgs e)
		{
			Application.Exit();
		}
	}
}
