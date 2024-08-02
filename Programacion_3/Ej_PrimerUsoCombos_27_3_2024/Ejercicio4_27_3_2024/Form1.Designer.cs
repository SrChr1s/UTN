namespace Ejercicio4_27_3_2024
{
	partial class frmEjercicio4
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
			this.cmbOpciones = new System.Windows.Forms.ComboBox();
			this.btnAgregar = new System.Windows.Forms.Button();
			this.txtUno = new System.Windows.Forms.TextBox();
			this.SuspendLayout();
			// 
			// cmbOpciones
			// 
			this.cmbOpciones.FormattingEnabled = true;
			this.cmbOpciones.Location = new System.Drawing.Point(335, 218);
			this.cmbOpciones.Name = "cmbOpciones";
			this.cmbOpciones.Size = new System.Drawing.Size(121, 21);
			this.cmbOpciones.TabIndex = 0;
			// 
			// btnAgregar
			// 
			this.btnAgregar.Location = new System.Drawing.Point(360, 167);
			this.btnAgregar.Name = "btnAgregar";
			this.btnAgregar.Size = new System.Drawing.Size(75, 23);
			this.btnAgregar.TabIndex = 1;
			this.btnAgregar.Text = "Agregar";
			this.btnAgregar.UseVisualStyleBackColor = true;
			this.btnAgregar.Click += new System.EventHandler(this.btnAgregar_Click);
			// 
			// txtUno
			// 
			this.txtUno.Location = new System.Drawing.Point(345, 118);
			this.txtUno.MaxLength = 10;
			this.txtUno.Name = "txtUno";
			this.txtUno.Size = new System.Drawing.Size(100, 20);
			this.txtUno.TabIndex = 2;
			// 
			// frmEjercicio4
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(800, 450);
			this.Controls.Add(this.txtUno);
			this.Controls.Add(this.btnAgregar);
			this.Controls.Add(this.cmbOpciones);
			this.Name = "frmEjercicio4";
			this.Text = "Ejercicio4";
			this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.frmEjercicio4_FormClosed);
			this.Load += new System.EventHandler(this.frmEjercicio4_Load);
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.ComboBox cmbOpciones;
		private System.Windows.Forms.Button btnAgregar;
		private System.Windows.Forms.TextBox txtUno;
	}
}

