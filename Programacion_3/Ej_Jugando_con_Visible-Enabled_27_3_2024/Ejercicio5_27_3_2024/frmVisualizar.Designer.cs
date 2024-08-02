namespace Ejercicio5_27_3_2024
{
	partial class frmVisualizar
	{
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing && (components != null))
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Windows Form Designer generated code

		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.btnAccion = new System.Windows.Forms.Button();
			this.txtFrase = new System.Windows.Forms.TextBox();
			this.SuspendLayout();
			// 
			// btnAccion
			// 
			this.btnAccion.Location = new System.Drawing.Point(108, 128);
			this.btnAccion.Name = "btnAccion";
			this.btnAccion.Size = new System.Drawing.Size(75, 23);
			this.btnAccion.TabIndex = 3;
			this.btnAccion.Text = "Ocultar";
			this.btnAccion.UseVisualStyleBackColor = true;
			this.btnAccion.Click += new System.EventHandler(this.btnAccion_Click);
			// 
			// txtFrase
			// 
			this.txtFrase.Location = new System.Drawing.Point(94, 72);
			this.txtFrase.Name = "txtFrase";
			this.txtFrase.Size = new System.Drawing.Size(100, 20);
			this.txtFrase.TabIndex = 2;
			// 
			// frmVisualizar
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(283, 221);
			this.Controls.Add(this.btnAccion);
			this.Controls.Add(this.txtFrase);
			this.Name = "frmVisualizar";
			this.Text = "Visualizacion";
			this.Load += new System.EventHandler(this.frmVisualizar_Load);
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.Button btnAccion;
		private System.Windows.Forms.TextBox txtFrase;
	}
}