using System;
using System.Globalization;
using System.IO;

namespace Control_Stock
{
	internal class Program
	{
		static void Main(string[] args)
		{
			Console.CursorVisible = false;
			Console.Title = "Inventario Ferreteria";
			string Opcion = "";
			int MenuActual = 0;
			string Herramienta = "";
			do
			{
				Console.Clear();
				if (MenuActual == 0)
				{
					Console.Write("Menu Principal\n·Agregar (A)\n·Buscar (B)\n·Lista Completa (L)\n·Salir (S)\n\nIngrese una opcion: ");
					Opcion = Console.ReadLine().ToLower();
					while (Opcion.Length != 1) {
						Console.Write("Debe ser un solo caracter!: ");
						Opcion = Console.ReadLine().ToLower();
					}
					switch (Opcion)
					{
						case "a":
							MenuActual = 1;
						break;

						case "b":
							MenuActual = 2;
						break;

						case "l":
							MenuActual = 3;
						break;

						case "s":
						
						break;
						
						default:
							Console.WriteLine("\nOpcion no existente!");
							Console.ReadKey();
						break;
					}
				}
				else if (MenuActual == 1)
				{
					Agregar(ref MenuActual, Herramienta);
				}
				else if (MenuActual == 2 || MenuActual == 3)
				{
					BuscarListado(ref MenuActual, Herramienta);
				}
			} while (Opcion != "s");
		}
		static string ReempPuntos(string importe)
		{
			CultureInfo Region = CultureInfo.CurrentCulture;
			string SeparadorDecimal = Region.NumberFormat.CurrencyDecimalSeparator;
			if (SeparadorDecimal == ",")
			{
				for (int i = 0; i < importe.Length; i++)
				{
					if (importe[i] == '.')
					{
						importe = importe.Replace(".", ",");
					}
				}
			}
			return importe;
		}
		static void Agregar(ref int MenuActual, string Herramienta)
		{
			FileStream Archivo = new FileStream("Control_Stock.txt", FileMode.Append); ;
			StreamWriter Grabar = new StreamWriter(Archivo);
			bool Condicion; string Cod;
			do
			{
				Console.Write("Ingrese el Código (ABC-123): ");
				Cod = Console.ReadLine();
				int CondLetras = 0; int CondNumeros = 0;
				for (int i = 0; i < 3; i++)
				{
					try
					{
						if ((Cod[i] > 64 && Cod[i] < 91) || (Cod[i] > 96 && Cod[i] < 123))
						{
							CondLetras++;
						}
						if (Cod[i + 4] > 47 && Cod[i + 4] < 58)
						{
							CondNumeros++;
						}
					}
					catch (System.IndexOutOfRangeException)
					{
						Console.Write("Error! falta de caracteres\nIngrese el Código (ABC-123): ");
						Cod = Console.ReadLine();
						i = 0;
					}
				}
				Condicion = (Cod[3] == '-') && Cod.Length == 7 && (CondLetras == 3) && (CondNumeros == 3);
				if (!Condicion)
				{
					Console.WriteLine("Error! Contiene caracteres invalidos");
				}
			} while (!Condicion);
			Console.Write("Ingrese la descripcion del producto: ");
			string Descripcion = ValidarLargo(15,"descripcion");
			Console.Write("Ingrese el stock Actual: ");
			int StockA = ValidarEnteros();
			Console.Write("Ingrese el stock Minimo: ");
			int StockM = ValidarEnteros();
			Console.Write("Ingrese la marca del producto: ");
			string Marca = ValidarLargo(10,"marca");
			Console.Write("Ingrese el precio unitario del producto: ");
			float PrecioUnit = ValidarFlotantes();
			Herramienta = $"{Cod};{Descripcion};{StockA};{StockM};{Marca};{PrecioUnit}";
			Grabar.WriteLine(Herramienta);
			Grabar.Close();
			Archivo.Close();
			MenuActual = 0;
		}
		static void BuscarListado(ref int MenuActual, string Herramienta)
		{
			StreamReader Leer;
			string[] Info = new string[5];
			string MarcaBusqueda = "";
			if (MenuActual == 2)
			{
				Console.Write("Ingrese la marca a buscar: ");
				MarcaBusqueda = Console.ReadLine();
			}
			if (File.Exists("Control_Stock.txt"))
			{
				FileStream Archivo = new FileStream("Control_Stock.txt", FileMode.Open);
				Leer = new StreamReader(Archivo);
				int CantRegistros = 0;
				Console.WriteLine("\n┌───────┬───────────────┬─────┬─────┬──────────┬────────┐");
				Console.WriteLine("│Codigo │Descripcion    │St.A.│St.M.│Marca     │P. U.   │");
				Console.WriteLine("├───────┼───────────────┼─────┼─────┼──────────┼────────┤");
				while (Leer.EndOfStream == false)
				{
					Herramienta = Leer.ReadLine();
					Info = Herramienta.Split(';');
					if (MenuActual == 2 && MarcaBusqueda == Info[4])
					{
						Console.WriteLine($"│{Info[0],7}│{Info[1],-15}│{Info[2],5}│{Info[3],5}│{Info[4],-10}│{Info[5],8}│");
						CantRegistros++;
					}
					else if (MenuActual == 3)
					{
						Console.WriteLine($"│{Info[0],7}│{Info[1],-15}│{Info[2],5}│{Info[3],5}│{Info[4],-10}│{Info[5],8}│");
						CantRegistros++;
					}
				}
				Console.WriteLine("└───────┴───────────────┴─────┴─────┴──────────┴────────┘");
				Console.WriteLine($"\nCantidad de Registros Listados: {CantRegistros}");
				if (CantRegistros == 0)
				{
					Console.WriteLine("\nMarca no existente!");
				}
				Console.WriteLine("\nPulse cualquier tecla para volver.");
				Archivo.Close();
				Leer.Close();
			}
			else
			{
				Console.WriteLine("No existe Lista");
			}
			Console.ReadKey();
			MenuActual = 0;
		}
		static int ValidarEnteros()
		{
			int num;
			while (!int.TryParse(Console.ReadLine(), out num))
			{
				Console.Write("Debe ser un numero entero!: ");
			}
			if (num > 0 && num < 100000)
			{
				return num;
			}
			else if (num >= 100000)
			{
				Console.Write("Debe ser un numero menor a 6 cifras!: ");
				return ValidarEnteros();
			}
			else
			{
				Console.Write("Debe ser un numero positivo!: ");
				return ValidarEnteros();
			}
		}
		static float ValidarFlotantes()
		{
			float num;
			while (!float.TryParse(ReempPuntos(Console.ReadLine()), out num))
			{
				Console.Write("Debe ser un numero flotante!: ");
			}
			if (num > 0)
			{
				return num;
			}
			else
			{
				Console.Write("Debe ser un numero positivo!: ");
				return ValidarFlotantes();
			}
		}
		static string ValidarLargo(int MaxLargo, string Campo)
		{
			string Word = Console.ReadLine();
			while (Word.Length > MaxLargo)
			{
				Console.Write($"El campo '{Campo}' debe contar con maximo '{MaxLargo}' caracteres!: ");
				Word = Console.ReadLine();
			}
			return Word;
		}
	}
}