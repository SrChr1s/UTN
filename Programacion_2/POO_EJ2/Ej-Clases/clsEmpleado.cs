using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ej_Clases
{
	class clsEmpleado
	{
		// Propiedades
		private int legajo;
		private string nombre;
		private string apellido;
		private string fechaNac;
		private string genero;
		private long sueldo;

		// Constructores
		public clsEmpleado()
		{

		}

		public clsEmpleado(int leg, string nom, string ape, string fnac, string gen, long sueldo)
		{
			this.legajo = leg;
			this.nombre = nom;
			this.apellido = ape;
			this.fechaNac = fnac;
			this.genero = gen;
			this.sueldo = sueldo;
		}

		// Metodos de propiedades
		public int Legajo
		{
			get
			{
				return this.legajo;
			}
			set
			{
				this.legajo = value;
			}
		}
		public string Nombre
		{
			get
			{
				return this.nombre;
			}
			set
			{
				this.nombre = value;
			}
		}
		public string Apellido
		{
			get
			{
				return this.apellido;
			}
			set
			{
				this.apellido = value;
			}
		}
		public string FechaNac
		{
			get
			{
				return this.fechaNac;
			}
			set
			{
				this.fechaNac = value;
			}
		}
		public string Genero
		{
			get
			{
				if (this.genero == "f")
				{
					return "Femenino";
				}
				else if (this.genero == "m")
				{
					return "Masculino";
				}
				else
				{
					return "Otro";
				}
			}
			set
			{
				this.genero = value;
			}
		}
		public long Sueldo
		{
			get
			{
				return this.sueldo;
			}
			set
			{
				this.sueldo = value;
			}
		}

		// Metodos
		public string NombreCompleto()
		{
			return this.Apellido + " " + this.Nombre;
		}

		public void MostrarDatos()
		{
			Console.WriteLine($"Legajo: {this.Legajo} – Nombre completo: {this.NombreCompleto()} – Fecha Nac.: {this.FechaNac} – Genero: {this.Genero} – Sueldo: {this.Sueldo}");
		}
	}
}
