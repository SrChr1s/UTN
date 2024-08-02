using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Punteros
{
	class Program
	{
		unsafe static void Main(string[] args)
		{
			/*int[] Vec = { 1, 2, 3, 4, 5, 6, 7 };
			fixed(int* PunteroVec = &Vec[0])
			{
				for (int i = 0; i < Vec.Length; i++)
				{
					Console.WriteLine(*(PunteroVec + i));
				}
			}
			Console.ReadKey();*/
			/*
			Console.Write("Ingrese una cadena de texto: ");
			string Cadena = Console.ReadLine();
			string Word = Cadena.ToLower();
			int Contador = 0;
			fixed(char* PunteroCadena = &Word.ToCharArray()[0])
			{
				for (int i = 0; i < Word.Length; i++)
				{
					if (*(PunteroCadena + i) == 'a' || *(PunteroCadena + i) == 'e' || *(PunteroCadena + i) == 'i' || *(PunteroCadena + i) == 'o' || *(PunteroCadena + i) == 'u') 
					{
						Contador++;
					}
				}
			}
			Console.WriteLine($"La cantidad de vocales en la cadena es de: {Contador}");
			Console.ReadKey();
			*/
			/*
			int[] vector1 = { 20, 30, 50, 80 };
			int[] vector2 = { 10, 40, 90, 100 };
			int[] vector3 = new int[4];
			fixed(int* PunteroSuma = &vector3[0], PunteroVec1 = &vector1[0], PunteroVec2 = &vector2[0])
			{
				for (int i = 0; i < vector3.Length; i++)
				{
					Console.WriteLine(*(PunteroSuma + i) = *(PunteroVec1 + i) + *(PunteroVec2 + i));
				}
			}
			Console.ReadKey();
			*/
			/*
			int[] Vector1 = new int[10]; int Aux;
			for (int i = 0; i < Vector1.Length; i++)
			{
				Console.Write("Ingrese un numero: ");
				while (!int.TryParse(Console.ReadLine(), out Vector1[i]))
				{
					Console.Write("Debe ser un numero: ");
				}
			}
			int* PunteroAux = &Aux;
			fixed (int* PunteroVec = &Vector1[0])
			{
				for (int i = 0; i < 9; i++)
				{
					for (int j = i + 1; j < 10; j++)
					{
						if (*(PunteroVec + i) > *(PunteroVec + j))
						{
							*(PunteroAux) = *(PunteroVec + i);
							*(PunteroVec + i) = *(PunteroVec + j);
							*(PunteroVec + j) = *(PunteroAux);
						}
					}
				}
				for (int i = 0; i < 10; i++)
				{
					Console.WriteLine(*(PunteroVec + i));
				}
			}
			Console.ReadKey();
			*/
		}
	}
}
