using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Herencia
{
	class Empleado
	{
		// Propiedades
		private long pLegajo;
		private string pNombre;
		private DateTime pFecNac;
		private string pApellido;
		private int pEdad;
		private float pSueldo;

		// Metodos de Propiedades
		public long Legajo
		{
			get { return this.pLegajo; }
			set { this.pLegajo = value; }
		}
		public string Nombre
		{
			get { return this.pNombre; }
			set { this.pNombre = value; }
		}
		public DateTime FecNac
		{
			get { return this.pFecNac; }
			set { this.pFecNac = value;
				DateTime fechaActual = DateTime.Now;
				int edad = fechaActual.Year - pFecNac.Year;
				if (this.pFecNac > fechaActual.AddYears(-edad))
				{
					edad--;
				}
				this.pEdad = edad;
			}
		}
		public string Apellido
		{
			get { return this.pApellido; }
			set { this.pApellido = value; }
		}
		public int Edad
		{
			get { return this.pEdad; }
		}
		public float Sueldo
		{
			get { return this.pSueldo; }
			set { this.pSueldo = value; }
		}

		// Metodos
		public void GenerarReporte()
		{

		}
		public void MostrarDatos()
		{
			Console.WriteLine($"Legajo: {this.Legajo}, Nombre: {this.Nombre}, Fecha-Nacimiento: {this.FecNac}, Apellido: {this.Apellido}, Edad: {this.Edad}, Sueldo: {this.Sueldo}");
		}
	}
}
