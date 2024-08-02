using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Ej8_26_4_2024
{
	public partial class frmUbicaciones : Form
	{
		public frmUbicaciones()
		{
			InitializeComponent();
		}

		private void frmUbicaciones_Load(object sender, EventArgs e)
		{
			this.CenterToScreen();
			
			FileStream Archivo = new FileStream("ubicaciones.txt",FileMode.Open);
			StreamReader reader = new StreamReader(Archivo);
			while (!reader.EndOfStream)
			{
				cmbUbicaciones.Items.Add(reader.ReadLine());
			}
			reader.Close();
			Archivo.Close();

			lsvData.View = View.Details;
			lsvData.Columns.Add("Descripción");
			lsvData.Columns.Add("Categoría");
			lsvData.Columns.Add("Ubicación");
			lsvData.Columns.Add("Disponibilidad");

			lsvData.Columns[0].Width = 100;
			lsvData.Columns[1].Width = 100;
			lsvData.Columns[2].Width = 100;
			lsvData.Columns[3].Width = 100;

			lsvData.FullRowSelect = true;

			cmbUbicaciones.SelectedIndex = 0;
		}

		private void cmbUbicaciones_SelectedIndexChanged(object sender, EventArgs e)
		{
			lsvData.Items.Clear();

			FileStream Archivo = new FileStream("inventario.txt", FileMode.Open);
			StreamReader Leer = new StreamReader(Archivo);

			while (!Leer.EndOfStream)
			{
				string[] Item = Leer.ReadLine().Split(';');
				if (Item[2] == cmbUbicaciones.SelectedItem.ToString())
				{
					lsvData.Items.Add(Item[0]);
					lsvData.Items[lsvData.Items.Count - 1].SubItems.Add(Item[1]);
					lsvData.Items[lsvData.Items.Count - 1].SubItems.Add(Item[2]);
					if (Item[3] == "True")
					{
						lsvData.Items[lsvData.Items.Count - 1].SubItems.Add("Si");
					}
					else
					{
						lsvData.Items[lsvData.Items.Count - 1].SubItems.Add("No");
					}

				}
			}

			Leer.Close();
			Archivo.Close();
		}

		private void btnExportar_Click(object sender, EventArgs e)
		{
			sfd.AddExtension = true;
			sfd.Filter = "Archivo de texto|*.txt|Archivo de Excel|*.csv";
			sfd.OverwritePrompt = true;
			sfd.FilterIndex = 0;
			sfd.Title = "Exportar como";
			sfd.FileName = "*.txt";

			if (sfd.ShowDialog() == DialogResult.OK)
			{
				FileStream Archivo = new FileStream(sfd.FileName, FileMode.Create);
				StreamWriter Escribir = new StreamWriter(Archivo);
				
				foreach (ListViewItem item in lsvData.Items)
				{
					Escribir.WriteLine($"{item.SubItems[0].Text};{item.SubItems[1].Text};{item.SubItems[2].Text};{item.SubItems[3].Text}");
				}

				Escribir.Close();
				Archivo.Close();
			}

		}
	}
}
