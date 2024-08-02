using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Ej7_24_4_2024
{
	public partial class frmEjercicio7 : Form
	{
		public frmEjercicio7()
		{
			InitializeComponent();
		}

		private void btnRegistrar_Click(object sender, EventArgs e)
		{
			if (mskTxtPatente.MaskCompleted)
			{
				if (txtPropietario.Text.Trim() != String.Empty)
				{
					if (!Regex.IsMatch(txtPropietario.Text, @"^\d+$"))
					{
						sfd.AddExtension = true;
						sfd.Filter = "Archivo de texto|*.txt|Archivo de Excel CSV|*.csv";
						sfd.OverwritePrompt = true;
						sfd.FilterIndex = 0;
						sfd.Title = "Seleccione el archivo a grabar";
						sfd.FileName = "*.txt";

						if (sfd.ShowDialog() == DialogResult.OK)
						{
							FileStream Archivo = new FileStream(sfd.FileName, FileMode.Append);
							StreamWriter Escribir = new StreamWriter(Archivo);
							Escribir.WriteLine($"{mskTxtPatente.Text.ToUpper()};{txtPropietario.Text.Trim()};{chkVendido.Checked}");
							Escribir.Close();
							Archivo.Close();

							txtPropietario.Text = String.Empty;
							mskTxtPatente.Text = String.Empty;

							MessageBox.Show("Registro guardado con exito!", "Atencion", MessageBoxButtons.OK, MessageBoxIcon.Information);
						}
					}
					else
					{
						MessageBox.Show("Propietario debe contener solo caracteres alfabéticos", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
					}
				}
				else
				{
					MessageBox.Show("Propietario está VACÍO", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
				}
			}
			else
			{
				MessageBox.Show("Falta de Caracteres en la PATENTE", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
			}
		}
	}
}
