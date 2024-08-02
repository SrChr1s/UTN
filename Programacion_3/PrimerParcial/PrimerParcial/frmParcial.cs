using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PrimerParcial
{
    public partial class frmParcial : Form
    {
        public frmParcial()
        {
            InitializeComponent();
        }

        private void frmParcial_Load(object sender, EventArgs e)
        {
            this.CenterToScreen();

            dtpFechaFacturada.MaxDate = DateTime.Today;

            for (int i = 0; i < 12; i++)
            {
                cmbHorasTrabajadas.Items.Add(i+1);
            }

            cmbHorasTrabajadas.SelectedIndex = 0;
        }

        private void btnRegistrar_Click(object sender, EventArgs e)
        {
            if (Validaciones())
            {
                FileStream Archivo = new FileStream("Facturaciones.csv", FileMode.Append);
                StreamWriter Writer = new StreamWriter(Archivo);

                string Trabajos = "";

                TrabajosRealizados(ref Trabajos);

                Writer.WriteLine($"{mskBoxLegajo.Text.Trim().ToUpper()};{txtEmpleado.Text.Trim().ToUpper()};{dtpFechaFacturada.Value.ToShortDateString()};{cmbHorasTrabajadas.Text};{txtImporte.Text.Trim()};{Trabajos.Substring(0, Trabajos.Length - 1).ToUpper()}");

                Writer.Close();

                Archivo.Close();

                MessageBox.Show("La Facturación ha sido registrada con éxito", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);

                mskBoxLegajo.Text = String.Empty;
                txtEmpleado.Text = String.Empty;
                dtpFechaFacturada.Value = DateTime.Today;
                cmbHorasTrabajadas.SelectedIndex = 0;
                txtImporte.Text = String.Empty;

                foreach (CheckBox item in gboxTrabajos.Controls)
                {
                    item.Checked = false;
                }
            }
            
        }

        private bool Validaciones()
        {
            if (!mskBoxLegajo.MaskFull)
            {
                MessageBox.Show("El campo Legajo está incompleto!", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            else
            {
                if (txtEmpleado.Text.Trim() == String.Empty)
                {
                    MessageBox.Show("El campo Empleado está vacío!", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return false;
                }
                else
                {
                    if (!Regex.IsMatch(txtImporte.Text.Trim(), "^\\d+$") || txtImporte.Text.Trim() == String.Empty)
                    {
                        MessageBox.Show("El campo Importe debe ser númerico y positivo!", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return false;
                    }
                    else
                    {
                        if (int.Parse(txtImporte.Text.Trim()) <= 0)
                        {
                            MessageBox.Show("El campo Importe debe ser mayor a cero!", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            return false;
                        }
                        else 
                        {
                            int cantTrabajos = 0;
                            foreach (CheckBox item in gboxTrabajos.Controls)
                            {
                                if (item.Checked)
                                {
                                    cantTrabajos++;
                                }
                            }

                            if (cantTrabajos == 0)
                            {
                                MessageBox.Show("Debe haber realizado al menos un trabajo!", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                                return false;
                            }
                            else
                            {
                                if (chkExtraccionArbol.Checked && cmbHorasTrabajadas.SelectedIndex < 2)
                                {
                                    MessageBox.Show("Las horas trabajadas no pueden ser menos de 3 si se realizó la extracción de un árbol", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                                    cmbHorasTrabajadas.SelectedIndex = 2;
                                    return false;
                                }
                                else
                                {
                                    return true;
                                }
                            }
                        }
                    }
                }
            }
        }

        private void TrabajosRealizados(ref string Trabajos)
        {
            foreach (CheckBox item in gboxTrabajos.Controls)
            {
                if (item.Checked)
                {
                    Trabajos += $"{item.Tag};";
                }
            }
        }

        private void frmParcial_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }
    }
}
