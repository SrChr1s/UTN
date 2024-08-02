namespace Ejercicio20240520
{
    partial class frmClientes
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmClientes));
            this.dgvClientes = new System.Windows.Forms.DataGridView();
            this.MenuContextual = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.nuevoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.cmbLocalidades = new System.Windows.Forms.ComboBox();
            this.lblLocalidades = new System.Windows.Forms.Label();
            this.chkTodas = new System.Windows.Forms.CheckBox();
            this.btnFiltrar = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvClientes)).BeginInit();
            this.MenuContextual.SuspendLayout();
            this.SuspendLayout();
            // 
            // dgvClientes
            // 
            this.dgvClientes.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvClientes.ContextMenuStrip = this.MenuContextual;
            this.dgvClientes.Location = new System.Drawing.Point(12, 58);
            this.dgvClientes.Name = "dgvClientes";
            this.dgvClientes.Size = new System.Drawing.Size(984, 380);
            this.dgvClientes.TabIndex = 0;
            // 
            // MenuContextual
            // 
            this.MenuContextual.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.nuevoToolStripMenuItem});
            this.MenuContextual.Name = "contextMenuStrip1";
            this.MenuContextual.Size = new System.Drawing.Size(110, 26);
            // 
            // nuevoToolStripMenuItem
            // 
            this.nuevoToolStripMenuItem.Name = "nuevoToolStripMenuItem";
            this.nuevoToolStripMenuItem.Size = new System.Drawing.Size(109, 22);
            this.nuevoToolStripMenuItem.Text = "Nuevo";
            this.nuevoToolStripMenuItem.Click += new System.EventHandler(this.nuevoToolStripMenuItem_Click);
            // 
            // cmbLocalidades
            // 
            this.cmbLocalidades.Enabled = false;
            this.cmbLocalidades.FormattingEnabled = true;
            this.cmbLocalidades.Location = new System.Drawing.Point(12, 28);
            this.cmbLocalidades.Name = "cmbLocalidades";
            this.cmbLocalidades.Size = new System.Drawing.Size(169, 21);
            this.cmbLocalidades.TabIndex = 1;
            // 
            // lblLocalidades
            // 
            this.lblLocalidades.AutoSize = true;
            this.lblLocalidades.Location = new System.Drawing.Point(12, 12);
            this.lblLocalidades.Name = "lblLocalidades";
            this.lblLocalidades.Size = new System.Drawing.Size(64, 13);
            this.lblLocalidades.TabIndex = 2;
            this.lblLocalidades.Text = "Localidades";
            // 
            // chkTodas
            // 
            this.chkTodas.AutoSize = true;
            this.chkTodas.Checked = true;
            this.chkTodas.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chkTodas.Location = new System.Drawing.Point(190, 30);
            this.chkTodas.Name = "chkTodas";
            this.chkTodas.Size = new System.Drawing.Size(56, 17);
            this.chkTodas.TabIndex = 3;
            this.chkTodas.Text = "Todas";
            this.chkTodas.UseVisualStyleBackColor = true;
            this.chkTodas.CheckedChanged += new System.EventHandler(this.chkTodas_CheckedChanged);
            // 
            // btnFiltrar
            // 
            this.btnFiltrar.Location = new System.Drawing.Point(255, 26);
            this.btnFiltrar.Name = "btnFiltrar";
            this.btnFiltrar.Size = new System.Drawing.Size(75, 23);
            this.btnFiltrar.TabIndex = 4;
            this.btnFiltrar.Text = "Filtrar";
            this.btnFiltrar.UseVisualStyleBackColor = true;
            this.btnFiltrar.Click += new System.EventHandler(this.btnFiltrar_Click);
            // 
            // frmClientes
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.DarkSeaGreen;
            this.ClientSize = new System.Drawing.Size(1008, 450);
            this.Controls.Add(this.btnFiltrar);
            this.Controls.Add(this.chkTodas);
            this.Controls.Add(this.lblLocalidades);
            this.Controls.Add(this.cmbLocalidades);
            this.Controls.Add(this.dgvClientes);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmClientes";
            this.Text = "Clientes";
            this.Activated += new System.EventHandler(this.frmClientes_Activated);
            this.Load += new System.EventHandler(this.frmClientes_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvClientes)).EndInit();
            this.MenuContextual.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvClientes;
        private System.Windows.Forms.ContextMenuStrip MenuContextual;
        private System.Windows.Forms.ToolStripMenuItem nuevoToolStripMenuItem;
        private System.Windows.Forms.ComboBox cmbLocalidades;
        private System.Windows.Forms.Label lblLocalidades;
        private System.Windows.Forms.CheckBox chkTodas;
        private System.Windows.Forms.Button btnFiltrar;
    }
}