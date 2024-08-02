using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Ejercicio5_17_04_2024
{
	public partial class frmEjercicio5 : Form
	{
		public frmEjercicio5()
		{
			InitializeComponent();
		}

		private void label1_Click(object sender, EventArgs e)
		{

		}

		private void frmEjercicio5_Load(object sender, EventArgs e)
		{
			this.CenterToScreen();

			dtpFecNac.MaxDate = DateTime.Today;

			cmbEstCivil.Items.Add("Soltero/a");
			cmbEstCivil.Items.Add("Casado/a");
			cmbEstCivil.Items.Add("Viudo/a");
			cmbEstCivil.SelectedIndex = 0;

			rbtnActivo.Checked = true;

			lsvRegistros.View = View.Details;

			lsvRegistros.Columns.Add("DNI");
			lsvRegistros.Columns.Add("Apellido");
			lsvRegistros.Columns.Add("Nombre");
			lsvRegistros.Columns.Add("Cant. de Hijos");
			lsvRegistros.Columns.Add("Estado Civil");
			lsvRegistros.Columns.Add("Fecha de Nacimiento");
			lsvRegistros.Columns.Add("Estado");
			lsvRegistros.Columns.Add("Revision Medica");

			lsvRegistros.Columns[0].Width = 65;
			lsvRegistros.Columns[1].Width = 120;
			lsvRegistros.Columns[2].Width = 120;
			lsvRegistros.Columns[3].Width = 95;
			lsvRegistros.Columns[4].Width = 85;
			lsvRegistros.Columns[5].Width = 115;
			lsvRegistros.Columns[6].Width = 75;
			lsvRegistros.Columns[7].Width = 115;

			lsvRegistros.FullRowSelect = true;
		}

		private void btnRegistrar_Click(object sender, EventArgs e)
		{
			bool dniRepetido = false;

			foreach (ListViewItem item in lsvRegistros.Items)
			{
				if (item.SubItems[0].Text.Trim() == txtDNI.Text.Trim())
				{
					dniRepetido = true;
				}
			}

			if (dniRepetido)
			{
				MessageBox.Show("El DNI de la persona que intenta registrar está repetido!", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
			}
			else
			{
				if (txtDNI.Text.Trim() != String.Empty)
				{
					if (Regex.IsMatch(txtDNI.Text.Trim(), @"^\d+$"))
					{
						if (txtApellido.Text.Trim() != String.Empty)
						{
							if (!txtApellido.Text.Trim().Any(char.IsDigit))
							{
								if (txtNombre.Text.Trim() != String.Empty)
								{
									if (!txtNombre.Text.Trim().Any(char.IsDigit))
									{
										if (txtCantHijos.Text.Trim() != String.Empty)
										{
											if (Regex.IsMatch(txtCantHijos.Text.Trim(), @"^\d+$"))
											{
												lsvRegistros.Items.Add(txtDNI.Text);
												lsvRegistros.Items[lsvRegistros.Items.Count - 1].SubItems.Add(txtApellido.Text);
												lsvRegistros.Items[lsvRegistros.Items.Count - 1].SubItems.Add(txtNombre.Text);
												lsvRegistros.Items[lsvRegistros.Items.Count - 1].SubItems.Add(txtCantHijos.Text);
												lsvRegistros.Items[lsvRegistros.Items.Count - 1].SubItems.Add(cmbEstCivil.Text);
												lsvRegistros.Items[lsvRegistros.Items.Count - 1].SubItems.Add(dtpFecNac.Value.ToShortDateString());

												if (rbtnActivo.Checked)
												{
													lsvRegistros.Items[lsvRegistros.Items.Count - 1].SubItems.Add(rbtnActivo.Text);
												}
												else if (rbtnDeshabilitado.Checked)
												{
													lsvRegistros.Items[lsvRegistros.Items.Count - 1].SubItems.Add(rbtnDeshabilitado.Text);
												}
												else
												{
													lsvRegistros.Items[lsvRegistros.Items.Count - 1].SubItems.Add(rbtnBloqueado.Text);
												}

												if (chkRevision.Checked)
												{
													lsvRegistros.Items[lsvRegistros.Items.Count - 1].SubItems.Add("SI");
												}
												else
												{
													lsvRegistros.Items[lsvRegistros.Items.Count - 1].SubItems.Add("NO");
												}

												txtDNI.Text = String.Empty;
												txtApellido.Text = String.Empty;
												txtNombre.Text = String.Empty;
												txtCantHijos.Text = String.Empty;
												cmbEstCivil.Text = "Soltero/a";
												dtpFecNac.Value = DateTime.Today;
												rbtnActivo.Checked = true;
												chkRevision.Checked = false;
											}
											else
											{
												MessageBox.Show("El campo Cantidad de Hijos debe contener caracteres únicamente númericos!", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
											}
										}
										else
										{
											MessageBox.Show("El campo Cantidad de Hijos se encuentra vacío!", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
										}
									}
									else
									{
										MessageBox.Show("El campo Nombre debe contener caracteres únicamente alfabéticos!", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
									}
								}
								else
								{
									MessageBox.Show("El campo Nombre se encuentra vacío!", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
								}
							}
							else
							{
								MessageBox.Show("El campo Apellido debe contener caracteres únicamente alfabéticos!", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
							}
						}
						else
						{
							MessageBox.Show("El campo Apellido se encuentra vacío!", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
						}
					}
					else
					{
						MessageBox.Show("El campo DNI debe contener únicamente caracteres numéricos!", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
					}
				}
				else
				{
					MessageBox.Show("El campo DNI se encuentra vacío!", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
				}
			}
		}
	}
}
