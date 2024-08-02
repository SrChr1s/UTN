using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Listas_EJ_2
{
	class Alumno
	{
		private int pLegajo;
		private string pApellido;
		private string pNombre;
		private string pFechaNac;

		public Alumno()
		{

		}
		public Alumno(int leg, string ape, string nom, string fecn)
		{
			this.pLegajo = leg;
			this.pApellido = ape;
			this.pNombre = nom;
			this.pFechaNac = fecn;
		}
		public int Legajo
		{
			get
			{
				return this.pLegajo;
			}
			set
			{
				this.pLegajo = value;
			}
		}
		public string Apellido
		{
			get
			{
				return this.pApellido;
			}
			set
			{
				this.pApellido = value;
			}
		}
		public string Nombre
		{
			get
			{
				return this.pNombre;
			}
			set
			{
				this.pNombre = value;
			}
		}
		public string FechaNac
		{
			get
			{
				return this.pFechaNac;
			}
			set
			{
				this.pFechaNac = value;
			}
		}
		public void MostrarAlumno()
		{
			Console.WriteLine($"Legajo: {this.Legajo} - Apellido: {this.Apellido} - Nombre: {this.Nombre} - F.Nacimiento: {this.FechaNac}");
		}
	}
}
