namespace PrimerParcial
{
    partial class frmParcial
    {
        /// <summary>
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmParcial));
            this.mskBoxLegajo = new System.Windows.Forms.MaskedTextBox();
            this.lblLegajo = new System.Windows.Forms.Label();
            this.lblEmpleado = new System.Windows.Forms.Label();
            this.txtEmpleado = new System.Windows.Forms.TextBox();
            this.lblFechFacturada = new System.Windows.Forms.Label();
            this.dtpFechaFacturada = new System.Windows.Forms.DateTimePicker();
            this.lblHorasTrabaj = new System.Windows.Forms.Label();
            this.cmbHorasTrabajadas = new System.Windows.Forms.ComboBox();
            this.lblImporte = new System.Windows.Forms.Label();
            this.txtImporte = new System.Windows.Forms.TextBox();
            this.gboxTrabajos = new System.Windows.Forms.GroupBox();
            this.chkCorteCesped = new System.Windows.Forms.CheckBox();
            this.chkPodaClasica = new System.Windows.Forms.CheckBox();
            this.chkTransplante = new System.Windows.Forms.CheckBox();
            this.chkExtraccionArbol = new System.Windows.Forms.CheckBox();
            this.chkPodaAltura = new System.Windows.Forms.CheckBox();
            this.btnRegistrar = new System.Windows.Forms.Button();
            this.gboxTrabajos.SuspendLayout();
            this.SuspendLayout();
            // 
            // mskBoxLegajo
            // 
            this.mskBoxLegajo.Location = new System.Drawing.Point(124, 21);
            this.mskBoxLegajo.Mask = "L-0000";
            this.mskBoxLegajo.Name = "mskBoxLegajo";
            this.mskBoxLegajo.Size = new System.Drawing.Size(100, 20);
            this.mskBoxLegajo.TabIndex = 0;
            this.mskBoxLegajo.Tag = "Legajo";
            // 
            // lblLegajo
            // 
            this.lblLegajo.AutoSize = true;
            this.lblLegajo.Location = new System.Drawing.Point(76, 24);
            this.lblLegajo.Name = "lblLegajo";
            this.lblLegajo.Size = new System.Drawing.Size(42, 13);
            this.lblLegajo.TabIndex = 1;
            this.lblLegajo.Text = "Legajo:";
            // 
            // lblEmpleado
            // 
            this.lblEmpleado.AutoSize = true;
            this.lblEmpleado.BackColor = System.Drawing.SystemColors.Control;
            this.lblEmpleado.Location = new System.Drawing.Point(61, 50);
            this.lblEmpleado.Name = "lblEmpleado";
            this.lblEmpleado.Size = new System.Drawing.Size(57, 13);
            this.lblEmpleado.TabIndex = 2;
            this.lblEmpleado.Text = "Empleado:";
            // 
            // txtEmpleado
            // 
            this.txtEmpleado.Location = new System.Drawing.Point(124, 47);
            this.txtEmpleado.MaxLength = 20;
            this.txtEmpleado.Name = "txtEmpleado";
            this.txtEmpleado.Size = new System.Drawing.Size(182, 20);
            this.txtEmpleado.TabIndex = 3;
            this.txtEmpleado.Tag = "Empleado";
            // 
            // lblFechFacturada
            // 
            this.lblFechFacturada.AutoSize = true;
            this.lblFechFacturada.Location = new System.Drawing.Point(27, 76);
            this.lblFechFacturada.Name = "lblFechFacturada";
            this.lblFechFacturada.Size = new System.Drawing.Size(91, 13);
            this.lblFechFacturada.TabIndex = 4;
            this.lblFechFacturada.Text = "Fecha Facturada:";
            // 
            // dtpFechaFacturada
            // 
            this.dtpFechaFacturada.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpFechaFacturada.Location = new System.Drawing.Point(124, 73);
            this.dtpFechaFacturada.Name = "dtpFechaFacturada";
            this.dtpFechaFacturada.Size = new System.Drawing.Size(100, 20);
            this.dtpFechaFacturada.TabIndex = 5;
            // 
            // lblHorasTrabaj
            // 
            this.lblHorasTrabaj.AutoSize = true;
            this.lblHorasTrabaj.Location = new System.Drawing.Point(24, 107);
            this.lblHorasTrabaj.Name = "lblHorasTrabaj";
            this.lblHorasTrabaj.Size = new System.Drawing.Size(94, 13);
            this.lblHorasTrabaj.TabIndex = 6;
            this.lblHorasTrabaj.Text = "Horas Trabajadas:";
            // 
            // cmbHorasTrabajadas
            // 
            this.cmbHorasTrabajadas.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbHorasTrabajadas.FormattingEnabled = true;
            this.cmbHorasTrabajadas.Location = new System.Drawing.Point(124, 104);
            this.cmbHorasTrabajadas.Name = "cmbHorasTrabajadas";
            this.cmbHorasTrabajadas.Size = new System.Drawing.Size(60, 21);
            this.cmbHorasTrabajadas.TabIndex = 7;
            // 
            // lblImporte
            // 
            this.lblImporte.AutoSize = true;
            this.lblImporte.Location = new System.Drawing.Point(33, 140);
            this.lblImporte.Name = "lblImporte";
            this.lblImporte.Size = new System.Drawing.Size(85, 13);
            this.lblImporte.TabIndex = 8;
            this.lblImporte.Text = "Importe a Pagar:";
            // 
            // txtImporte
            // 
            this.txtImporte.Location = new System.Drawing.Point(124, 137);
            this.txtImporte.MaxLength = 255;
            this.txtImporte.Name = "txtImporte";
            this.txtImporte.Size = new System.Drawing.Size(100, 20);
            this.txtImporte.TabIndex = 9;
            this.txtImporte.Tag = "Importe";
            // 
            // gboxTrabajos
            // 
            this.gboxTrabajos.Controls.Add(this.chkPodaAltura);
            this.gboxTrabajos.Controls.Add(this.chkExtraccionArbol);
            this.gboxTrabajos.Controls.Add(this.chkTransplante);
            this.gboxTrabajos.Controls.Add(this.chkPodaClasica);
            this.gboxTrabajos.Controls.Add(this.chkCorteCesped);
            this.gboxTrabajos.Location = new System.Drawing.Point(45, 184);
            this.gboxTrabajos.Name = "gboxTrabajos";
            this.gboxTrabajos.Size = new System.Drawing.Size(252, 100);
            this.gboxTrabajos.TabIndex = 10;
            this.gboxTrabajos.TabStop = false;
            this.gboxTrabajos.Text = "Trabajos Realizados";
            // 
            // chkCorteCesped
            // 
            this.chkCorteCesped.AutoSize = true;
            this.chkCorteCesped.Location = new System.Drawing.Point(15, 29);
            this.chkCorteCesped.Name = "chkCorteCesped";
            this.chkCorteCesped.Size = new System.Drawing.Size(105, 17);
            this.chkCorteCesped.TabIndex = 0;
            this.chkCorteCesped.Tag = "Corte de Cesped";
            this.chkCorteCesped.Text = "Corte de Cesped";
            this.chkCorteCesped.UseVisualStyleBackColor = true;
            // 
            // chkPodaClasica
            // 
            this.chkPodaClasica.AutoSize = true;
            this.chkPodaClasica.Location = new System.Drawing.Point(15, 52);
            this.chkPodaClasica.Name = "chkPodaClasica";
            this.chkPodaClasica.Size = new System.Drawing.Size(88, 17);
            this.chkPodaClasica.TabIndex = 1;
            this.chkPodaClasica.Tag = "Poda Clasica";
            this.chkPodaClasica.Text = "Poda Clasica";
            this.chkPodaClasica.UseVisualStyleBackColor = true;
            // 
            // chkTransplante
            // 
            this.chkTransplante.AutoSize = true;
            this.chkTransplante.Location = new System.Drawing.Point(15, 75);
            this.chkTransplante.Name = "chkTransplante";
            this.chkTransplante.Size = new System.Drawing.Size(82, 17);
            this.chkTransplante.TabIndex = 2;
            this.chkTransplante.Tag = "Transplante";
            this.chkTransplante.Text = "Transplante";
            this.chkTransplante.UseVisualStyleBackColor = true;
            // 
            // chkExtraccionArbol
            // 
            this.chkExtraccionArbol.AutoSize = true;
            this.chkExtraccionArbol.Location = new System.Drawing.Point(126, 29);
            this.chkExtraccionArbol.Name = "chkExtraccionArbol";
            this.chkExtraccionArbol.Size = new System.Drawing.Size(117, 17);
            this.chkExtraccionArbol.TabIndex = 3;
            this.chkExtraccionArbol.Tag = "Extraccion de arbol";
            this.chkExtraccionArbol.Text = "Extracción de árbol";
            this.chkExtraccionArbol.UseVisualStyleBackColor = true;
            // 
            // chkPodaAltura
            // 
            this.chkPodaAltura.AutoSize = true;
            this.chkPodaAltura.Location = new System.Drawing.Point(126, 52);
            this.chkPodaAltura.Name = "chkPodaAltura";
            this.chkPodaAltura.Size = new System.Drawing.Size(96, 17);
            this.chkPodaAltura.TabIndex = 4;
            this.chkPodaAltura.Tag = "Poda en Altura";
            this.chkPodaAltura.Text = "Poda en Altura";
            this.chkPodaAltura.UseVisualStyleBackColor = true;
            // 
            // btnRegistrar
            // 
            this.btnRegistrar.Location = new System.Drawing.Point(125, 302);
            this.btnRegistrar.Name = "btnRegistrar";
            this.btnRegistrar.Size = new System.Drawing.Size(86, 36);
            this.btnRegistrar.TabIndex = 11;
            this.btnRegistrar.Text = "Registrar";
            this.btnRegistrar.UseVisualStyleBackColor = true;
            this.btnRegistrar.Click += new System.EventHandler(this.btnRegistrar_Click);
            // 
            // frmParcial
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(342, 361);
            this.Controls.Add(this.btnRegistrar);
            this.Controls.Add(this.gboxTrabajos);
            this.Controls.Add(this.txtImporte);
            this.Controls.Add(this.lblImporte);
            this.Controls.Add(this.cmbHorasTrabajadas);
            this.Controls.Add(this.lblHorasTrabaj);
            this.Controls.Add(this.dtpFechaFacturada);
            this.Controls.Add(this.lblFechFacturada);
            this.Controls.Add(this.txtEmpleado);
            this.Controls.Add(this.lblEmpleado);
            this.Controls.Add(this.lblLegajo);
            this.Controls.Add(this.mskBoxLegajo);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "frmParcial";
            this.Text = "Facturación";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.frmParcial_FormClosed);
            this.Load += new System.EventHandler(this.frmParcial_Load);
            this.gboxTrabajos.ResumeLayout(false);
            this.gboxTrabajos.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MaskedTextBox mskBoxLegajo;
        private System.Windows.Forms.Label lblLegajo;
        private System.Windows.Forms.Label lblEmpleado;
        private System.Windows.Forms.TextBox txtEmpleado;
        private System.Windows.Forms.Label lblFechFacturada;
        private System.Windows.Forms.DateTimePicker dtpFechaFacturada;
        private System.Windows.Forms.Label lblHorasTrabaj;
        private System.Windows.Forms.ComboBox cmbHorasTrabajadas;
        private System.Windows.Forms.Label lblImporte;
        private System.Windows.Forms.TextBox txtImporte;
        private System.Windows.Forms.GroupBox gboxTrabajos;
        private System.Windows.Forms.CheckBox chkCorteCesped;
        private System.Windows.Forms.CheckBox chkPodaAltura;
        private System.Windows.Forms.CheckBox chkExtraccionArbol;
        private System.Windows.Forms.CheckBox chkTransplante;
        private System.Windows.Forms.CheckBox chkPodaClasica;
        private System.Windows.Forms.Button btnRegistrar;
    }
}

