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
            this.modificarToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.txtLocalidad = new System.Windows.Forms.TextBox();
            this.lblLocalidad = new System.Windows.Forms.Label();
            this.btnFiltrar = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvLocalidades)).BeginInit();
            this.mnuNueva.SuspendLayout();
            this.SuspendLayout();
            // 
            // dgvLocalidades
            // 
            this.dgvLocalidades.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvLocalidades.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvLocalidades.ContextMenuStrip = this.mnuNueva;
            this.dgvLocalidades.Location = new System.Drawing.Point(12, 50);
            this.dgvLocalidades.Name = "dgvLocalidades";
            this.dgvLocalidades.RowTemplate.Height = 32;
            this.dgvLocalidades.Size = new System.Drawing.Size(461, 388);
            this.dgvLocalidades.TabIndex = 0;
            this.dgvLocalidades.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvLocalidades_CellContentClick);
            // 
            // mnuNueva
            // 
            this.mnuNueva.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuNueva,
            this.modificarToolStripMenuItem});
            this.mnuNueva.Name = "mnuNueva";
            this.mnuNueva.Size = new System.Drawing.Size(126, 48);
            // 
            // menuNueva
            // 
            this.menuNueva.Name = "menuNueva";
            this.menuNueva.Size = new System.Drawing.Size(125, 22);
            this.menuNueva.Text = "Nueva";
            this.menuNueva.Click += new System.EventHandler(this.menuNueva_Click);
            // 
            // modificarToolStripMenuItem
            // 
            this.modificarToolStripMenuItem.Name = "modificarToolStripMenuItem";
            this.modificarToolStripMenuItem.Size = new System.Drawing.Size(125, 22);
            this.modificarToolStripMenuItem.Text = "Modificar";
            this.modificarToolStripMenuItem.Click += new System.EventHandler(this.modificarToolStripMenuItem_Click);
            // 
            // txtLocalidad
            // 
            this.txtLocalidad.Location = new System.Drawing.Point(12, 24);
            this.txtLocalidad.Name = "txtLocalidad";
            this.txtLocalidad.Size = new System.Drawing.Size(180, 20);
            this.txtLocalidad.TabIndex = 1;
            this.txtLocalidad.TextChanged += new System.EventHandler(this.txtLocalidad_TextChanged);
            // 
            // lblLocalidad
            // 
            this.lblLocalidad.AutoSize = true;
            this.lblLocalidad.Location = new System.Drawing.Point(12, 8);
            this.lblLocalidad.Name = "lblLocalidad";
            this.lblLocalidad.Size = new System.Drawing.Size(53, 13);
            this.lblLocalidad.TabIndex = 2;
            this.lblLocalidad.Text = "Localidad";
            // 
            // btnFiltrar
            // 
            this.btnFiltrar.Location = new System.Drawing.Point(216, 22);
            this.btnFiltrar.Name = "btnFiltrar";
            this.btnFiltrar.Size = new System.Drawing.Size(75, 23);
            this.btnFiltrar.TabIndex = 3;
            this.btnFiltrar.Text = "Filtrar";
            this.btnFiltrar.UseVisualStyleBackColor = true;
            this.btnFiltrar.Click += new System.EventHandler(this.btnFiltrar_Click);
            // 
            // frmLocalidades
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.DarkSeaGreen;
            this.ClientSize = new System.Drawing.Size(486, 450);
            this.Controls.Add(this.btnFiltrar);
            this.Controls.Add(this.lblLocalidad);
            this.Controls.Add(this.txtLocalidad);
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
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvLocalidades;
        private System.Windows.Forms.ContextMenuStrip mnuNueva;
        private System.Windows.Forms.ToolStripMenuItem menuNueva;
        private System.Windows.Forms.ToolStripMenuItem modificarToolStripMenuItem;
        private System.Windows.Forms.TextBox txtLocalidad;
        private System.Windows.Forms.Label lblLocalidad;
        private System.Windows.Forms.Button btnFiltrar;
    }
}