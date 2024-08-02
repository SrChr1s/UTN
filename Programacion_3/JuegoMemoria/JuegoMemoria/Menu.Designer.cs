namespace JuegoMemoria
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
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMenu));
			this.lblTitle = new System.Windows.Forms.Label();
			this.btnNewGame = new System.Windows.Forms.Button();
			this.btnSalir = new System.Windows.Forms.Button();
			this.pBoxLogo = new System.Windows.Forms.PictureBox();
			this.lblRanking = new System.Windows.Forms.Label();
			((System.ComponentModel.ISupportInitialize)(this.pBoxLogo)).BeginInit();
			this.SuspendLayout();
			// 
			// lblTitle
			// 
			this.lblTitle.AutoSize = true;
			this.lblTitle.Font = new System.Drawing.Font("Forte", 72F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.lblTitle.ForeColor = System.Drawing.Color.White;
			this.lblTitle.Location = new System.Drawing.Point(25, 60);
			this.lblTitle.Name = "lblTitle";
			this.lblTitle.Size = new System.Drawing.Size(642, 105);
			this.lblTitle.TabIndex = 1;
			this.lblTitle.Text = "Lucky Memory";
			// 
			// btnNewGame
			// 
			this.btnNewGame.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.btnNewGame.Location = new System.Drawing.Point(288, 313);
			this.btnNewGame.Name = "btnNewGame";
			this.btnNewGame.Size = new System.Drawing.Size(130, 44);
			this.btnNewGame.TabIndex = 2;
			this.btnNewGame.Text = "Nuevo Juego";
			this.btnNewGame.UseVisualStyleBackColor = true;
			this.btnNewGame.Click += new System.EventHandler(this.btnNewGame_Click);
			// 
			// btnSalir
			// 
			this.btnSalir.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.btnSalir.Location = new System.Drawing.Point(288, 384);
			this.btnSalir.Name = "btnSalir";
			this.btnSalir.Size = new System.Drawing.Size(130, 44);
			this.btnSalir.TabIndex = 4;
			this.btnSalir.Text = "Salir";
			this.btnSalir.UseVisualStyleBackColor = true;
			this.btnSalir.Click += new System.EventHandler(this.btnSalir_Click);
			// 
			// pBoxLogo
			// 
			this.pBoxLogo.BackColor = System.Drawing.Color.Transparent;
			this.pBoxLogo.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
			this.pBoxLogo.Image = global::JuegoMemoria.Properties.Resources.trebol;
			this.pBoxLogo.Location = new System.Drawing.Point(307, 192);
			this.pBoxLogo.Name = "pBoxLogo";
			this.pBoxLogo.Size = new System.Drawing.Size(88, 92);
			this.pBoxLogo.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
			this.pBoxLogo.TabIndex = 3;
			this.pBoxLogo.TabStop = false;
			// 
			// lblRanking
			// 
			this.lblRanking.Font = new System.Drawing.Font("Nirmala UI", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.lblRanking.ForeColor = System.Drawing.Color.White;
			this.lblRanking.Location = new System.Drawing.Point(476, 192);
			this.lblRanking.Name = "lblRanking";
			this.lblRanking.Size = new System.Drawing.Size(191, 236);
			this.lblRanking.TabIndex = 5;
			this.lblRanking.Text = "Top Puntajes";
			this.lblRanking.TextAlign = System.Drawing.ContentAlignment.TopCenter;
			// 
			// frmMenu
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.BackColor = System.Drawing.Color.DarkSlateGray;
			this.ClientSize = new System.Drawing.Size(698, 484);
			this.Controls.Add(this.lblRanking);
			this.Controls.Add(this.pBoxLogo);
			this.Controls.Add(this.btnSalir);
			this.Controls.Add(this.btnNewGame);
			this.Controls.Add(this.lblTitle);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.Name = "frmMenu";
			this.Text = "Lucky Memory";
			this.Load += new System.EventHandler(this.frmMenu_Load);
			((System.ComponentModel.ISupportInitialize)(this.pBoxLogo)).EndInit();
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.Label lblTitle;
		private System.Windows.Forms.Button btnNewGame;
		private System.Windows.Forms.PictureBox pBoxLogo;
		private System.Windows.Forms.Button btnSalir;
		private System.Windows.Forms.Label lblRanking;
	}
}