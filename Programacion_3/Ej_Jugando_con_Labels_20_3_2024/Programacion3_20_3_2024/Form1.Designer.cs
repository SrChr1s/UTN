namespace Programacion3_20_3_2024
{
	partial class FrmEjer1
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
            this.btnCopiar = new System.Windows.Forms.Button();
            this.lblCopia = new System.Windows.Forms.Label();
            this.btnBorrar = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // txtApellido
            // 
            this.txtApellido.Location = new System.Drawing.Point(136, 95);
            this.txtApellido.MaxLength = 10;
            this.txtApellido.Name = "txtApellido";
            this.txtApellido.Size = new System.Drawing.Size(175, 20);
            this.txtApellido.TabIndex = 0;
            // 
            // btnCopiar
            // 
            this.btnCopiar.Location = new System.Drawing.Point(208, 145);
            this.btnCopiar.Name = "btnCopiar";
            this.btnCopiar.Size = new System.Drawing.Size(75, 23);
            this.btnCopiar.TabIndex = 1;
            this.btnCopiar.Text = "Copiar";
            this.btnCopiar.UseVisualStyleBackColor = true;
            this.btnCopiar.Click += new System.EventHandler(this.btnCopiar_Click);
            // 
            // lblCopia
            // 
            this.lblCopia.Font = new System.Drawing.Font("Monospac821 BT", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCopia.Location = new System.Drawing.Point(153, 202);
            this.lblCopia.Name = "lblCopia";
            this.lblCopia.Size = new System.Drawing.Size(178, 23);
            this.lblCopia.TabIndex = 2;
            this.lblCopia.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.lblCopia.Click += new System.EventHandler(this.lblCopia_Click);
            // 
            // btnBorrar
            // 
            this.btnBorrar.Location = new System.Drawing.Point(328, 93);
            this.btnBorrar.Name = "btnBorrar";
            this.btnBorrar.Size = new System.Drawing.Size(50, 23);
            this.btnBorrar.TabIndex = 3;
            this.btnBorrar.Text = "Borrar";
            this.btnBorrar.UseVisualStyleBackColor = true;
            this.btnBorrar.Click += new System.EventHandler(this.btnBorrar_Click);
            // 
            // FrmEjer1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(500, 368);
            this.Controls.Add(this.btnBorrar);
            this.Controls.Add(this.lblCopia);
            this.Controls.Add(this.btnCopiar);
            this.Controls.Add(this.txtApellido);
            this.Name = "FrmEjer1";
            this.Text = "Ejercicio 1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.TextBox txtApellido;
		private System.Windows.Forms.Button btnCopiar;
		private System.Windows.Forms.Label lblCopia;
		private System.Windows.Forms.Button btnBorrar;
	}
}

