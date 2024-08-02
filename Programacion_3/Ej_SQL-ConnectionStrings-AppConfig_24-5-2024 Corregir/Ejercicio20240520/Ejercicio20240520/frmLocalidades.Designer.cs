namespace Ejercicio20240520
{
    partial class frmLocalidades
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmLocalidades));
            this.dgvLocalidades = new System.Windows.Forms.DataGridView();
            this.mnuNueva = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.menuNueva = new System.Windows.Forms.ToolStripMenuItem();
            ((System.ComponentModel.ISupportInitialize)(this.dgvLocalidades)).BeginInit();
            this.mnuNueva.SuspendLayout();
            this.SuspendLayout();
            // 
            // dgvLocalidades
            // 
            this.dgvLocalidades.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvLocalidades.ContextMenuStrip = this.mnuNueva;
            this.dgvLocalidades.Location = new System.Drawing.Point(12, 50);
            this.dgvLocalidades.Name = "dgvLocalidades";
            this.dgvLocalidades.Size = new System.Drawing.Size(677, 388);
            this.dgvLocalidades.TabIndex = 0;
            // 
            // mnuNueva
            // 
            this.mnuNueva.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuNueva});
            this.mnuNueva.Name = "mnuNueva";
            this.mnuNueva.Size = new System.Drawing.Size(109, 26);
            // 
            // menuNueva
            // 
            this.menuNueva.Name = "menuNueva";
            this.menuNueva.Size = new System.Drawing.Size(108, 22);
            this.menuNueva.Text = "Nueva";
            this.menuNueva.Click += new System.EventHandler(this.menuNueva_Click);
            // 
            // frmLocalidades
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.DarkSeaGreen;
            this.ClientSize = new System.Drawing.Size(701, 450);
            this.Controls.Add(this.dgvLocalidades);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "frmLocalidades";
            this.Text = "Localidades";
            this.Activated += new System.EventHandler(this.Localidades_Activated);
            this.Load += new System.EventHandler(this.Localidades_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvLocalidades)).EndInit();
            this.mnuNueva.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvLocalidades;
        private System.Windows.Forms.ContextMenuStrip mnuNueva;
        private System.Windows.Forms.ToolStripMenuItem menuNueva;
    }
}