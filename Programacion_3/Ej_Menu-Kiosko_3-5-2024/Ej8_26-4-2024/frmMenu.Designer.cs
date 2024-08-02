namespace Ej8_26_4_2024
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
			this.mainMenu = new System.Windows.Forms.MenuStrip();
			this.mItemHerramientas = new System.Windows.Forms.ToolStripMenuItem();
			this.mItemInventario = new System.Windows.Forms.ToolStripMenuItem();
			this.mItemUbicaciones = new System.Windows.Forms.ToolStripMenuItem();
			this.mainMenu.SuspendLayout();
			this.SuspendLayout();
			// 
			// mainMenu
			// 
			this.mainMenu.Dock = System.Windows.Forms.DockStyle.None;
			this.mainMenu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mItemHerramientas});
			this.mainMenu.Location = new System.Drawing.Point(9, 9);
			this.mainMenu.Name = "mainMenu";
			this.mainMenu.Size = new System.Drawing.Size(98, 24);
			this.mainMenu.TabIndex = 1;
			this.mainMenu.Text = "menuStrip1";
			// 
			// mItemHerramientas
			// 
			this.mItemHerramientas.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mItemInventario,
            this.mItemUbicaciones});
			this.mItemHerramientas.Name = "mItemHerramientas";
			this.mItemHerramientas.Size = new System.Drawing.Size(90, 20);
			this.mItemHerramientas.Text = "Herramientas";
			// 
			// mItemInventario
			// 
			this.mItemInventario.Name = "mItemInventario";
			this.mItemInventario.Size = new System.Drawing.Size(180, 22);
			this.mItemInventario.Text = "Inventario";
			this.mItemInventario.Click += new System.EventHandler(this.mItemInventario_Click);
			// 
			// mItemUbicaciones
			// 
			this.mItemUbicaciones.Name = "mItemUbicaciones";
			this.mItemUbicaciones.Size = new System.Drawing.Size(180, 22);
			this.mItemUbicaciones.Text = "Ubicaciones";
			this.mItemUbicaciones.Click += new System.EventHandler(this.mItemUbicaciones_Click);
			// 
			// frmMenu
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.BackColor = System.Drawing.Color.DarkSeaGreen;
			this.ClientSize = new System.Drawing.Size(800, 450);
			this.Controls.Add(this.mainMenu);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
			this.MaximizeBox = false;
			this.Name = "frmMenu";
			this.Text = "frmMenu";
			this.Load += new System.EventHandler(this.frmMenu_Load);
			this.mainMenu.ResumeLayout(false);
			this.mainMenu.PerformLayout();
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.MenuStrip mainMenu;
		private System.Windows.Forms.ToolStripMenuItem mItemHerramientas;
		private System.Windows.Forms.ToolStripMenuItem mItemInventario;
		private System.Windows.Forms.ToolStripMenuItem mItemUbicaciones;
	}
}