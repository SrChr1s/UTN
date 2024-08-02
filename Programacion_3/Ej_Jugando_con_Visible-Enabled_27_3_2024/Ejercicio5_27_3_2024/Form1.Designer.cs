namespace Ejercicio5_27_3_2024
{
	partial class frmHabilitacion
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
			this.txtFrase = new System.Windows.Forms.TextBox();
			this.btnAccion = new System.Windows.Forms.Button();
			this.SuspendLayout();
			// 
			// txtFrase
			// 
			this.txtFrase.Location = new System.Drawing.Point(262, 103);
			this.txtFrase.Name = "txtFrase";
			this.txtFrase.Size = new System.Drawing.Size(100, 20);
			this.txtFrase.TabIndex = 0;
			// 
			// btnAccion
			// 
			this.btnAccion.Location = new System.Drawing.Point(276, 159);
			this.btnAccion.Name = "btnAccion";
			this.btnAccion.Size = new System.Drawing.Size(75, 23);
			this.btnAccion.TabIndex = 1;
			this.btnAccion.Text = "Deshabilitar";
			this.btnAccion.UseVisualStyleBackColor = true;
			this.btnAccion.Click += new System.EventHandler(this.btnAccion_Click);
			// 
			// frmHabilitacion
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(629, 349);
			this.Controls.Add(this.btnAccion);
			this.Controls.Add(this.txtFrase);
			this.Name = "frmHabilitacion";
			this.Text = "Habilitacion";
			this.Load += new System.EventHandler(this.frmHabilitacion_Load);
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.TextBox txtFrase;
		private System.Windows.Forms.Button btnAccion;
	}
}

