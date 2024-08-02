namespace Ej2_20_3_2024
{
	partial class FrmEjercicio2
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
            this.txtApellido = new System.Windows.Forms.TextBox();
            this.btnRegistrar = new System.Windows.Forms.Button();
            this.chkAdulto = new System.Windows.Forms.CheckBox();
            this.rbArg = new System.Windows.Forms.RadioButton();
            this.rbVzlno = new System.Windows.Forms.RadioButton();
            this.rbPeru = new System.Windows.Forms.RadioButton();
            this.rbBrazil = new System.Windows.Forms.RadioButton();
            this.SuspendLayout();
            // 
            // txtApellido
            // 
            this.txtApellido.Location = new System.Drawing.Point(215, 82);
            this.txtApellido.MaxLength = 20;
            this.txtApellido.Name = "txtApellido";
            this.txtApellido.Size = new System.Drawing.Size(176, 20);
            this.txtApellido.TabIndex = 0;
            this.txtApellido.TextChanged += new System.EventHandler(this.txtApellido_TextChanged);
            // 
            // btnRegistrar
            // 
            this.btnRegistrar.Location = new System.Drawing.Point(268, 202);
            this.btnRegistrar.Name = "btnRegistrar";
            this.btnRegistrar.Size = new System.Drawing.Size(75, 23);
            this.btnRegistrar.TabIndex = 1;
            this.btnRegistrar.Text = "Registrar";
            this.btnRegistrar.UseVisualStyleBackColor = true;
            this.btnRegistrar.Click += new System.EventHandler(this.btnRegistrar_Click);
            // 
            // chkAdulto
            // 
            this.chkAdulto.AutoSize = true;
            this.chkAdulto.Location = new System.Drawing.Point(278, 125);
            this.chkAdulto.Name = "chkAdulto";
            this.chkAdulto.Size = new System.Drawing.Size(56, 17);
            this.chkAdulto.TabIndex = 2;
            this.chkAdulto.Text = "Adulto";
            this.chkAdulto.UseVisualStyleBackColor = true;
            // 
            // rbArg
            // 
            this.rbArg.AutoSize = true;
            this.rbArg.Location = new System.Drawing.Point(150, 159);
            this.rbArg.Name = "rbArg";
            this.rbArg.Size = new System.Drawing.Size(70, 17);
            this.rbArg.TabIndex = 3;
            this.rbArg.TabStop = true;
            this.rbArg.Text = "Argentino";
            this.rbArg.UseVisualStyleBackColor = true;
            this.rbArg.CheckedChanged += new System.EventHandler(this.rbNativo_CheckedChanged);
            // 
            // rbVzlno
            // 
            this.rbVzlno.AutoSize = true;
            this.rbVzlno.Location = new System.Drawing.Point(228, 159);
            this.rbVzlno.Name = "rbVzlno";
            this.rbVzlno.Size = new System.Drawing.Size(81, 17);
            this.rbVzlno.TabIndex = 4;
            this.rbVzlno.TabStop = true;
            this.rbVzlno.Text = "Venezolano";
            this.rbVzlno.UseVisualStyleBackColor = true;
            this.rbVzlno.CheckedChanged += new System.EventHandler(this.rbVzlno_CheckedChanged);
            // 
            // rbPeru
            // 
            this.rbPeru.AutoSize = true;
            this.rbPeru.Location = new System.Drawing.Point(390, 159);
            this.rbPeru.Name = "rbPeru";
            this.rbPeru.Size = new System.Drawing.Size(65, 17);
            this.rbPeru.TabIndex = 6;
            this.rbPeru.TabStop = true;
            this.rbPeru.Text = "Peruano";
            this.rbPeru.UseVisualStyleBackColor = true;
            // 
            // rbBrazil
            // 
            this.rbBrazil.AutoSize = true;
            this.rbBrazil.Location = new System.Drawing.Point(312, 159);
            this.rbBrazil.Name = "rbBrazil";
            this.rbBrazil.Size = new System.Drawing.Size(68, 17);
            this.rbBrazil.TabIndex = 5;
            this.rbBrazil.TabStop = true;
            this.rbBrazil.Text = "Brasileño";
            this.rbBrazil.UseVisualStyleBackColor = true;
            // 
            // FrmEjercicio2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(622, 443);
            this.Controls.Add(this.rbPeru);
            this.Controls.Add(this.rbBrazil);
            this.Controls.Add(this.rbVzlno);
            this.Controls.Add(this.rbArg);
            this.Controls.Add(this.chkAdulto);
            this.Controls.Add(this.btnRegistrar);
            this.Controls.Add(this.txtApellido);
            this.Name = "FrmEjercicio2";
            this.Text = "Ejercicio 2";
            this.Load += new System.EventHandler(this.FrmEjercicio2_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.TextBox txtApellido;
		private System.Windows.Forms.Button btnRegistrar;
		private System.Windows.Forms.CheckBox chkAdulto;
		private System.Windows.Forms.RadioButton rbArg;
		private System.Windows.Forms.RadioButton rbVzlno;
		private System.Windows.Forms.RadioButton rbPeru;
		private System.Windows.Forms.RadioButton rbBrazil;
	}
}

