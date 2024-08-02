namespace Ejercicio5_17_04_2024
{
	partial class frmMenu
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
			this.menuStrip1 = new System.Windows.Forms.MenuStrip();
			this.opcionPrincipal = new System.Windows.Forms.ToolStripMenuItem();
			this.opcionRegistros = new System.Windows.Forms.ToolStripMenuItem();
			this.opcionSalir = new System.Windows.Forms.ToolStripMenuItem();
			this.menuStrip1.SuspendLayout();
			this.SuspendLayout();
			// 
			// menuStrip1
			// 
			this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.opcionPrincipal,
            this.opcionSalir});
			this.menuStrip1.Location = new System.Drawing.Point(0, 0);
			this.menuStrip1.Name = "menuStrip1";
			this.menuStrip1.Size = new System.Drawing.Size(402, 24);
			this.menuStrip1.TabIndex = 0;
			this.menuStrip1.Text = "menuStrip1";
			// 
			// opcionPrincipal
			// 
			this.opcionPrincipal.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.opcionRegistros});
			this.opcionPrincipal.Name = "opcionPrincipal";
			this.opcionPrincipal.Size = new System.Drawing.Size(65, 20);
			this.opcionPrincipal.Text = "Principal";
			// 
			// opcionRegistros
			// 
			this.opcionRegistros.Name = "opcionRegistros";
			this.opcionRegistros.Size = new System.Drawing.Size(180, 22);
			this.opcionRegistros.Text = "Registros";
			this.opcionRegistros.Click += new System.EventHandler(this.registrosToolStripMenuItem_Click);
			// 
			// opcionSalir
			// 
			this.opcionSalir.Name = "opcionSalir";
			this.opcionSalir.Size = new System.Drawing.Size(41, 20);
			this.opcionSalir.Text = "Salir";
			this.opcionSalir.Click += new System.EventHandler(this.salirToolStripMenuItem_Click);
			// 
			// frmMenu
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(402, 297);
			this.Controls.Add(this.menuStrip1);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
			this.MainMenuStrip = this.menuStrip1;
			this.MaximizeBox = false;
			this.Name = "frmMenu";
			this.Text = "MEDI-ADMIN";
			this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmMenu_FormClosing);
			this.Load += new System.EventHandler(this.frmMenu_Load);
			this.menuStrip1.ResumeLayout(false);
			this.menuStrip1.PerformLayout();
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.MenuStrip menuStrip1;
		private System.Windows.Forms.ToolStripMenuItem opcionPrincipal;
		private System.Windows.Forms.ToolStripMenuItem opcionRegistros;
		private System.Windows.Forms.ToolStripMenuItem opcionSalir;
	}
}