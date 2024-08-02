using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Programacion3_20_3_2024
{
	public partial class FrmEjer1 : Form
	{
		public FrmEjer1()
		{
			InitializeComponent();
		}

		private void Form1_Load(object sender, EventArgs e)
		{
			this.CenterToScreen();
		}

		private void lblCopia_Click(object sender, EventArgs e)
		{

		}

		private void btnCopiar_Click(object sender, EventArgs e)
		{
			if (txtApellido.Text.Trim() != String.Empty)
			{
                lblCopia.Text = txtApellido.Text;
            }
			else
			{
				MessageBox.Show("No se permite copiar cadenas vacias","Error",MessageBoxButtons.OK,MessageBoxIcon.Error);			
			}
		}

		private void btnBorrar_Click(object sender, EventArgs e)
		{
            //txtApellido.Text = "";
            //txtApellido.Text = String.Empty;
            txtApellido.Clear();
		}
	}
}
