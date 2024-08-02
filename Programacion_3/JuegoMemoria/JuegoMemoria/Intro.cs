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
	public partial class frmIntro : Form
	{
		public frmIntro()
		{
			InitializeComponent();
		}

		private void frmIntro_Load(object sender, EventArgs e)
		{
			this.CenterToScreen();
			timerIntro.Interval = 2000;
			timerIntro.Start();
		}

		private void timerIntro_Tick(object sender, EventArgs e)
		{
			timerIntro.Stop();
			frmMenu MenuJuego = new frmMenu();
			MenuJuego.Show();
			this.Close();
		}
	}
}
