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

namespace Ej8_8_5_2024
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
			if (ValidarVacios(txtCodigoPostal))
			{
				if (ValidarVacios(txtLocalidad))
				{
                    try
                    {
                        SqlConnection conexion = new SqlConnection();
                        conexion.ConnectionString = "Data Source=LAB205\\SQLEXPRESS;Initial Catalog=Inmobiliaria2;Persist Security Info=True;User ID=UserCreator;Password=UserCreator";
                        conexion.Open();

                        SqlCommand comando = new SqlCommand();
                        comando.Connection = conexion;
                        comando.CommandType = CommandType.Text;
                        comando.CommandText = $"insert into Localidades (localidad, codigopostal) values ('{txtLocalidad.Text.Trim()}', '{txtCodigoPostal.Text.Trim()}')";
                        comando.ExecuteNonQuery();

                        conexion.Close();

                        MessageBox.Show("La localidad ha sido registrada correctamente!", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        txtCodigoPostal.Clear();
                        txtLocalidad.Clear();
                    }
                    catch (Exception ex)
                    {

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
