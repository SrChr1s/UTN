using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Ej6_19_4_2024
{
	public partial class frmEjercicio6 : Form
	{
		public frmEjercicio6()
		{
			InitializeComponent();
		}

		private void btnRegistrar_Click(object sender, EventArgs e)
		{
			int DniRepetido = 0;
			if (txtRegistro.Text.Trim() != String.Empty)
			{
				if (Regex.IsMatch(txtRegistro.Text.Trim(), @"^\d+$"))
				{
					FileStream Archivo = new FileStream("registros.txt", FileMode.Open);
					StreamReader Leer = new StreamReader(Archivo);
					while (!Leer.EndOfStream)
					{
						if (Leer.ReadLine() == txtRegistro.Text.Trim())
						{
							DniRepetido++;
						}
					}
					Leer.Close();
					Archivo.Close();
				}
			}

			if (DniRepetido != 0)
			{
				MessageBox.Show("DNI Repetido!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
			}
			else
			{
				sfd.AddExtension = true;
				sfd.Filter = "Archivo de texto|*.txt|Archivo de Backup|*.bkp";
				sfd.OverwritePrompt = true;
				sfd.FilterIndex = 0;
				sfd.Title = "Seleccione archivo a grabar";
				sfd.FileName = "*.txt";

				if (sfd.ShowDialog() == DialogResult.OK)
				{
					FileStream Archivo = new FileStream(sfd.FileName, FileMode.Open);
					StreamWriter Escribir = new StreamWriter(Archivo);
					Escribir.WriteLine(txtRegistro.Text);
					Escribir.Close();
					Archivo.Close();
					txtRegistro.Text = String.Empty;
					MessageBox.Show("Registro guardado con exito!", "Atencion", MessageBoxButtons.OK, MessageBoxIcon.Information);
				}
			}
		}

		private void btnRecuperar_Click(object sender, EventArgs e)
		{
			ofd.Title = "Seleccione el archivo a abrir";
			ofd.Filter = "Archivo de Texto|*.txt|Archivo de Backup|*.bkp";
			ofd.FilterIndex = 0;
			ofd.FileName = String.Empty;
			ofd.CheckFileExists = true;

			if (ofd.ShowDialog() == DialogResult.OK)
			{
				FileStream Archivo = new FileStream(ofd.FileName, FileMode.Open);
				StreamReader Leer = new StreamReader(Archivo);
				while (!Leer.EndOfStream)
				{
					txtRecuperar.Text += Leer.ReadLine() + Environment.NewLine;
				}
				Leer.Close();
				Archivo.Close();
			}
		}
	}
}
