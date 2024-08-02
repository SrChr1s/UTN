namespace Ej_10_04_2024
{
	partial class frmEjListado
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
			this.lsvListado = new System.Windows.Forms.ListView();
			this.lblTotal = new System.Windows.Forms.Label();
			this.btnTotal = new System.Windows.Forms.Button();
			this.btnMayor = new System.Windows.Forms.Button();
			this.lblMayor = new System.Windows.Forms.Label();
			this.dtpFechaIngreso = new System.Windows.Forms.DateTimePicker();
			this.txtNro = new System.Windows.Forms.TextBox();
			this.txtApellido = new System.Windows.Forms.TextBox();
			this.txtCuota = new System.Windows.Forms.TextBox();
			this.txtNombre = new System.Windows.Forms.TextBox();
			this.lblNro = new System.Windows.Forms.Label();
			this.lblApellido = new System.Windows.Forms.Label();
			this.lblNombre = new System.Windows.Forms.Label();
			this.lblCuota = new System.Windows.Forms.Label();
			this.btnSubmit = new System.Windows.Forms.Button();
			this.lblFechaIngre = new System.Windows.Forms.Label();
			this.SuspendLayout();
			// 
			// lsvListado
			// 
			this.lsvListado.HideSelection = false;
			this.lsvListado.Location = new System.Drawing.Point(12, 218);
			this.lsvListado.Name = "lsvListado";
			this.lsvListado.Size = new System.Drawing.Size(761, 216);
			this.lsvListado.TabIndex = 0;
			this.lsvListado.UseCompatibleStateImageBehavior = false;
			// 
			// lblTotal
			// 
			this.lblTotal.BackColor = System.Drawing.SystemColors.Control;
			this.lblTotal.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
			this.lblTotal.Font = new System.Drawing.Font("Monospac821 BT", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.lblTotal.ForeColor = System.Drawing.Color.Red;
			this.lblTotal.Location = new System.Drawing.Point(674, 449);
			this.lblTotal.Name = "lblTotal";
			this.lblTotal.Size = new System.Drawing.Size(82, 23);
			this.lblTotal.TabIndex = 1;
			this.lblTotal.Text = "$0";
			this.lblTotal.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
			// 
			// btnTotal
			// 
			this.btnTotal.Location = new System.Drawing.Point(571, 449);
			this.btnTotal.Name = "btnTotal";
			this.btnTotal.Size = new System.Drawing.Size(75, 23);
			this.btnTotal.TabIndex = 2;
			this.btnTotal.Text = "Total";
			this.btnTotal.UseVisualStyleBackColor = true;
			this.btnTotal.Click += new System.EventHandler(this.btnTotal_Click);
			// 
			// btnMayor
			// 
			this.btnMayor.Location = new System.Drawing.Point(571, 489);
			this.btnMayor.Name = "btnMayor";
			this.btnMayor.Size = new System.Drawing.Size(75, 23);
			this.btnMayor.TabIndex = 4;
			this.btnMayor.Text = "Mayor";
			this.btnMayor.UseVisualStyleBackColor = true;
			this.btnMayor.Click += new System.EventHandler(this.button1_Click);
			// 
			// lblMayor
			// 
			this.lblMayor.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
			this.lblMayor.Font = new System.Drawing.Font("Monospac821 BT", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.lblMayor.ForeColor = System.Drawing.Color.Red;
			this.lblMayor.Location = new System.Drawing.Point(674, 489);
			this.lblMayor.Name = "lblMayor";
			this.lblMayor.Size = new System.Drawing.Size(82, 23);
			this.lblMayor.TabIndex = 5;
			this.lblMayor.Text = "$0";
			this.lblMayor.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
			// 
			// dtpFechaIngreso
			// 
			this.dtpFechaIngreso.Format = System.Windows.Forms.DateTimePickerFormat.Short;
			this.dtpFechaIngreso.Location = new System.Drawing.Point(547, 36);
			this.dtpFechaIngreso.Name = "dtpFechaIngreso";
			this.dtpFechaIngreso.Size = new System.Drawing.Size(82, 20);
			this.dtpFechaIngreso.TabIndex = 6;
			// 
			// txtNro
			// 
			this.txtNro.Location = new System.Drawing.Point(17, 36);
			this.txtNro.MaxLength = 10;
			this.txtNro.Name = "txtNro";
			this.txtNro.Size = new System.Drawing.Size(100, 20);
			this.txtNro.TabIndex = 7;
			// 
			// txtApellido
			// 
			this.txtApellido.Location = new System.Drawing.Point(150, 36);
			this.txtApellido.MaxLength = 25;
			this.txtApellido.Name = "txtApellido";
			this.txtApellido.Size = new System.Drawing.Size(100, 20);
			this.txtApellido.TabIndex = 9;
			// 
			// txtCuota
			// 
			this.txtCuota.Location = new System.Drawing.Point(415, 36);
			this.txtCuota.MaxLength = 10;
			this.txtCuota.Name = "txtCuota";
			this.txtCuota.Size = new System.Drawing.Size(100, 20);
			this.txtCuota.TabIndex = 10;
			// 
			// txtNombre
			// 
			this.txtNombre.Location = new System.Drawing.Point(282, 36);
			this.txtNombre.MaxLength = 25;
			this.txtNombre.Name = "txtNombre";
			this.txtNombre.Size = new System.Drawing.Size(100, 20);
			this.txtNombre.TabIndex = 11;
			// 
			// lblNro
			// 
			this.lblNro.AutoSize = true;
			this.lblNro.Location = new System.Drawing.Point(14, 20);
			this.lblNro.Name = "lblNro";
			this.lblNro.Size = new System.Drawing.Size(44, 13);
			this.lblNro.TabIndex = 12;
			this.lblNro.Text = "Número";
			this.lblNro.Click += new System.EventHandler(this.label1_Click);
			// 
			// lblApellido
			// 
			this.lblApellido.AutoSize = true;
			this.lblApellido.Location = new System.Drawing.Point(147, 20);
			this.lblApellido.Name = "lblApellido";
			this.lblApellido.Size = new System.Drawing.Size(44, 13);
			this.lblApellido.TabIndex = 13;
			this.lblApellido.Text = "Apellido";
			// 
			// lblNombre
			// 
			this.lblNombre.AutoSize = true;
			this.lblNombre.Location = new System.Drawing.Point(279, 20);
			this.lblNombre.Name = "lblNombre";
			this.lblNombre.Size = new System.Drawing.Size(44, 13);
			this.lblNombre.TabIndex = 14;
			this.lblNombre.Text = "Nombre";
			// 
			// lblCuota
			// 
			this.lblCuota.AutoSize = true;
			this.lblCuota.Location = new System.Drawing.Point(412, 20);
			this.lblCuota.Name = "lblCuota";
			this.lblCuota.Size = new System.Drawing.Size(35, 13);
			this.lblCuota.TabIndex = 15;
			this.lblCuota.Text = "Cuota";
			// 
			// btnSubmit
			// 
			this.btnSubmit.Location = new System.Drawing.Point(660, 34);
			this.btnSubmit.Name = "btnSubmit";
			this.btnSubmit.Size = new System.Drawing.Size(75, 23);
			this.btnSubmit.TabIndex = 16;
			this.btnSubmit.Text = "Agregar";
			this.btnSubmit.UseVisualStyleBackColor = true;
			this.btnSubmit.Click += new System.EventHandler(this.btnSubmit_Click);
			// 
			// lblFechaIngre
			// 
			this.lblFechaIngre.AutoSize = true;
			this.lblFechaIngre.Location = new System.Drawing.Point(544, 20);
			this.lblFechaIngre.Name = "lblFechaIngre";
			this.lblFechaIngre.Size = new System.Drawing.Size(75, 13);
			this.lblFechaIngre.TabIndex = 17;
			this.lblFechaIngre.Text = "Fecha Ingreso";
			// 
			// frmEjListado
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(785, 521);
			this.Controls.Add(this.lblFechaIngre);
			this.Controls.Add(this.btnSubmit);
			this.Controls.Add(this.lblCuota);
			this.Controls.Add(this.lblNombre);
			this.Controls.Add(this.lblApellido);
			this.Controls.Add(this.lblNro);
			this.Controls.Add(this.txtNombre);
			this.Controls.Add(this.txtCuota);
			this.Controls.Add(this.txtApellido);
			this.Controls.Add(this.txtNro);
			this.Controls.Add(this.dtpFechaIngreso);
			this.Controls.Add(this.lblMayor);
			this.Controls.Add(this.btnMayor);
			this.Controls.Add(this.btnTotal);
			this.Controls.Add(this.lblTotal);
			this.Controls.Add(this.lsvListado);
			this.Name = "frmEjListado";
			this.Text = "Listado de socios";
			this.Load += new System.EventHandler(this.frmEjListado_Load);
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.ListView lsvListado;
		private System.Windows.Forms.Label lblTotal;
		private System.Windows.Forms.Button btnTotal;
		private System.Windows.Forms.Button btnMayor;
		private System.Windows.Forms.Label lblMayor;
		private System.Windows.Forms.DateTimePicker dtpFechaIngreso;
		private System.Windows.Forms.TextBox txtNro;
		private System.Windows.Forms.TextBox txtApellido;
		private System.Windows.Forms.TextBox txtCuota;
		private System.Windows.Forms.TextBox txtNombre;
		private System.Windows.Forms.Label lblNro;
		private System.Windows.Forms.Label lblApellido;
		private System.Windows.Forms.Label lblNombre;
		private System.Windows.Forms.Label lblCuota;
		private System.Windows.Forms.Button btnSubmit;
		private System.Windows.Forms.Label lblFechaIngre;
	}
}

