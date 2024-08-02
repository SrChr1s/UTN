using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace POO
{
	class Empleado
	{
		// Crear propiedades publicas es una mala practica

		public long Legajo;
		public string Apellido;
		public string Nombre;
		
		// Sobrecarga de constructores, hay más de un constructor, la diferencia entre ellos son los parametros que recibe

		public Empleado()
		{

		}
		public Empleado(long leg, string ape, string nom)
		{
			Legajo = leg;
			Apellido = ape;
			Nombre = nom;
		}

		public void MostrarDatos()
		{
			Console.WriteLine($"Legajo: {this.Legajo}, Apellido: {this.Apellido}, Nombre: {this.Nombre}");
		}
		public void CobrarSueldo()
		{
			Console.WriteLine($"Voy a cobrar");
		}
	}
	internal class Program
	{
		static void Main(string[] args)
		{
			Empleado Empleado1 = new Empleado();
			Empleado1.Legajo = 16775;
			Empleado1.Apellido = "Salazar";
			Empleado1.Nombre = "Christian";
			Empleado1.MostrarDatos();
			Empleado1.CobrarSueldo();

			Empleado Empleado2 = new Empleado(16776, "Ontiveros", "Daniel");
			Empleado2.MostrarDatos();

			Empleado Empleado3 = new Empleado();

			Console.ReadKey();
		}
	}
}
