using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Listas
{
	class Program
	{
		static void Main(string[] args)
		{
			List<int> Numeros = new List<int>() { 30, 10, 28, 45, 73 };
			Console.Write("Ingrese un numero a buscar: ");
			int numBusq = ValidarEntero();
			int i = 0;
			foreach (var item in Numeros)
			{
				if (item == numBusq)
				{
					Console.WriteLine($"Pos. del num. busc. en la lista: {i}");
					break;
				}
				i++;
			}
			if (i > 4)
			{
				Console.WriteLine("No se encontró");
			}
			Console.ReadKey();
		}
		static int ValidarEntero()
		{
			int num;
			while (!int.TryParse(Console.ReadLine(),out num))
			{
				Console.Write("Debe ser un entero!: ");
			}
			return num;
		}
	}
}
