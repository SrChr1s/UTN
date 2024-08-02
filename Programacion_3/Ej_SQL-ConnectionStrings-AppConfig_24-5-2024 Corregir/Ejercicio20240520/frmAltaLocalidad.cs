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
	public partial class frmAltaLocalidad : Form
	{
        private int _idLocalidadSelec;

        public int IdLocalidadSelec
        {
            get { return _idLocalidadSelec; }
            set { _idLocalidadSelec = value; }
        }
        public frmAltaLocalidad()
		{
			InitializeComponent();
		}

		private void frmEjercicio8_Load(object sender, EventArgs e)
		{
			this.CenterToScreen();
            if (this.IdLocalidadSelec != 0)
            {
                DataTable tabla = new DataTable();
                tabla = Libreria.Recuperar($"select * from localidades where idlocalidad = {this.IdLocalidadSelec}");
                txtLocalidad.Text = tabla.Rows[0]["Localidad"].ToString();
				txtCodigoPostal.Text = tabla.Rows[0]["CodigoPostal"].ToString();
            }
        }

		private void btnRegistrar_Click(object sender, EventArgs e)
		{
			if (ValidarVacios(txtCodigoPostal))
			{
				if (ValidarVacios(txtLocalidad))
				{
					int localidadRepetida = Libreria.LocalidadRepetida(int.Parse(txtCodigoPostal.Text));

					if (localidadRepetida >= 1)
					{
						MessageBox.Show("Está intentando ingresar o modificar una Localidad con codigo postal repetido!", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Warning);
					}
					else
					{
                        try
                        {
                            string sql = $"insert into Localidades (localidad, codigopostal) values ('{txtLocalidad.Text.Trim()}', '{txtCodigoPostal.Text.Trim()}')";

                            Libreria.Ejecutar(sql);
                            MessageBox.Show("La localidad ha sido registrada correctamente!", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);

                            txtCodigoPostal.Clear();
                            txtLocalidad.Clear();

                            this.Close();
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show(ex.Message, "Atención", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
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
