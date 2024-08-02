using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Threading;

namespace Programacion_Archivos
{
	class Program
	{
		static void Main(string[] args)
		{
			Console.CursorVisible = false;
			//Console.TreatControlCAsInput = true;

			bool salir = false;
			int seleccion = 2;
			string[] menu = { "Menu de Opciones", "=================", "Cargar Datos", "Leer Datos", "Salir" };
			int MenuActual = 0;
			string Datos;
			string RutaEscritorio = Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory);
			string ArchivoEnEscritorio = Path.Combine(RutaEscritorio, "Datos_Empleados.txt");
			do
			{
				Console.Clear();
				if (MenuActual == 0)
				{
					for (int i = 0; i < menu.Length; i++)
					{
						if (seleccion == i)
						{
							Console.ForegroundColor = ConsoleColor.Black;
							Console.BackgroundColor = ConsoleColor.Red;
							Console.WriteLine($"> {menu[i]} <");
							Console.ResetColor();
						}
						else
						{
							Console.WriteLine(menu[i]);
						}
					}
					Navegacion(ref salir, ref seleccion, ref MenuActual);
					Console.Clear();
				}
				else if (MenuActual == 1)
				{
					FileStream Archivo = new FileStream(ArchivoEnEscritorio, FileMode.Append); ;
					StreamWriter Grabar = new StreamWriter(Archivo);
					Console.Write("Ingrese el DNI: ");
					int dni;
					while (!int.TryParse(Console.ReadLine(), out dni) || dni.ToString().Length != 8)
					{
						Console.Write("Ingrese un número de DNI válido: ");
					}
					Console.Clear();

					Console.Write("Ingrese el Apellido: ");
					string Apellido = Console.ReadLine();
					Console.Clear();

					Console.Write("Ingrese el Nombre: ");
					string Nombre = Console.ReadLine();
					Console.Clear();

					Console.Write("Ingrese el Sueldo: ");
					float sueldo;
					while (!float.TryParse(Console.ReadLine(), out sueldo))
					{
						Console.Write("Ingrese un sueldo válido (números decimales): ");
					}
					Datos = $"{dni.ToString()};{Apellido};{Nombre};{sueldo.ToString()}";
					Grabar.WriteLine(Datos);
					Grabar.Close();
					Archivo.Close();
					MenuActual = 0;
				}
				else if (MenuActual == 2)
				{
					StreamReader Leer;
					string[] DatosSpdos;
					if (File.Exists(ArchivoEnEscritorio))
					{
						FileStream Archivo = new FileStream(ArchivoEnEscritorio, FileMode.Open);
						Leer = new StreamReader(Archivo);
						int ContEmpleados = 0; float PromSueldos = 0;
						Console.WriteLine("┌────────┬──────────┬──────────┬─────────┐");
						Console.WriteLine("│  DNI   │ Apellido │  Nombre  │ Sueldo  │");
						while (Leer.EndOfStream == false)
						{
							Datos = Leer.ReadLine();
							DatosSpdos = Datos.Split(';');
							Console.WriteLine("├────────┼──────────┼──────────┼─────────┤");
							Console.WriteLine($"│{DatosSpdos[0],-8}│{DatosSpdos[1],-10}│{DatosSpdos[2],-10}│{DatosSpdos[3],-9}│");
							ContEmpleados++; PromSueldos += float.Parse(DatosSpdos[3]);
						}
						Console.WriteLine("└────────┴──────────┴──────────┴─────────┘");
						Console.WriteLine($"\nCantidad de Empleados: {ContEmpleados}\n\nPromedio de Sueldos: {PromSueldos/ContEmpleados}");
						Console.WriteLine("\nPulse cualquier tecla para salir.");
						Leer.Close();
						Archivo.Close();
						Console.ReadKey();
					}
					MenuActual = 0;
				}

			} while (salir == false);
		}
		static void Navegacion(ref bool salir, ref int seleccion, ref int MenuActual)
		{
			ConsoleKeyInfo Tecla = Console.ReadKey();
			switch (Tecla.Key)
			{
				case ConsoleKey.DownArrow:
					if (seleccion > 3)
					{
						seleccion = 2;
					}
					else
					{
						seleccion++;
					}
					break;
				case ConsoleKey.UpArrow:
					if (seleccion < 3)
					{
						seleccion = 4;
					}
					else
					{
						seleccion--;
					}
					break;
				case ConsoleKey.Enter:
					if (MenuActual == 0)
					{
						switch (seleccion)
						{
							case 2:
								MenuActual = 1;
								break;
							case 3:
								MenuActual = 2;
								break;
							case 4:
								salir = true;
								break;
							default:
								break;
						}
						seleccion = 2;
					}
					Loading();
					break;
				default:
					break;
			}
		}
		static void Loading()
		{
			for (int i = 0; i < Console.WindowHeight - 7; i++)
			{
				Console.WriteLine("");
			}
			Console.Write("  Loading");
			Thread.Sleep(500);
			Console.Write(".");
			Thread.Sleep(500);
			Console.Write(".");
			Thread.Sleep(500);
			Console.Write(".");
			Thread.Sleep(500);
		}
	}
}