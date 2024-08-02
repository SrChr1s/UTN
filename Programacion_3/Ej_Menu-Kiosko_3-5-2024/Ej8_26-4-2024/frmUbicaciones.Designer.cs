namespace Ej8_26_4_2024
{
	partial class frmUbicaciones
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
			this.cmbUbicaciones = new System.Windows.Forms.ComboBox();
			this.lsvData = new System.Windows.Forms.ListView();
			this.btnExportar = new System.Windows.Forms.Button();
			this.sfd = new System.Windows.Forms.SaveFileDialog();
			this.SuspendLayout();
			// 
			// cmbUbicaciones
			// 
			this.cmbUbicaciones.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.cmbUbicaciones.FormattingEnabled = true;
			this.cmbUbicaciones.Location = new System.Drawing.Point(12, 39);
			this.cmbUbicaciones.Name = "cmbUbicaciones";
			this.cmbUbicaciones.Size = new System.Drawing.Size(163, 21);
			this.cmbUbicaciones.TabIndex = 0;
			this.cmbUbicaciones.SelectedIndexChanged += new System.EventHandler(this.cmbUbicaciones_SelectedIndexChanged);
			// 
			// lsvData
			// 
			this.lsvData.HideSelection = false;
			this.lsvData.Location = new System.Drawing.Point(12, 101);
			this.lsvData.Name = "lsvData";
			this.lsvData.Size = new System.Drawing.Size(424, 162);
			this.lsvData.TabIndex = 1;
			this.lsvData.UseCompatibleStateImageBehavior = false;
			// 
			// btnExportar
			// 
			this.btnExportar.Font = new System.Drawing.Font("Nirmala UI", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.btnExportar.Location = new System.Drawing.Point(289, 20);
			this.btnExportar.Name = "btnExportar";
			this.btnExportar.Size = new System.Drawing.Size(147, 56);
			this.btnExportar.TabIndex = 2;
			this.btnExportar.Text = "Exportar";
			this.btnExportar.UseVisualStyleBackColor = true;
			this.btnExportar.Click += new System.EventHandler(this.btnExportar_Click);
			// 
			// frmUbicaciones
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.BackColor = System.Drawing.Color.DarkSeaGreen;
			this.ClientSize = new System.Drawing.Size(448, 274);
			this.Controls.Add(this.btnExportar);
			this.Controls.Add(this.lsvData);
			this.Controls.Add(this.cmbUbicaciones);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
			this.MaximizeBox = false;
			this.Name = "frmUbicaciones";
			this.Text = "frmUbicaciones";
			this.Load += new System.EventHandler(this.frmUbicaciones_Load);
			this.ResumeLayout(false);

		}

		#endregion

		private System.Windows.Forms.ComboBox cmbUbicaciones;
		private System.Windows.Forms.ListView lsvData;
		private System.Windows.Forms.Button btnExportar;
		private System.Windows.Forms.SaveFileDialog sfd;
	}
}