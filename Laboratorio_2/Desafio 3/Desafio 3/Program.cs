using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Desafio_3
{
    internal class Program
    {
		static string[] Unidades = { "cero", "uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho", "nueve" };
		static string[] UnidadesEsp = { "diez", "once", "doce", "trece", "catorce", "quince", "dieciseis", "diecisiete", "dieciocho", "diecinueve" };
		static string[] Decenas = { "", "diez", "veinte", "treinta", "cuarenta", "cincuenta", "sesenta", "setenta", "ochenta", "noventa", "cien" };
		static string[] Centenas = { "", "ciento", "doscientos", "trescientos", "cuatrocientos", "quinientos", "seiscientos", "setecientos", "ochocientos", "novecientos" };
		static void Main(string[] args)
        {
            string importe;
			do
			{
				Console.Write("Ingrese un importe: ");
                importe = Console.ReadLine();
				Console.Clear();

				if (importe.ToLower() == "salir")
                {
                    break;
                }

				ReempPuntos(ref importe);

				double numero;
				while (!double.TryParse(importe, out numero))
				{
					Console.Write("El Importe a ingresar debe ser un numero: ");
					importe = Console.ReadLine();
					if (importe.ToLower() == "salir")
					{
						break;
					}
				}

				ReempPuntos(ref importe);

				Console.WriteLine($"Importe ingresado: {importe}\n");
				Console.WriteLine(ToWords(numero));
				Console.WriteLine("\nEscriba salir para finalizar el programa!");

			} while (importe.ToLower() != "salir");
		}
		static string ToWords(double importe)
		{
			int parteEnt = (int)Math.Floor(importe);
			int parteDec = (int)(Math.Round(importe - parteEnt) * 100);
			Console.WriteLine(parteDec);
			string parteEntInWords = ConvertInWords(parteEnt);
			string parteDecInWords = ConvertInWords(parteDec);

            if (parteEnt > 0 && parteDec > 0)
            {
                return parteEntInWords + " con " + parteDecInWords + " centavos";
			}
            else
            {
                return parteEntInWords;
			}
		}
        static string ConvertInWords (int num)
        {
			if (num < 10)
            {
                return ConvertUnit(num);
            }
            else if (num >= 10 && num < 20)
            {
                return ConvertUnitEsp(num);
            }
            else if(num <= 100)
            {
                return ConvertDece(num);
            }
            else if (num < 1000)
            {
                return ConvertCente(num);
            }
            else if (num < 10000)
            {
                return ConvertMil(num);
            }
            else if (num == 10000)
            {
                return "diez mil";
            }
            else
            {
                return "Numero Fuera de Rango";
            }
        }
        static string ConvertUnit(int num)
        {
			try
			{
				return Unidades[num];
			}
			catch (System.IndexOutOfRangeException)
			{

				return "Numero Fuera de Rango!";
			}
            
        }
        static string ConvertUnitEsp(int num)
        {
            return UnidadesEsp[num - 10];
        }
        static string ConvertDece(int num)
        {
            if (num % 10 == 0)
            {
                return Decenas[num / 10];
            }
            else
            {
                if (num < 10)
                {
                    return Decenas[num / 10] + Unidades[num % 10];
                }
                else if (num > 10 && num < 20)
                {
					return UnidadesEsp[num - 10];
				}
                else
                { 
					return Decenas[num / 10] + " y " + Unidades[num % 10];
				}
            }
        }
        static string ConvertCente(int num)
        {
			if (num % 100 == 0)
			{
				return Centenas[num / 100];
			}
			else
			{
				return Centenas[num / 100] + " " + ConvertDece(num % 100);
			}
		}
        static string ConvertMil(int num)
        {
			if (num % 1000 == 0)
			{
                if (num / 1000 == 1)
                {
					return "mil";
				}
                else
                {
					return Unidades[num / 1000] + " mil";
				}
			}
			else
			{
				if (num / 1000 == 1)
				{
                    if (num % 1000 > 99 && num % 1000 < 101)
                    {
                        return "mil " + Decenas[10];
					}
                    else
                    {
						return "mil " + ConvertCente(num % 1000);
					}
				}
				else
				{
					return Unidades[num / 1000] + " mil " + ConvertCente(num % 1000);
				}
			}
		}
		static void ReempPuntos(ref string importe)
		{
			for (int i = 0; i < importe.Length; i++)
			{
				if (importe[i] == '.')
				{
					importe = importe.Replace(".", ",");
				}
			}
		}
	}
}
