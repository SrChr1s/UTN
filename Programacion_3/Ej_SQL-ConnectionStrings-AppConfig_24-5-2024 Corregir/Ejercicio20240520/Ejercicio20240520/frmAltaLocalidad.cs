using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Ejercicio20240520
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
		}

		private void btnRegistrar_Click(object sender, EventArgs e)
		{
            // Verifico que el TextBox de Codigo Postal no esté vacío llamando a la función ValidarVacios()
			if (ValidarVacios(txtCodigoPostal))
			{
                // De no estarlo hago lo mismo pero para el TextBox de Localidad
				if (ValidarVacios(txtLocalidad))
				{
                    // Intento realizar la conexión con la base de datos
                    try
                    {
                        // Realizo la conexión con la base de datos
                        
                        string sql = $"insert into Localidades (localidad, codigopostal) values ('{txtLocalidad.Text.Trim()}', '{txtCodigoPostal.Text.Trim()}')";

                        Libreria.Ejecutar(sql);

                        // Muestro por pantalla que la localidad fue registrada de manera exitosa
                        MessageBox.Show("La localidad ha sido registrada correctamente!", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        // Limpio los TextBox para comodidad de realizar un nuevo registro
                        txtCodigoPostal.Clear();
                        txtLocalidad.Clear();

						this.Close();
                    }
                    catch (Exception ex)
                    {
                        // Si de casualidad ocurre un error lo aviso mediante un messagebox en el que muestro la excepción que me proporciona SQLSERVER
                        MessageBox.Show(ex.Message, "Atención", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
					
                }
				else
				{
					MessageBox.Show("El campo Localidad se encuentra vacío!", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Warning);
				}
			}
			else
			{
				MessageBox.Show("El campo Codigo Postal se encuentra vacío!", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Warning);
			}
		}

		private bool ValidarVacios(TextBox txtBox)
		{
			if (txtBox.Text.Trim() != String.Empty)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}
}
