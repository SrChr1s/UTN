namespace JuegoMemoria
{
	partial class frmIntro
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
			this.components = new System.ComponentModel.Container();
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmIntro));
			this.lblTitle = new System.Windows.Forms.Label();
			this.lblAutor = new System.Windows.Forms.Label();
			this.timerIntro = new System.Windows.Forms.Timer(this.components);
			this.SuspendLayout();
			// 
			// lblTitle
			// 
			this.lblTitle.AutoSize = true;
			this.lblTitle.Font = new System.Drawing.Font("Forte", 72F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.lblTitle.ForeColor = System.Drawing.Color.White;
			this.lblTitle.Location = new System.Drawing.Point(26, 111);
			this.lblTitle.Name = "lblTitle";
			this.lblTitle.Size = new System.Drawing.Size(642, 105);
			this.lblTitle.TabIndex = 0;
			this.lblTitle.Text = "Lucky Memory";
			// 
			// lblAutor
			// 
			this.lblAutor.AutoSize = true;
			this.lblAutor.Font = new System.Drawing.Font("Agency FB", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.lblAutor.ForeColor = System.Drawing.Color.White;
			this.lblAutor.Location = new System.Drawing.Point(24, 313);
			this.lblAutor.Name = "lblAutor";
			this.lblAutor.Size = new System.Drawing.Size(133, 25);
			this.lblAutor.TabIndex = 1;
			this.lblAutor.Text = "By Christian Salazar";
			// 
			// timerIntro
			// 
			this.timerIntro.Tick += new System.EventHandler(this.timerIntro_Tick);
			// 
			// frmIntro
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.BackColor = System.Drawing.Color.DarkSlateGray;
			this.ClientSize = new System.Drawing.Size(698, 360);
			this.ControlBox = false;
			this.Controls.Add(this.lblAutor);
			this.Controls.Add(this.lblTitle);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.Name = "frmIntro";
			this.Text = "Lucky Memory";
			this.Load += new System.EventHandler(this.frmIntro_Load);
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.Label lblTitle;
		private System.Windows.Forms.Label lblAutor;
		private System.Windows.Forms.Timer timerIntro;
	}
}