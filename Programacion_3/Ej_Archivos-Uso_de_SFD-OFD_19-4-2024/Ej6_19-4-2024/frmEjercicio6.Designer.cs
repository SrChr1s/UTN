namespace Ej6_19_4_2024
{
	partial class frmEjercicio6
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
			this.btnRegistrar = new System.Windows.Forms.Button();
			this.txtRegistro = new System.Windows.Forms.TextBox();
			this.txtRecuperar = new System.Windows.Forms.TextBox();
			this.btnRecuperar = new System.Windows.Forms.Button();
			this.lblDNI = new System.Windows.Forms.Label();
			this.ofd = new System.Windows.Forms.OpenFileDialog();
			this.sfd = new System.Windows.Forms.SaveFileDialog();
			this.SuspendLayout();
			// 
			// btnRegistrar
			// 
			this.btnRegistrar.Location = new System.Drawing.Point(88, 72);
			this.btnRegistrar.Name = "btnRegistrar";
			this.btnRegistrar.Size = new System.Drawing.Size(75, 23);
			this.btnRegistrar.TabIndex = 0;
			this.btnRegistrar.Text = "Registrar";
			this.btnRegistrar.UseVisualStyleBackColor = true;
			this.btnRegistrar.Click += new System.EventHandler(this.btnRegistrar_Click);
			// 
			// txtRegistro
			// 
			this.txtRegistro.Location = new System.Drawing.Point(57, 32);
			this.txtRegistro.MaxLength = 8;
			this.txtRegistro.Name = "txtRegistro";
			this.txtRegistro.Size = new System.Drawing.Size(131, 20);
			this.txtRegistro.TabIndex = 1;
			// 
			// txtRecuperar
			// 
			this.txtRecuperar.Location = new System.Drawing.Point(12, 169);
			this.txtRecuperar.Multiline = true;
			this.txtRecuperar.Name = "txtRecuperar";
			this.txtRecuperar.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
			this.txtRecuperar.Size = new System.Drawing.Size(230, 113);
			this.txtRecuperar.TabIndex = 2;
			// 
			// btnRecuperar
			// 
			this.btnRecuperar.Location = new System.Drawing.Point(88, 131);
			this.btnRecuperar.Name = "btnRecuperar";
			this.btnRecuperar.Size = new System.Drawing.Size(75, 23);
			this.btnRecuperar.TabIndex = 3;
			this.btnRecuperar.Text = "Recuperar";
			this.btnRecuperar.UseVisualStyleBackColor = true;
			this.btnRecuperar.Click += new System.EventHandler(this.btnRecuperar_Click);
			// 
			// lblDNI
			// 
			this.lblDNI.AutoSize = true;
			this.lblDNI.Location = new System.Drawing.Point(54, 16);
			this.lblDNI.Name = "lblDNI";
			this.lblDNI.Size = new System.Drawing.Size(26, 13);
			this.lblDNI.TabIndex = 4;
			this.lblDNI.Text = "DNI";
			// 
			// ofd
			// 
			this.ofd.FileName = "openFileDialog1";
			// 
			// frmEjercicio6
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(256, 296);
			this.Controls.Add(this.lblDNI);
			this.Controls.Add(this.btnRecuperar);
			this.Controls.Add(this.txtRecuperar);
			this.Controls.Add(this.txtRegistro);
			this.Controls.Add(this.btnRegistrar);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
			this.MaximizeBox = false;
			this.Name = "frmEjercicio6";
			this.Text = "Ejercicio 6";
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.Button btnRegistrar;
		private System.Windows.Forms.TextBox txtRegistro;
		private System.Windows.Forms.TextBox txtRecuperar;
		private System.Windows.Forms.Button btnRecuperar;
		private System.Windows.Forms.Label lblDNI;
		private System.Windows.Forms.OpenFileDialog ofd;
		private System.Windows.Forms.SaveFileDialog sfd;
	}
}

