namespace JuegoMemoria
{
	partial class Winner
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
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Winner));
			this.lblWinner = new System.Windows.Forms.Label();
			this.txtName = new System.Windows.Forms.TextBox();
			this.btnSave = new System.Windows.Forms.Button();
			this.SuspendLayout();
			// 
			// lblWinner
			// 
			this.lblWinner.Font = new System.Drawing.Font("Nirmala UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.lblWinner.ForeColor = System.Drawing.Color.White;
			this.lblWinner.Location = new System.Drawing.Point(45, 28);
			this.lblWinner.Name = "lblWinner";
			this.lblWinner.Size = new System.Drawing.Size(254, 82);
			this.lblWinner.TabIndex = 0;
			this.lblWinner.Text = "¡Has Ganado!\r\n¡Ingresa tu nombre!\r\n";
			this.lblWinner.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
			// 
			// txtName
			// 
			this.txtName.Location = new System.Drawing.Point(50, 113);
			this.txtName.MaxLength = 10;
			this.txtName.Name = "txtName";
			this.txtName.Size = new System.Drawing.Size(249, 20);
			this.txtName.TabIndex = 1;
			this.txtName.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			// 
			// btnSave
			// 
			this.btnSave.Font = new System.Drawing.Font("Nirmala UI", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.btnSave.Location = new System.Drawing.Point(117, 170);
			this.btnSave.Name = "btnSave";
			this.btnSave.Size = new System.Drawing.Size(109, 40);
			this.btnSave.TabIndex = 2;
			this.btnSave.Text = "Guardar";
			this.btnSave.UseVisualStyleBackColor = true;
			this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
			// 
			// Winner
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.BackColor = System.Drawing.Color.DarkSlateGray;
			this.ClientSize = new System.Drawing.Size(340, 247);
			this.ControlBox = false;
			this.Controls.Add(this.btnSave);
			this.Controls.Add(this.txtName);
			this.Controls.Add(this.lblWinner);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.Name = "Winner";
			this.Text = "Winner";
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.Label lblWinner;
		private System.Windows.Forms.TextBox txtName;
		private System.Windows.Forms.Button btnSave;
	}
}