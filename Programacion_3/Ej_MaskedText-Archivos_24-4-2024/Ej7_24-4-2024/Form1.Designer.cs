namespace Ej7_24_4_2024
{
	partial class frmEjercicio7
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
			this.mskTxtPatente = new System.Windows.Forms.MaskedTextBox();
			this.lblPatente = new System.Windows.Forms.Label();
			this.lblPropietario = new System.Windows.Forms.Label();
			this.lblVendido = new System.Windows.Forms.Label();
			this.txtPropietario = new System.Windows.Forms.TextBox();
			this.chkVendido = new System.Windows.Forms.CheckBox();
			this.btnRegistrar = new System.Windows.Forms.Button();
			this.sfd = new System.Windows.Forms.SaveFileDialog();
			this.SuspendLayout();
			// 
			// mskTxtPatente
			// 
			this.mskTxtPatente.Location = new System.Drawing.Point(77, 29);
			this.mskTxtPatente.Mask = "LL-000-LL";
			this.mskTxtPatente.Name = "mskTxtPatente";
			this.mskTxtPatente.Size = new System.Drawing.Size(100, 20);
			this.mskTxtPatente.TabIndex = 0;
			// 
			// lblPatente
			// 
			this.lblPatente.AutoSize = true;
			this.lblPatente.Location = new System.Drawing.Point(27, 32);
			this.lblPatente.Name = "lblPatente";
			this.lblPatente.Size = new System.Drawing.Size(44, 13);
			this.lblPatente.TabIndex = 1;
			this.lblPatente.Text = "Patente";
			// 
			// lblPropietario
			// 
			this.lblPropietario.AutoSize = true;
			this.lblPropietario.Location = new System.Drawing.Point(14, 67);
			this.lblPropietario.Name = "lblPropietario";
			this.lblPropietario.Size = new System.Drawing.Size(57, 13);
			this.lblPropietario.TabIndex = 2;
			this.lblPropietario.Text = "Propietario";
			// 
			// lblVendido
			// 
			this.lblVendido.AutoSize = true;
			this.lblVendido.Location = new System.Drawing.Point(25, 102);
			this.lblVendido.Name = "lblVendido";
			this.lblVendido.Size = new System.Drawing.Size(46, 13);
			this.lblVendido.TabIndex = 3;
			this.lblVendido.Text = "Vendido";
			// 
			// txtPropietario
			// 
			this.txtPropietario.Location = new System.Drawing.Point(77, 64);
			this.txtPropietario.MaxLength = 30;
			this.txtPropietario.Name = "txtPropietario";
			this.txtPropietario.Size = new System.Drawing.Size(220, 20);
			this.txtPropietario.TabIndex = 4;
			// 
			// chkVendido
			// 
			this.chkVendido.AutoSize = true;
			this.chkVendido.Location = new System.Drawing.Point(77, 101);
			this.chkVendido.Name = "chkVendido";
			this.chkVendido.Size = new System.Drawing.Size(15, 14);
			this.chkVendido.TabIndex = 5;
			this.chkVendido.UseVisualStyleBackColor = true;
			// 
			// btnRegistrar
			// 
			this.btnRegistrar.Location = new System.Drawing.Point(123, 149);
			this.btnRegistrar.Name = "btnRegistrar";
			this.btnRegistrar.Size = new System.Drawing.Size(75, 23);
			this.btnRegistrar.TabIndex = 6;
			this.btnRegistrar.Text = "Registrar";
			this.btnRegistrar.UseVisualStyleBackColor = true;
			this.btnRegistrar.Click += new System.EventHandler(this.btnRegistrar_Click);
			// 
			// frmEjercicio7
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(328, 184);
			this.Controls.Add(this.btnRegistrar);
			this.Controls.Add(this.chkVendido);
			this.Controls.Add(this.txtPropietario);
			this.Controls.Add(this.lblVendido);
			this.Controls.Add(this.lblPropietario);
			this.Controls.Add(this.lblPatente);
			this.Controls.Add(this.mskTxtPatente);
			this.Name = "frmEjercicio7";
			this.Text = "Ejercicio 7";
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.MaskedTextBox mskTxtPatente;
		private System.Windows.Forms.Label lblPatente;
		private System.Windows.Forms.Label lblPropietario;
		private System.Windows.Forms.Label lblVendido;
		private System.Windows.Forms.TextBox txtPropietario;
		private System.Windows.Forms.CheckBox chkVendido;
		private System.Windows.Forms.Button btnRegistrar;
		private System.Windows.Forms.SaveFileDialog sfd;
	}
}

