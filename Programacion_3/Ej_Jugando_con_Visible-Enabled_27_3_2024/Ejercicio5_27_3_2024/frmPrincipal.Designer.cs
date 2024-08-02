namespace Ejercicio5_27_3_2024
{
	partial class frmPrincipal
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
			this.mnuOperaciones = new System.Windows.Forms.ToolStripMenuItem();
			this.mnuHabilitacion = new System.Windows.Forms.ToolStripMenuItem();
			this.mnuVisualizacion = new System.Windows.Forms.ToolStripMenuItem();
			this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
			this.mnuSalir = new System.Windows.Forms.ToolStripMenuItem();
			this.menuStrip1.SuspendLayout();
			this.SuspendLayout();
			// 
			// menuStrip1
			// 
			this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuOperaciones});
			this.menuStrip1.Location = new System.Drawing.Point(0, 0);
			this.menuStrip1.Name = "menuStrip1";
			this.menuStrip1.Size = new System.Drawing.Size(644, 24);
			this.menuStrip1.TabIndex = 0;
			this.menuStrip1.Text = "menuStrip1";
			this.menuStrip1.ItemClicked += new System.Windows.Forms.ToolStripItemClickedEventHandler(this.menuStrip1_ItemClicked);
			// 
			// mnuOperaciones
			// 
			this.mnuOperaciones.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuHabilitacion,
            this.mnuVisualizacion,
            this.toolStripSeparator1,
            this.mnuSalir});
			this.mnuOperaciones.Name = "mnuOperaciones";
			this.mnuOperaciones.Size = new System.Drawing.Size(85, 20);
			this.mnuOperaciones.Text = "Operaciones";
			this.mnuOperaciones.Click += new System.EventHandler(this.toolStripMenuItem1_Click);
			// 
			// mnuHabilitacion
			// 
			this.mnuHabilitacion.Name = "mnuHabilitacion";
			this.mnuHabilitacion.Size = new System.Drawing.Size(180, 22);
			this.mnuHabilitacion.Text = "Habilitacion";
			this.mnuHabilitacion.Click += new System.EventHandler(this.mnuHabilitacion_Click);
			// 
			// mnuVisualizacion
			// 
			this.mnuVisualizacion.Name = "mnuVisualizacion";
			this.mnuVisualizacion.Size = new System.Drawing.Size(180, 22);
			this.mnuVisualizacion.Text = "Visualizacion";
			this.mnuVisualizacion.Click += new System.EventHandler(this.visualizacionToolStripMenuItem_Click);
			// 
			// toolStripSeparator1
			// 
			this.toolStripSeparator1.Name = "toolStripSeparator1";
			this.toolStripSeparator1.Size = new System.Drawing.Size(177, 6);
			// 
			// mnuSalir
			// 
			this.mnuSalir.Name = "mnuSalir";
			this.mnuSalir.Size = new System.Drawing.Size(180, 22);
			this.mnuSalir.Text = "Salir";
			this.mnuSalir.Click += new System.EventHandler(this.mnuSalir_Click);
			// 
			// frmPrincipal
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(644, 355);
			this.Controls.Add(this.menuStrip1);
			this.MainMenuStrip = this.menuStrip1;
			this.Name = "frmPrincipal";
			this.Text = "Principal";
			this.Load += new System.EventHandler(this.frmPrincipal_Load);
			this.menuStrip1.ResumeLayout(false);
			this.menuStrip1.PerformLayout();
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.MenuStrip menuStrip1;
		private System.Windows.Forms.ToolStripMenuItem mnuOperaciones;
		private System.Windows.Forms.ToolStripMenuItem mnuHabilitacion;
		private System.Windows.Forms.ToolStripMenuItem mnuVisualizacion;
		private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
		private System.Windows.Forms.ToolStripMenuItem mnuSalir;
	}
}