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
using System.Text.RegularExpressions;

namespace Ejercicio20240520
{
    public partial class frmAltaCliente : Form
    {
        public frmAltaCliente()
        {
            InitializeComponent();
        }

        private void frmAltaClientes_Load(object sender, EventArgs e)
        {
            this.CenterToScreen();

            // Realizo la conexión con la base de datos
            SqlConnection conexion = new SqlConnection();
            // Conexion Casa
            //conexion.ConnectionString = "Data Source=DESKTOP-EGIGA8N\\SQLEXPRESS;Initial Catalog=Inmobiliaria;Integrated Security=True";

            // Conexion Labo 2
            conexion.ConnectionString = "Data Source=LAB205\\SQLEXPRESS;Initial Catalog=Inmobiliaria2;Persist Security Info=True;User ID=UserCreator;Password=UserCreator";

            // Conexion Labo Arriba
            //conexion.ConnectionString = "Data Source=localhost\\SQLEXPRESS01;Initial Catalog=Inmobiliariaa;Persist Security Info=True;User ID=UserCreator;Password=UserCreator";
            conexion.Open();

            // Creo una instancia de SqlCommand para hacer el manejo de las instrucciones sql
            SqlCommand comando = new SqlCommand();
            comando.Connection = conexion;
            comando.CommandType = CommandType.Text;

            // Hago el primer select para los tipos de documentos
			comando.CommandText = $"select * from TiposDocs";

            // Creo una instancia de SqlDataReader para la lectura de los datos en la bbdd
            SqlDataReader lector = comando.ExecuteReader();

            // Creo un DataTable para almacenar los datos que me devuelva el select de los tipos de documentos
			DataTable dtTipoDoc = new DataTable();

            // Cargo los datos de la bbdd en el DataTable
            dtTipoDoc.Load(lector);

			// Hago el segundo select, esta vez para las localidades
			comando.CommandText = $"select * from Localidades";
			lector = comando.ExecuteReader();

			// Creo un DataTable para almacenar los datos que me devuelva el select de las localidades
			DataTable dtLocalidades = new DataTable();

			// Cargo los datos de la bbdd en el DataTable
			dtLocalidades.Load(lector);

            // Cierro la conexion tanto con el lector como con la conexion persé a la bbdd
			lector.Close();
            conexion.Close();

            // Especifico la fuente de información de la que obtendrá datos el combobox
            cmbTipoDoc.DataSource = dtTipoDoc;

            // Establezco el "miembro valor" por el que se va a regir el combo box, esto estaría asociado con el indice y con la id de los datos
			cmbTipoDoc.ValueMember = "IdTipoDoc";

			// Establezco el "miembro de vista" que son los elementos que mostrará a nivel usuario el combobox, esto sería la descripción de cada registro
			cmbTipoDoc.DisplayMember = "TipoDoc";

            // Determino como elemento preseleccionado al que se encuentra en el indice 0
            cmbTipoDoc.SelectedIndex = 0;

            // Hago lo mismo que antes pero para las localidades
			cmbLocalidad.DataSource = dtLocalidades;
			cmbLocalidad.ValueMember = "IdLocalidad";
			cmbLocalidad.DisplayMember = "Localidad";
			cmbLocalidad.SelectedIndex = 0;

            // Agrego al ComboBox de Estado (Activo) los dos valores representativos del bit (1 o 0) y determino como elemento preseleccionado al que se encuentra en el indice 0
            cmbActivo.Items.Add("No");
            cmbActivo.Items.Add("Si");
            cmbActivo.SelectedIndex = 1;

            // Defino hoy como fecha maxima del datetimepicker
            dtpFechNac.MaxDate = DateTime.Today;

            // Añado todos los controles de tipo TextBox a un panel especifico para un mejor manejo de la función Vacios()
            panelTxt.Controls.Add(txtApellido);
			panelTxt.Controls.Add(txtNombre);
			panelTxt.Controls.Add(txtNroDoc);
			panelTxt.Controls.Add(txtDireccion);
			panelTxt.Controls.Add(txtCelu);
			panelTxt.Controls.Add(txtEmail);
		}

        private void btnRegistrar_Click(object sender, EventArgs e)
        {
            bool estaVacio = false, esNumerico = true;
            string txtBoxNotEmpty = "", txtBoxNumeric = "", tipoTxtBox = "";

            // Verifico que los TextBox no estén vacíos, y de estarlos recupero cual es para presentarlo en forma de error
            Vacios(ref estaVacio, ref txtBoxNotEmpty);

            if (!estaVacio)
            {
                // Verifico que los TextBox correspondientes sean numericos o no
                SonNumeros(ref esNumerico, ref txtBoxNumeric, ref tipoTxtBox);

                if (!esNumerico && tipoTxtBox == "numerico")
                {
                    MessageBox.Show($"El campo {txtBoxNumeric} no es númerico!", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else if (esNumerico && tipoTxtBox == "texto")
                {
                    MessageBox.Show($"El campo {txtBoxNumeric} no es alfabético!", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else
                {
                    // Realizo la conexión con la base de datos
                    SqlConnection conexion = new SqlConnection();
                    // Conexion Casa
                    //conexion.ConnectionString = "Data Source=DESKTOP-EGIGA8N\\SQLEXPRESS;Initial Catalog=Inmobiliaria;Integrated Security=True";

                    // Conexion Labo 2
                    conexion.ConnectionString = "Data Source=LAB205\\SQLEXPRESS;Initial Catalog=Inmobiliaria2;Persist Security Info=True;User ID=UserCreator;Password=UserCreator";

                    // Conexion Labo Arriba
                    //conexion.ConnectionString = "Data Source=localhost\\SQLEXPRESS01;Initial Catalog=Inmobiliariaa;Persist Security Info=True;User ID=UserCreator;Password=UserCreator";
                    conexion.Open();

                    // Creo una instancia de SqlCommand para hacer el manejo de las instrucciones sql
                    SqlCommand comando = new SqlCommand();
                    comando.Connection = conexion;
                    comando.CommandType = CommandType.Text;

                    // Pregunto si el campo Observaciones está vacío en caso de estarlo lo guardo como null para conveniencia de la bbdd
                    if (txtObservaciones.Text.Trim() != String.Empty)
                    {
                        // Establezco el insert con los datos del cliente a dar de alta
                        comando.CommandText = $"insert into Clientes (Apellido, Nombre, IdTipoDoc, NDoc, FechaNac, Direccion, IdLocalidad, Cel, Email, Activo, Observaciones) values ('{txtApellido.Text.Trim()}', '{txtNombre.Text.Trim()}', {cmbTipoDoc.SelectedValue}, {txtNroDoc.Text.Trim()}, '{dtpFechNac.Value.ToShortDateString()}', '{txtDireccion.Text.Trim()}', {cmbLocalidad.SelectedValue}, '{txtCelu.Text.Trim()}', '{txtEmail.Text.Trim()}', {cmbActivo.SelectedIndex}, '{txtObservaciones.Text.Trim()}')";
                    }
                    else
                    {
                        // Establezco el insert con los datos del cliente a dar de alta
                        comando.CommandText = $"insert into Clientes (Apellido, Nombre, IdTipoDoc, NDoc, FechaNac, Direccion, IdLocalidad, Cel, Email, Activo) values ('{txtApellido.Text.Trim()}', '{txtNombre.Text.Trim()}', {cmbTipoDoc.SelectedValue}, {txtNroDoc.Text.Trim()}, '{dtpFechNac.Value.ToShortDateString()}', '{txtDireccion.Text.Trim()}', {cmbLocalidad.SelectedValue}, '{txtCelu.Text.Trim()}', '{txtEmail.Text.Trim()}', {cmbActivo.SelectedIndex})";
                    }
                    
                    // Ejecuto el insert
                    comando.ExecuteNonQuery();

                    // Termino la conexión con la bbdd
                    conexion.Close();

                    // Informo que el cliente fue registrado exitosamente en la bbdd mediante un messagebox
                    MessageBox.Show("Cliente registrado con éxito!", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            else
            {
                MessageBox.Show($"El campo {txtBoxNotEmpty} está vacío!", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void Vacios(ref bool estaVacio, ref string cual)
        {
            // Recorro todos los TextBox's existentes en los controles del panel específico
            foreach (TextBox item in this.panelTxt.Controls)
            {        
                // Pregunto si el contenido de la propiedad Text está vacío
				if (item.Text.Trim() == String.Empty)
				{
                    // De ser así lo especifico y guardo cuál es el TextBox en cuestión llevandome su tag terminando de manera temprana el ciclo
                    estaVacio = true;
					cual = item.Tag.ToString();
					break;
				}
		    }
        }

        private void SonNumeros(ref bool esNumerico, ref string cual, ref string tipo)
        {
            // Determino cuales son los tag que me interesa buscar y que en principio son numericos o alfabeticos
            string[] Numericos = { "Celular", "Nro de Documento" };
            string[] NoNumericos = {  "Nombre", "Apellido" };

            // Recorro todos los TextBox en el panel específico para determinar si son numericos
            foreach (TextBox item in this.panelTxt.Controls)
            {
                // Pregunto si el tag del item seleccionado por el foreach está en el array Numericos
                if (Array.BinarySearch(Numericos, item.Tag.ToString()) >= 0)
                {
                    // De ser así pregunto si su contenido en la propiedad Text está compuesto efectivamente de numeros
                    if (!Regex.IsMatch(item.Text.Trim(), @"^\d+$"))
                    {
                        // De no ser así lo especifico y guardo cual es el TextBox en cuestion llevandome su tag y terminando de forma temprana el ciclo
                        esNumerico = false;
                        cual = item.Tag.ToString();
                        tipo = "numerico";
                        break;
                    }
                }
            }

            // Recorro todos los TextBox en el panel específico para determinar si son alfabeticos
            foreach (TextBox item in this.panelTxt.Controls)
            {
                // Pregunto si el tag del item seleccionado por el foreach está en el array NoNumericos
                if (Array.BinarySearch(NoNumericos, item.Tag.ToString()) >= 0)
                {
                    // De ser así pregunto si su contenido en la propiedad Text está compuesto efectivamente de letras
                    if (Regex.IsMatch(item.Text.Trim(), @"^\d+$"))
                    {
                        // De no ser así lo especifico y guardo cual es el TextBox en cuestion llevandome su tag y terminando de forma temprana el ciclo
                        esNumerico = true;
                        cual = item.Tag.ToString();
                        tipo = "texto";
                        break;
                    }
                }
            }
        }

        private void panelTxt_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
