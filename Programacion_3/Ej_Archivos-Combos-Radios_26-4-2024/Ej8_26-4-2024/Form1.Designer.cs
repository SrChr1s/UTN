namespace Ej8_26_4_2024
{
	partial class frmEjercicio8
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
			this.txtDescripcion = new System.Windows.Forms.TextBox();
			this.cmbCategoria = new System.Windows.Forms.ComboBox();
			this.rBtnGondola = new System.Windows.Forms.RadioButton();
			this.rBtnRefrigerador = new System.Windows.Forms.RadioButton();
			this.rBtnDeposito = new System.Windows.Forms.RadioButton();
			this.chkDisponible = new System.Windows.Forms.CheckBox();
			this.btnRegistrar = new System.Windows.Forms.Button();
			this.btnCalcular = new System.Windows.Forms.Button();
			this.lblTotal = new System.Windows.Forms.Label();
			this.lblDescr = new System.Windows.Forms.Label();
			this.lblCategoria = new System.Windows.Forms.Label();
			this.gBoxUbicacion = new System.Windows.Forms.GroupBox();
			this.sfd = new System.Windows.Forms.SaveFileDialog();
			this.ofd = new System.Windows.Forms.OpenFileDialog();
			this.gBoxUbicacion.SuspendLayout();
			this.SuspendLayout();
			// 
			// txtDescripcion
			// 
			this.txtDescripcion.Location = new System.Drawing.Point(38, 32);
			this.txtDescripcion.MaxLength = 45;
			this.txtDescripcion.Name = "txtDescripcion";
			this.txtDescripcion.Size = new System.Drawing.Size(191, 20);
			this.txtDescripcion.TabIndex = 0;
			// 
			// cmbCategoria
			// 
			this.cmbCategoria.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.cmbCategoria.FormattingEnabled = true;
			this.cmbCategoria.Location = new System.Drawing.Point(71, 76);
			this.cmbCategoria.Name = "cmbCategoria";
			this.cmbCategoria.Size = new System.Drawing.Size(126, 21);
			this.cmbCategoria.TabIndex = 1;
			// 
			// rBtnGondola
			// 
			this.rBtnGondola.AutoSize = true;
			this.rBtnGondola.Location = new System.Drawing.Point(21, 21);
			this.rBtnGondola.Name = "rBtnGondola";
			this.rBtnGondola.Size = new System.Drawing.Size(65, 17);
			this.rBtnGondola.TabIndex = 2;
			this.rBtnGondola.TabStop = true;
			this.rBtnGondola.Text = "Góndola";
			this.rBtnGondola.UseVisualStyleBackColor = true;
			// 
			// rBtnRefrigerador
			// 
			this.rBtnRefrigerador.AutoSize = true;
			this.rBtnRefrigerador.Location = new System.Drawing.Point(21, 45);
			this.rBtnRefrigerador.Name = "rBtnRefrigerador";
			this.rBtnRefrigerador.Size = new System.Drawing.Size(83, 17);
			this.rBtnRefrigerador.TabIndex = 3;
			this.rBtnRefrigerador.TabStop = true;
			this.rBtnRefrigerador.Text = "Refrigerador";
			this.rBtnRefrigerador.UseVisualStyleBackColor = true;
			// 
			// rBtnDeposito
			// 
			this.rBtnDeposito.AutoSize = true;
			this.rBtnDeposito.Location = new System.Drawing.Point(21, 69);
			this.rBtnDeposito.Name = "rBtnDeposito";
			this.rBtnDeposito.Size = new System.Drawing.Size(67, 17);
			this.rBtnDeposito.TabIndex = 4;
			this.rBtnDeposito.TabStop = true;
			this.rBtnDeposito.Text = "Depósito";
			this.rBtnDeposito.UseVisualStyleBackColor = true;
			// 
			// chkDisponible
			// 
			this.chkDisponible.AutoSize = true;
			this.chkDisponible.Location = new System.Drawing.Point(97, 224);
			this.chkDisponible.Name = "chkDisponible";
			this.chkDisponible.Size = new System.Drawing.Size(75, 17);
			this.chkDisponible.TabIndex = 5;
			this.chkDisponible.Text = "Disponible";
			this.chkDisponible.UseVisualStyleBackColor = true;
			// 
			// btnRegistrar
			// 
			this.btnRegistrar.Location = new System.Drawing.Point(97, 269);
			this.btnRegistrar.Name = "btnRegistrar";
			this.btnRegistrar.Size = new System.Drawing.Size(75, 23);
			this.btnRegistrar.TabIndex = 6;
			this.btnRegistrar.Text = "Registrar";
			this.btnRegistrar.UseVisualStyleBackColor = true;
			this.btnRegistrar.Click += new System.EventHandler(this.btnRegistrar_Click);
			// 
			// btnCalcular
			// 
			this.btnCalcular.Location = new System.Drawing.Point(12, 382);
			this.btnCalcular.Name = "btnCalcular";
			this.btnCalcular.Size = new System.Drawing.Size(75, 23);
			this.btnCalcular.TabIndex = 7;
			this.btnCalcular.Text = "Calcular";
			this.btnCalcular.UseVisualStyleBackColor = true;
			this.btnCalcular.Click += new System.EventHandler(this.btnCalcular_Click);
			// 
			// lblTotal
			// 
			this.lblTotal.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
			this.lblTotal.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.lblTotal.ForeColor = System.Drawing.SystemColors.ControlText;
			this.lblTotal.Location = new System.Drawing.Point(155, 382);
			this.lblTotal.Name = "lblTotal";
			this.lblTotal.Size = new System.Drawing.Size(100, 23);
			this.lblTotal.TabIndex = 8;
			this.lblTotal.Text = "Total";
			this.lblTotal.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
			// 
			// lblDescr
			// 
			this.lblDescr.AutoSize = true;
			this.lblDescr.Location = new System.Drawing.Point(35, 16);
			this.lblDescr.Name = "lblDescr";
			this.lblDescr.Size = new System.Drawing.Size(63, 13);
			this.lblDescr.TabIndex = 9;
			this.lblDescr.Text = "Descripcion";
			// 
			// lblCategoria
			// 
			this.lblCategoria.AutoSize = true;
			this.lblCategoria.Location = new System.Drawing.Point(68, 60);
			this.lblCategoria.Name = "lblCategoria";
			this.lblCategoria.Size = new System.Drawing.Size(52, 13);
			this.lblCategoria.TabIndex = 10;
			this.lblCategoria.Text = "Categoria";
			// 
			// gBoxUbicacion
			// 
			this.gBoxUbicacion.Controls.Add(this.rBtnRefrigerador);
			this.gBoxUbicacion.Controls.Add(this.rBtnGondola);
			this.gBoxUbicacion.Controls.Add(this.rBtnDeposito);
			this.gBoxUbicacion.Location = new System.Drawing.Point(71, 109);
			this.gBoxUbicacion.Name = "gBoxUbicacion";
			this.gBoxUbicacion.Size = new System.Drawing.Size(126, 100);
			this.gBoxUbicacion.TabIndex = 11;
			this.gBoxUbicacion.TabStop = false;
			this.gBoxUbicacion.Text = "Ubicacion";
			// 
			// ofd
			// 
			this.ofd.FileName = "openFileDialog1";
			// 
			// frmEjercicio8
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.BackColor = System.Drawing.Color.DarkSeaGreen;
			this.ClientSize = new System.Drawing.Size(267, 426);
			this.Controls.Add(this.gBoxUbicacion);
			this.Controls.Add(this.lblCategoria);
			this.Controls.Add(this.lblDescr);
			this.Controls.Add(this.lblTotal);
			this.Controls.Add(this.btnCalcular);
			this.Controls.Add(this.btnRegistrar);
			this.Controls.Add(this.chkDisponible);
			this.Controls.Add(this.cmbCategoria);
			this.Controls.Add(this.txtDescripcion);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
			this.Name = "frmEjercicio8";
			this.Text = "Ejercicio 8";
			this.Load += new System.EventHandler(this.frmEjercicio8_Load);
			this.gBoxUbicacion.ResumeLayout(false);
			this.gBoxUbicacion.PerformLayout();
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.TextBox txtDescripcion;
		private System.Windows.Forms.ComboBox cmbCategoria;
		private System.Windows.Forms.RadioButton rBtnGondola;
		private System.Windows.Forms.RadioButton rBtnRefrigerador;
		private System.Windows.Forms.RadioButton rBtnDeposito;
		private System.Windows.Forms.CheckBox chkDisponible;
		private System.Windows.Forms.Button btnRegistrar;
		private System.Windows.Forms.Button btnCalcular;
		private System.Windows.Forms.Label lblTotal;
		private System.Windows.Forms.Label lblDescr;
		private System.Windows.Forms.Label lblCategoria;
		private System.Windows.Forms.GroupBox gBoxUbicacion;
		private System.Windows.Forms.SaveFileDialog sfd;
		private System.Windows.Forms.OpenFileDialog ofd;
	}
}

