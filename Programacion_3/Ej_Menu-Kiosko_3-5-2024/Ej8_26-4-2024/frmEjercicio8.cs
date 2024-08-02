using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Ej8_26_4_2024
{
	public partial class frmEjercicio8 : Form
	{
		public frmEjercicio8()
		{
			InitializeComponent();
		}

		private void frmEjercicio8_Load(object sender, EventArgs e)
		{
			this.CenterToScreen();

			cmbCategoria.Items.Add("Verduras");
			cmbCategoria.Items.Add("Frutas");
			cmbCategoria.Items.Add("Lácteos");
			cmbCategoria.Items.Add("Carnes");
			cmbCategoria.Items.Add("Limpieza");

			cmbCategoria.SelectedIndex = 0;

			rBtnGondola.Checked = true;
		}

		private void btnRegistrar_Click(object sender, EventArgs e)
		{
			if (txtVacio(txtDescripcion))
			{
				sfd.AddExtension = true;
				sfd.Filter = "Archivo de texto|*.txt";
				sfd.OverwritePrompt = true;
				sfd.FilterIndex = 0;
				sfd.Title = "Seleccione el archivo a grabar";
				sfd.FileName = "*.txt";

				string Ubicacion = "";

				if (rBtnGondola.Checked)
				{
					Ubicacion = rBtnGondola.Text;
				}
				else if (rBtnRefrigerador.Checked)
				{
					Ubicacion = rBtnRefrigerador.Text;
				}
				else
				{
					Ubicacion = rBtnDeposito.Text;
				}
				
				if (sfd.ShowDialog() == DialogResult.OK)
				{
					FileStream Archivo = new FileStream(sfd.FileName, FileMode.Append);
					StreamWriter Escribir = new StreamWriter(Archivo);

					Escribir.WriteLine($"{txtDescripcion.Text.Trim()};{cmbCategoria.Text};{Ubicacion};{chkDisponible.Checked}");

					Escribir.Close();
					Archivo.Close();

					MessageBox.Show("Registro guardado con exito!", "Atencion", MessageBoxButtons.OK, MessageBoxIcon.Information);

					txtDescripcion.Text = String.Empty;
					cmbCategoria.SelectedIndex = 0;
					rBtnGondola.Checked = true;
					chkDisponible.Checked = false;
				}
			}
			else
			{
				MessageBox.Show("El campo Descripcion se encuentra vacío!", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Warning);
			}
		}

		private bool txtVacio(TextBox textBox)
		{
			if (textBox.Text.Trim() != String.Empty)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		private void btnCalcular_Click(object sender, EventArgs e)
		{
			ofd.Title = "Seleccione el archivo a abrir";
			ofd.Filter = "Archivo de Texto|*.txt";
			ofd.FilterIndex = 0;
			ofd.FileName = "*.txt";
			ofd.CheckFileExists = true;

			if (ofd.ShowDialog() == DialogResult.OK)
			{
				FileStream Archivo = new FileStream(ofd.FileName, FileMode.Open);
				StreamReader Leer = new StreamReader(Archivo);

				int i = 0;
				while (!Leer.EndOfStream)
				{
					if (Leer.ReadLine().Split(';')[2] == "Góndola")
					{
						i++;
					}
				}

				Leer.Close();
				Archivo.Close();

				lblTotal.Text = i.ToString();
			}
		}
	}
}
