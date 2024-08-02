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
	public partial class Winner : Form
	{
		public Winner()
		{
			InitializeComponent();
		}

		private void btnSave_Click(object sender, EventArgs e)
		{
			if (txtName.Text.Trim() != String.Empty)
			{
				return txtName.Text.Trim();
			}
			else
			{

			}
		}
	}
}
