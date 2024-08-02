namespace Ejercicio5_17_04_2024
{
	partial class frmEjercicio5
	{
		/// <summary>
		/// Variable del diseñador necesaria.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// Limpiar los recursos que se estén usando.
		/// </summary>
		/// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing && (components != null))
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Código generado por el Diseñador de Windows Forms

		/// <summary>
		/// Método necesario para admitir el Diseñador. No se puede modificar
		/// el contenido de este método con el editor de código.
		/// </summary>
		private void InitializeComponent()
		{
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmEjercicio5));
			this.lsvRegistros = new System.Windows.Forms.ListView();
			this.txtDNI = new System.Windows.Forms.TextBox();
			this.txtApellido = new System.Windows.Forms.TextBox();
			this.txtNombre = new System.Windows.Forms.TextBox();
			this.txtCantHijos = new System.Windows.Forms.TextBox();
			this.lblDNI = new System.Windows.Forms.Label();
			this.lblApellido = new System.Windows.Forms.Label();
			this.lblNombre = new System.Windows.Forms.Label();
			this.lblCantHijos = new System.Windows.Forms.Label();
			this.cmbEstCivil = new System.Windows.Forms.ComboBox();
			this.lblEstCivil = new System.Windows.Forms.Label();
			this.dtpFecNac = new System.Windows.Forms.DateTimePicker();
			this.lblFecNac = new System.Windows.Forms.Label();
			this.btnRegistrar = new System.Windows.Forms.Button();
			this.chkRevision = new System.Windows.Forms.CheckBox();
			this.gboxEstados = new System.Windows.Forms.GroupBox();
			this.rbtnActivo = new System.Windows.Forms.RadioButton();
			this.rbtnDeshabilitado = new System.Windows.Forms.RadioButton();
			this.rbtnBloqueado = new System.Windows.Forms.RadioButton();
			this.gboxEstados.SuspendLayout();
			this.SuspendLayout();
			// 
			// lsvRegistros
			// 
			this.lsvRegistros.HideSelection = false;
			this.lsvRegistros.Location = new System.Drawing.Point(12, 136);
			this.lsvRegistros.Name = "lsvRegistros";
			this.lsvRegistros.Size = new System.Drawing.Size(708, 182);
			this.lsvRegistros.TabIndex = 0;
			this.lsvRegistros.UseCompatibleStateImageBehavior = false;
			// 
			// txtDNI
			// 
			this.txtDNI.Location = new System.Drawing.Point(12, 38);
			this.txtDNI.MaxLength = 8;
			this.txtDNI.Name = "txtDNI";
			this.txtDNI.Size = new System.Drawing.Size(100, 20);
			this.txtDNI.TabIndex = 1;
			// 
			// txtApellido
			// 
			this.txtApellido.Location = new System.Drawing.Point(139, 38);
			this.txtApellido.MaxLength = 30;
			this.txtApellido.Name = "txtApellido";
			this.txtApellido.Size = new System.Drawing.Size(100, 20);
			this.txtApellido.TabIndex = 2;
			// 
			// txtNombre
			// 
			this.txtNombre.Location = new System.Drawing.Point(270, 38);
			this.txtNombre.MaxLength = 30;
			this.txtNombre.Name = "txtNombre";
			this.txtNombre.Size = new System.Drawing.Size(100, 20);
			this.txtNombre.TabIndex = 3;
			// 
			// txtCantHijos
			// 
			this.txtCantHijos.Location = new System.Drawing.Point(12, 94);
			this.txtCantHijos.MaxLength = 2;
			this.txtCantHijos.Name = "txtCantHijos";
			this.txtCantHijos.Size = new System.Drawing.Size(100, 20);
			this.txtCantHijos.TabIndex = 4;
			// 
			// lblDNI
			// 
			this.lblDNI.AutoSize = true;
			this.lblDNI.Location = new System.Drawing.Point(9, 22);
			this.lblDNI.Name = "lblDNI";
			this.lblDNI.Size = new System.Drawing.Size(26, 13);
			this.lblDNI.TabIndex = 5;
			this.lblDNI.Text = "DNI";
			this.lblDNI.Click += new System.EventHandler(this.label1_Click);
			// 
			// lblApellido
			// 
			this.lblApellido.AutoSize = true;
			this.lblApellido.Location = new System.Drawing.Point(136, 22);
			this.lblApellido.Name = "lblApellido";
			this.lblApellido.Size = new System.Drawing.Size(44, 13);
			this.lblApellido.TabIndex = 6;
			this.lblApellido.Text = "Apellido";
			// 
			// lblNombre
			// 
			this.lblNombre.AutoSize = true;
			this.lblNombre.Location = new System.Drawing.Point(267, 22);
			this.lblNombre.Name = "lblNombre";
			this.lblNombre.Size = new System.Drawing.Size(44, 13);
			this.lblNombre.TabIndex = 7;
			this.lblNombre.Text = "Nombre";
			// 
			// lblCantHijos
			// 
			this.lblCantHijos.AutoSize = true;
			this.lblCantHijos.Location = new System.Drawing.Point(9, 78);
			this.lblCantHijos.Name = "lblCantHijos";
			this.lblCantHijos.Size = new System.Drawing.Size(58, 13);
			this.lblCantHijos.TabIndex = 8;
			this.lblCantHijos.Text = "Cant. Hijos";
			// 
			// cmbEstCivil
			// 
			this.cmbEstCivil.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.cmbEstCivil.FormattingEnabled = true;
			this.cmbEstCivil.Location = new System.Drawing.Point(139, 93);
			this.cmbEstCivil.Name = "cmbEstCivil";
			this.cmbEstCivil.Size = new System.Drawing.Size(100, 21);
			this.cmbEstCivil.TabIndex = 9;
			// 
			// lblEstCivil
			// 
			this.lblEstCivil.AutoSize = true;
			this.lblEstCivil.Location = new System.Drawing.Point(136, 77);
			this.lblEstCivil.Name = "lblEstCivil";
			this.lblEstCivil.Size = new System.Drawing.Size(62, 13);
			this.lblEstCivil.TabIndex = 10;
			this.lblEstCivil.Text = "Estado Civil";
			// 
			// dtpFecNac
			// 
			this.dtpFecNac.Checked = false;
			this.dtpFecNac.Format = System.Windows.Forms.DateTimePickerFormat.Short;
			this.dtpFecNac.Location = new System.Drawing.Point(270, 94);
			this.dtpFecNac.Name = "dtpFecNac";
			this.dtpFecNac.Size = new System.Drawing.Size(100, 20);
			this.dtpFecNac.TabIndex = 11;
			// 
			// lblFecNac
			// 
			this.lblFecNac.AutoSize = true;
			this.lblFecNac.Location = new System.Drawing.Point(267, 78);
			this.lblFecNac.Name = "lblFecNac";
			this.lblFecNac.Size = new System.Drawing.Size(108, 13);
			this.lblFecNac.TabIndex = 12;
			this.lblFecNac.Text = "Fecha de Nacimiento";
			// 
			// btnRegistrar
			// 
			this.btnRegistrar.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.btnRegistrar.Location = new System.Drawing.Point(557, 71);
			this.btnRegistrar.Name = "btnRegistrar";
			this.btnRegistrar.Size = new System.Drawing.Size(164, 43);
			this.btnRegistrar.TabIndex = 13;
			this.btnRegistrar.Text = "Registrar";
			this.btnRegistrar.UseVisualStyleBackColor = true;
			this.btnRegistrar.Click += new System.EventHandler(this.btnRegistrar_Click);
			// 
			// chkRevision
			// 
			this.chkRevision.AutoSize = true;
			this.chkRevision.Location = new System.Drawing.Point(556, 38);
			this.chkRevision.Name = "chkRevision";
			this.chkRevision.Size = new System.Drawing.Size(105, 17);
			this.chkRevision.TabIndex = 14;
			this.chkRevision.Text = "Revision Medica";
			this.chkRevision.UseVisualStyleBackColor = true;
			// 
			// gboxEstados
			// 
			this.gboxEstados.Controls.Add(this.rbtnBloqueado);
			this.gboxEstados.Controls.Add(this.rbtnDeshabilitado);
			this.gboxEstados.Controls.Add(this.rbtnActivo);
			this.gboxEstados.Location = new System.Drawing.Point(396, 22);
			this.gboxEstados.Name = "gboxEstados";
			this.gboxEstados.Size = new System.Drawing.Size(142, 100);
			this.gboxEstados.TabIndex = 15;
			this.gboxEstados.TabStop = false;
			this.gboxEstados.Text = "Estado";
			// 
			// rbtnActivo
			// 
			this.rbtnActivo.AutoSize = true;
			this.rbtnActivo.Location = new System.Drawing.Point(26, 19);
			this.rbtnActivo.Name = "rbtnActivo";
			this.rbtnActivo.Size = new System.Drawing.Size(55, 17);
			this.rbtnActivo.TabIndex = 0;
			this.rbtnActivo.TabStop = true;
			this.rbtnActivo.Text = "Activo";
			this.rbtnActivo.UseVisualStyleBackColor = true;
			// 
			// rbtnDeshabilitado
			// 
			this.rbtnDeshabilitado.AutoSize = true;
			this.rbtnDeshabilitado.Location = new System.Drawing.Point(26, 42);
			this.rbtnDeshabilitado.Name = "rbtnDeshabilitado";
			this.rbtnDeshabilitado.Size = new System.Drawing.Size(89, 17);
			this.rbtnDeshabilitado.TabIndex = 1;
			this.rbtnDeshabilitado.TabStop = true;
			this.rbtnDeshabilitado.Text = "Deshabilitado";
			this.rbtnDeshabilitado.UseVisualStyleBackColor = true;
			// 
			// rbtnBloqueado
			// 
			this.rbtnBloqueado.AutoSize = true;
			this.rbtnBloqueado.Location = new System.Drawing.Point(26, 65);
			this.rbtnBloqueado.Name = "rbtnBloqueado";
			this.rbtnBloqueado.Size = new System.Drawing.Size(76, 17);
			this.rbtnBloqueado.TabIndex = 2;
			this.rbtnBloqueado.TabStop = true;
			this.rbtnBloqueado.Text = "Bloqueado";
			this.rbtnBloqueado.UseVisualStyleBackColor = true;
			// 
			// frmEjercicio5
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(733, 330);
			this.Controls.Add(this.gboxEstados);
			this.Controls.Add(this.chkRevision);
			this.Controls.Add(this.btnRegistrar);
			this.Controls.Add(this.lblFecNac);
			this.Controls.Add(this.dtpFecNac);
			this.Controls.Add(this.lblEstCivil);
			this.Controls.Add(this.cmbEstCivil);
			this.Controls.Add(this.lblCantHijos);
			this.Controls.Add(this.lblNombre);
			this.Controls.Add(this.lblApellido);
			this.Controls.Add(this.lblDNI);
			this.Controls.Add(this.txtCantHijos);
			this.Controls.Add(this.txtNombre);
			this.Controls.Add(this.txtApellido);
			this.Controls.Add(this.txtDNI);
			this.Controls.Add(this.lsvRegistros);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.Name = "frmEjercicio5";
			this.Text = "Ejercicio 5";
			this.Load += new System.EventHandler(this.frmEjercicio5_Load);
			this.gboxEstados.ResumeLayout(false);
			this.gboxEstados.PerformLayout();
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.ListView lsvRegistros;
		private System.Windows.Forms.TextBox txtDNI;
		private System.Windows.Forms.TextBox txtApellido;
		private System.Windows.Forms.TextBox txtNombre;
		private System.Windows.Forms.TextBox txtCantHijos;
		private System.Windows.Forms.Label lblDNI;
		private System.Windows.Forms.Label lblApellido;
		private System.Windows.Forms.Label lblNombre;
		private System.Windows.Forms.Label lblCantHijos;
		private System.Windows.Forms.ComboBox cmbEstCivil;
		private System.Windows.Forms.Label lblEstCivil;
		private System.Windows.Forms.DateTimePicker dtpFecNac;
		private System.Windows.Forms.Label lblFecNac;
		private System.Windows.Forms.Button btnRegistrar;
		private System.Windows.Forms.CheckBox chkRevision;
		private System.Windows.Forms.GroupBox gboxEstados;
		private System.Windows.Forms.RadioButton rbtnDeshabilitado;
		private System.Windows.Forms.RadioButton rbtnActivo;
		private System.Windows.Forms.RadioButton rbtnBloqueado;
	}
}

