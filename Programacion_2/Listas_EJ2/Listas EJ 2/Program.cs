using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Listas_EJ_2
{
	class Program
	{
		static void Main(string[] args)
		{
			//Console.Write("Ingrese el nombre del aula: ");
			//string NomSalon = Console.ReadLine();
			string NomSalon = "PruebaSalon";

			//Console.Write("Ingrese la cant. max. de Alumnos: ");
			//int CantAlumMax = ValidarEnteros();
			int CantAlumMax = 15;

			Aula Salon = new Aula
			{
				NomAula = NomSalon,
				CantAlumLim = CantAlumMax,
				ListAlumnos = new List<Alumno>()
			};

			//Console.Write("Ingrese el Legajo del estudiante: ");
			//int Leg = ValidarEnteros();
			int Leg = 16775;

			//Console.Write("Ingrese el Apellido del estudiante: ");
			//string Ape = Console.ReadLine();
			string Ape = "Salazar";

			//Console.Write("Ingrese el Nombre del estudiante: ");
			//string Nom = Console.ReadLine();
			string Nom = "Christian";

			//Console.Write("Ingrese la Fecha de Nacimiento del estudiante: ");
			//string FecNa = Console.ReadLine();
			string FecNa = "19/05/2004";

			if (Salon.ListAlumnos.Count() < Salon.CantAlumLim)
			{
				Salon.ListAlumnos.Add(new Alumno { Legajo = Leg, Apellido = Ape, Nombre = Nom, FechaNac = FecNa });
			}

			Salon.MostrarListado();

			Console.ReadKey();
		}
		static int ValidarEnteros()
		{
			int num;
			while (!int.TryParse(Console.ReadLine(), out num))
			{
				Console.Write("Debe ser un entero!: ");
			}
			return num;
		}
	}
}
