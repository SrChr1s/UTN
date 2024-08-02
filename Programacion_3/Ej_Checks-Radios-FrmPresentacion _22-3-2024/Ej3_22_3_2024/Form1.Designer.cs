namespace Ej3_22_3_2024
{
	partial class frmEjercicio3
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
			this.cmbMarca = new System.Windows.Forms.ComboBox();
			this.lblMarca = new System.Windows.Forms.Label();
			this.chkABS = new System.Windows.Forms.CheckBox();
			this.chkCierre = new System.Windows.Forms.CheckBox();
			this.chkGPS = new System.Windows.Forms.CheckBox();
			this.rbSedan = new System.Windows.Forms.RadioButton();
			this.rbHatchBack = new System.Windows.Forms.RadioButton();
			this.rbSUV = new System.Windows.Forms.RadioButton();
			this.btnProcesar = new System.Windows.Forms.Button();
			this.lblSeleccion = new System.Windows.Forms.Label();
			this.SuspendLayout();
			// 
			// cmbMarca
			// 
			this.cmbMarca.FormattingEnabled = true;
			this.cmbMarca.Location = new System.Drawing.Point(320, 59);
			this.cmbMarca.Name = "cmbMarca";
			this.cmbMarca.Size = new System.Drawing.Size(121, 21);
			this.cmbMarca.TabIndex = 0;
			this.cmbMarca.SelectedIndexChanged += new System.EventHandler(this.cmbMarca_SelectedIndexChanged);
			// 
			// lblMarca
			// 
			this.lblMarca.AutoSize = true;
			this.lblMarca.Location = new System.Drawing.Point(268, 62);
			this.lblMarca.Name = "lblMarca";
			this.lblMarca.Size = new System.Drawing.Size(37, 13);
			this.lblMarca.TabIndex = 1;
			this.lblMarca.Text = "Marca";
			// 
			// chkABS
			// 
			this.chkABS.AutoSize = true;
			this.chkABS.Location = new System.Drawing.Point(258, 108);
			this.chkABS.Name = "chkABS";
			this.chkABS.Size = new System.Drawing.Size(47, 17);
			this.chkABS.TabIndex = 2;
			this.chkABS.Text = "ABS";
			this.chkABS.UseVisualStyleBackColor = true;
			// 
			// chkCierre
			// 
			this.chkCierre.AutoSize = true;
			this.chkCierre.Location = new System.Drawing.Point(320, 108);
			this.chkCierre.Name = "chkCierre";
			this.chkCierre.Size = new System.Drawing.Size(114, 17);
			this.chkCierre.TabIndex = 3;
			this.chkCierre.Text = "Cierre Centralizado";
			this.chkCierre.UseVisualStyleBackColor = true;
			// 
			// chkGPS
			// 
			this.chkGPS.AutoSize = true;
			this.chkGPS.Location = new System.Drawing.Point(443, 108);
			this.chkGPS.Name = "chkGPS";
			this.chkGPS.Size = new System.Drawing.Size(48, 17);
			this.chkGPS.TabIndex = 4;
			this.chkGPS.Text = "GPS";
			this.chkGPS.UseVisualStyleBackColor = true;
			// 
			// rbSedan
			// 
			this.rbSedan.AutoSize = true;
			this.rbSedan.Location = new System.Drawing.Point(258, 157);
			this.rbSedan.Name = "rbSedan";
			this.rbSedan.Size = new System.Drawing.Size(56, 17);
			this.rbSedan.TabIndex = 5;
			this.rbSedan.TabStop = true;
			this.rbSedan.Text = "Sedan";
			this.rbSedan.UseVisualStyleBackColor = true;
			// 
			// rbHatchBack
			// 
			this.rbHatchBack.AutoSize = true;
			this.rbHatchBack.Location = new System.Drawing.Point(338, 157);
			this.rbHatchBack.Name = "rbHatchBack";
			this.rbHatchBack.Size = new System.Drawing.Size(79, 17);
			this.rbHatchBack.TabIndex = 6;
			this.rbHatchBack.TabStop = true;
			this.rbHatchBack.Text = "HatchBack";
			this.rbHatchBack.UseVisualStyleBackColor = true;
			// 
			// rbSUV
			// 
			this.rbSUV.AutoSize = true;
			this.rbSUV.Location = new System.Drawing.Point(443, 157);
			this.rbSUV.Name = "rbSUV";
			this.rbSUV.Size = new System.Drawing.Size(47, 17);
			this.rbSUV.TabIndex = 7;
			this.rbSUV.TabStop = true;
			this.rbSUV.Text = "SUV";
			this.rbSUV.UseVisualStyleBackColor = true;
			// 
			// btnProcesar
			// 
			this.btnProcesar.Location = new System.Drawing.Point(342, 189);
			this.btnProcesar.Name = "btnProcesar";
			this.btnProcesar.Size = new System.Drawing.Size(75, 23);
			this.btnProcesar.TabIndex = 8;
			this.btnProcesar.Text = "Procesar";
			this.btnProcesar.UseVisualStyleBackColor = true;
			this.btnProcesar.Click += new System.EventHandler(this.btnProcesar_Click);
			// 
			// lblSeleccion
			// 
			this.lblSeleccion.Font = new System.Drawing.Font("Monospac821 BT", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.lblSeleccion.Location = new System.Drawing.Point(268, 224);
			this.lblSeleccion.Name = "lblSeleccion";
			this.lblSeleccion.Size = new System.Drawing.Size(233, 129);
			this.lblSeleccion.TabIndex = 9;
			this.lblSeleccion.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
			this.lblSeleccion.Click += new System.EventHandler(this.lblSeleccion_Click);
			// 
			// frmEjercicio3
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(738, 362);
			this.Controls.Add(this.lblSeleccion);
			this.Controls.Add(this.btnProcesar);
			this.Controls.Add(this.rbSUV);
			this.Controls.Add(this.rbHatchBack);
			this.Controls.Add(this.rbSedan);
			this.Controls.Add(this.chkGPS);
			this.Controls.Add(this.chkCierre);
			this.Controls.Add(this.chkABS);
			this.Controls.Add(this.lblMarca);
			this.Controls.Add(this.cmbMarca);
			this.Name = "frmEjercicio3";
			this.Text = "Ejercicio 3";
			this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.frmEjercicio3_FormClosed);
			this.Load += new System.EventHandler(this.frmEjercicio3_Load);
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.ComboBox cmbMarca;
		private System.Windows.Forms.Label lblMarca;
		private System.Windows.Forms.CheckBox chkABS;
		private System.Windows.Forms.CheckBox chkCierre;
		private System.Windows.Forms.CheckBox chkGPS;
		private System.Windows.Forms.RadioButton rbSedan;
		private System.Windows.Forms.RadioButton rbHatchBack;
		private System.Windows.Forms.RadioButton rbSUV;
		private System.Windows.Forms.Button btnProcesar;
		private System.Windows.Forms.Label lblSeleccion;
	}
}

