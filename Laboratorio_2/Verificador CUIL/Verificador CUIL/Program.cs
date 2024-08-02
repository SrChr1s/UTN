using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Verificador_CUIL
{
	internal class Program
	{
		static void Main(string[] args)
		{
			Console.CursorVisible = false;
			Console.Title = "Verificador de CUIL/CUIT";
			string cuil; bool condicion;
			do {
				Console.Write("Ingrese su CUIL/CUIT: ");
				cuil = Console.ReadLine();
				condicion = cuil.Contains("-") || !cuil.All(char.IsDigit) || (cuil.Length != 11);
				if (condicion)
				{
					Console.WriteLine("Error! Contiene caracteres invalidos o falta de caracteres");
				}
			} while (condicion);
			
			string preDni = cuil.Substring(0, cuil.Length-1);
			
			int[] preDni_array = new int[preDni.Length];
			for (int i = 0; i < preDni.Length; i++)
			{
				preDni_array[i] = int.Parse(preDni[i].ToString());
			}

			double[] Calculos = new double[3];

			int multiplicadores = 5;

			for (int i = 0; i < preDni_array.Length; i++)
			{
				Calculos[0] += (preDni_array[i] * multiplicadores);
				multiplicadores--;
				if (multiplicadores < 2)
				{
					multiplicadores = 7;
				}
			}

			Calculos[1] = Calculos[0] % 11;
			
			Calculos[2] = 11 - Calculos[1];

            //Console.WriteLine(Calculos[2]);

            if (Calculos[2].ToString() == cuil.Substring(10))
			{
				Console.WriteLine("El CUIL/CUIT es Valido!");
			}
			else
			{
				Console.WriteLine("El CUIL/CUIT no es Valido!");
			}
			Console.ReadKey();

		}
	}
}
