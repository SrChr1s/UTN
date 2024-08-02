using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Ejercicio4_27_3_2024
{
	public partial class frmPresentacion : Form
	{
		public frmPresentacion()
		{
			InitializeComponent();
		}

		private void label1_Click(object sender, EventArgs e)
		{

		}

		private void timer1_Tick(object sender, EventArgs e)
		{
			timer1.Stop();
			this.Hide();
			frmEjercicio4 frm = new frmEjercicio4();
			frm.Show();
		}

		private void frmPresentacion_Load(object sender, EventArgs e)
		{
			this.CenterToScreen();
			timer1.Interval = 2000;
			timer1.Start();
		}
	}
}
