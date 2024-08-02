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
	public partial class frmEjercicio4 : Form
	{
		public frmEjercicio4()
		{
			InitializeComponent();
		}

		private void btnAgregar_Click(object sender, EventArgs e)
		{
			if (txtUno.Text.Trim() == String.Empty)
			{
				MessageBox.Show("No se pueden agregar opciones vacías","Error",MessageBoxButtons.OK,MessageBoxIcon.Error);
				txtUno.Clear();
			}
			else if (cmbOpciones.Items.Contains(txtUno.Text.Trim()))
			{
				MessageBox.Show("No se pueden agregar opciones repetidas", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
				txtUno.Clear();
			}
			else
			{
				cmbOpciones.Items.Add(txtUno.Text);
				txtUno.Clear();
			}
		}

		private void frmEjercicio4_Load(object sender, EventArgs e)
		{
			this.CenterToScreen();
			//txtUno.MaxLength = 10;
			cmbOpciones.DropDownStyle = ComboBoxStyle.DropDownList;
		}

		private void frmEjercicio4_FormClosed(object sender, FormClosedEventArgs e)
		{
			Application.Exit();
		}
	}
}
