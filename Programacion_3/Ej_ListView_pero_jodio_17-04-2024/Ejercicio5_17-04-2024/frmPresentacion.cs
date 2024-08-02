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
	public partial class frmPresentacion : Form
	{
		public frmPresentacion()
		{
			InitializeComponent();
		}

		private void frmPresentacion_Load(object sender, EventArgs e)
		{
			this.CenterToScreen();
			timer1.Interval = 1500;
			timer1.Start();
		}

		private void timer1_Tick(object sender, EventArgs e)
		{
			timer1.Stop();
			this.Hide();
			frmMenu frm = new frmMenu();
			frm.Show();
		}
	}
}
