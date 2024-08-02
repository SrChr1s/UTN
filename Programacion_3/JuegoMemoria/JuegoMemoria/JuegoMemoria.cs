using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Rebar;
using System.Threading;
using System.Runtime.InteropServices;

namespace JuegoMemoria
{
	public partial class frmJuegoMemoria : Form
	{
		public frmJuegoMemoria()
		{
			InitializeComponent();
		}

		//####### QUITAR EL CLOSE (X) EN EL FORM DE JUEGO ########

		const int MF_BYPOSITION = 0x400;

		[DllImport("User32")]

		private static extern int RemoveMenu(IntPtr hMenu, int nPosition, int wFlags);

		[DllImport("User32")]

		private static extern IntPtr GetSystemMenu(IntPtr hWnd, bool bRevert);

		[DllImport("User32")]

		private static extern int GetMenuItemCount(IntPtr hWnd);

		//#######################################################

		public int[] TagIguales = { 0, 0 };

		public string[] pBoxNames = new string[2];

		public int Adivinados = 0;

		public int Tiempo_de_Juego = 180;

		private void SeleccionCarta(PictureBox pBox)
		{
			if (TagIguales[0] == 0)
			{
				CambioDeCarta(pBox);
				TagIguales[0] = int.Parse(pBox.Tag.ToString());
				pBoxNames[0] = pBox.Name;
				pBox.Enabled = false;
			}
			else if (TagIguales[1] == 0)
			{
				CambioDeCarta(pBox);
				TagIguales[1] = int.Parse(pBox.Tag.ToString());
				pBoxNames[1] = pBox.Name;
				pBox.Enabled = false;

				if (TagIguales[0] == TagIguales[1] + 6 || TagIguales[0] == TagIguales[1] - 6)
				{
					Thread.Sleep(150);
					foreach (PictureBox pBoxAux in panelCartasMemoria.Controls)
					{
						if (pBoxAux.Name == pBoxNames[0] || pBoxAux.Name == pBoxNames[1])
						{
							pBoxAux.Tag = "Punto";
							pBoxAux.Visible = false;
							Adivinados++;
						}
					}
				}
				else
				{
					Thread.Sleep(500);
					
					foreach (PictureBox pBoxAux in panelCartasMemoria.Controls)
					{
						if (pBoxAux.Tag.ToString() != "Punto")
						{
							pBoxAux.Image = Properties.Resources.signo_de_interrogacion;
							pBoxAux.Enabled = true;
						}
					}
				}
				TagIguales[0] = 0;
				TagIguales[1] = 0;

				pBoxNames[0] = "";
				pBoxNames[1] = "";
			}

			if (Adivinados >= 12)
			{
				Adivinados = 0;
				int puntaje = 6 * Tiempo_de_Juego;
				PlayTime.Stop();
				MessageBox.Show($"¡Has Ganado! tu puntaje es: {puntaje}", "Felicidades!", MessageBoxButtons.OK, MessageBoxIcon.Information);

				FileStream filePuntaje = new FileStream("Puntajes.txt",FileMode.Append);
				StreamWriter writerPuntaje = new StreamWriter(filePuntaje);

				writerPuntaje.WriteLine(puntaje.ToString());

				frmJuegoMemoria NuevoJuego = new frmJuegoMemoria();
				NuevoJuego.Show();
				this.Close();
			}
		}

		private void CambioDeCarta(PictureBox pBox)
		{
			switch (pBox.Tag)
			{
				case 1:
					pBox.Image = Properties.Resources.planeta;
					break;
				case 2:
					pBox.Image = Properties.Resources.espada;
					break;
				case 3:
					pBox.Image = Properties.Resources.craneo;
					break;
				case 4:
					pBox.Image = Properties.Resources.barras_de_oro;
					break;
				case 5:
					pBox.Image = Properties.Resources.fuego;
					break;
				case 6:
					pBox.Image = Properties.Resources.monstruo;
					break;
				case 7:
					pBox.Image = Properties.Resources.planeta;
					break;
				case 8:
					pBox.Image = Properties.Resources.espada;
					break;
				case 9:
					pBox.Image = Properties.Resources.craneo;
					break;
				case 10:
					pBox.Image = Properties.Resources.barras_de_oro;
					break;
				case 11:
					pBox.Image = Properties.Resources.fuego;
					break;
				case 12:
					pBox.Image = Properties.Resources.monstruo;
					break;
			}
		}
		private void JuegoNuevo()
		{
			int[] vectorRnd = new int[12];

			Random random = new Random();

			for (int i = 0; i < vectorRnd.Length; i++)
			{
				int randomNumber;
				do
				{
					randomNumber = random.Next(1, 13);
				} while (Array.IndexOf(vectorRnd, randomNumber) != -1);

				vectorRnd[i] = randomNumber;
			}

			int j = 0;

			foreach (PictureBox pBox in panelCartasMemoria.Controls)
			{
				pBox.Tag = vectorRnd[j];
				CambioDeCarta(pBox);
				pBox.Enabled = false;
				j++;
			}
		}
		private void frmJuegoMemoria_Load(object sender, EventArgs e)
		{
			this.CenterToScreen();

			IntPtr hMenu = GetSystemMenu(this.Handle, false);

			int menuItemCount = GetMenuItemCount(hMenu);

			RemoveMenu(hMenu, menuItemCount - 1, MF_BYPOSITION);
		}

		private void frmJuegoMemoria_Shown(object sender, EventArgs e)
		{
			this.Height = 513;
			btnSalir.Visible = false;
			JuegoNuevo();
			Thread.Sleep(2000);
			foreach (PictureBox pBox in panelCartasMemoria.Controls)
			{
				pBox.Image = Properties.Resources.signo_de_interrogacion;
				pBox.Enabled = true;
			}
			this.Height = 576;
			btnSalir.Visible = true;

			PlayTime.Interval = 1000;
			PlayTime.Start();
		}
		private void btnSalir_Click(object sender, EventArgs e)
		{
			frmMenu MenuJuego = new frmMenu();
			MenuJuego.Show();
			this.Close();
		}
		private void pBox_Click(object sender, EventArgs e)
		{
			PictureBox pBox = (PictureBox)sender;
			SeleccionCarta(pBox);
		}

		private void PlayTime_Tick(object sender, EventArgs e)
		{
			if (Tiempo_de_Juego > 0)
			{
				Tiempo_de_Juego--;
				int minutos = Tiempo_de_Juego / 60;
				int segundos = Tiempo_de_Juego - (minutos * 60);
				lblPlayTime.Text = $"0{minutos}:{segundos}";
			}
			else
			{
				PlayTime.Stop();
				MessageBox.Show("Se acabó el tiempo!");
			}
		}
	}
}
