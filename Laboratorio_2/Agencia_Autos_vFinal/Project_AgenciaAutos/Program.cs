using System;
using System.Collections.Generic;
using System.Threading;

namespace Project_AgenciaAutos
{
	internal class Program
	{
		static void Main(string[] args)
		{

			int MenuActual = 0, SubmenuActual = 0, ItemActual = 2;

			bool Salir = false, Agregar = false, Actualizar = false, Eliminar = false;

			List<cArchivos> Lista = new List<cArchivos>();
			List<cArchivos> ListaAux = new List<cArchivos>();
			List<cClientes> ListaClientes = new List<cClientes>();
			List<cVehiculos> ListaVehiculos = new List<cVehiculos>();
			List<cVentas> ListaVentas = new List<cVentas>();

			Console.Title = "Agencia de Autos";
			Console.CursorVisible = false;
			
			cVarios Cadenas = new cVarios();
			cArchivos Archivos = new cArchivos();
			cClientes Clientes = new cClientes();
			cConcesionaria Vehiculos = new cConcesionaria();
			cVentas Ventas = new cVentas();

			Console.CursorTop = (Console.WindowHeight / 2 - Cadenas.ArtWelcome.Length / 2);

			foreach (var linea in Cadenas.ArtWelcome)
			{
				Console.CursorLeft = (Console.WindowWidth / 2) - linea.Length / 2;
				Console.WriteLine(linea);
			}

			Thread.Sleep(1500);

			do
			{
				Console.Clear();
				if (MenuActual == 0)
				{
					Cadenas.MostrarMenu(1, ItemActual, 1); // Principal
				}
				else if (MenuActual == 1)
				{
					Cadenas.MostrarMenu(2, ItemActual, 2); // Parametricas
				}
				else
				{
					if (SubmenuActual == 0) // Clientes
					{
						Clientes.InitList(ref ListaClientes);
						Cadenas.MostrarCRUD(ItemActual);
						if (Agregar == true)
						{
							Clientes.Agregar(ref ListaClientes, ListaAux);
							Agregar = false;
							continue;
						}
						else if (Actualizar == true)
						{
							Clientes.Actualizar(ref ListaClientes, ListaAux);
							Actualizar = false;
							continue;
						}
						else if (Eliminar == true)
						{
							Clientes.Eliminar(ref ListaClientes);
							Eliminar = false;
							continue;
						}
					}
					else if (SubmenuActual == 1) // Vehiculos
					{
						Vehiculos.InitList(ref ListaVehiculos);
						Cadenas.MostrarCRUD(ItemActual);
						if (Agregar == true)
						{
							Vehiculos.Agregar(ref ListaVehiculos, ListaAux);
							Agregar = false;
							continue;
						}
						else if (Actualizar == true)
						{
							Vehiculos.Actualizar(ref ListaVehiculos, ListaAux);
							Actualizar = false;
							continue;
						}
						else if (Eliminar == true)
						{
							Vehiculos.Eliminar(ref ListaVehiculos);
							Eliminar = false;
							continue;
						}
					}
					else if (SubmenuActual == 2) // Ventas
					{
						Ventas.InitList(ref ListaVentas);
						Cadenas.MostrarCRUD(ItemActual);
						if (Agregar == true)
						{
							Ventas.Agregar(ref ListaVentas, ListaClientes, ListaVehiculos);
							Agregar = false;
							continue;
						}
						else if (Actualizar == true)
						{
							Ventas.Actualizar(ref ListaVentas, ListaClientes, ListaVehiculos);
							Actualizar = false;
							continue;
						}
						else if (Eliminar == true)
						{
							Ventas.Eliminar(ref ListaVentas);
							Eliminar = false;
							continue;
						}
					}
					else if (SubmenuActual == 3) // Marcas
					{
						Archivos.InitList(ref Lista, "Marcas.txt", "Marca");
						Cadenas.MostrarCRUD(ItemActual);
						if (Agregar == true)
						{
							Archivos.Agregar(ref Lista, "Marcas.txt", "Marca");
							Agregar = false;
							continue;
						}
						else if (Actualizar == true)
						{
							Archivos.Actualizar(ref Lista, "Marcas.txt", "Marca");
							Actualizar = false;
							continue;
						}
						else if (Eliminar == true)
						{
							Archivos.Eliminar(ref Lista, "Marcas.txt");
							Eliminar = false;
							continue;
						}
					}
					else if (SubmenuActual == 4) // Segmentos
					{
						Archivos.InitList(ref Lista, "Segmentos.txt", "Segmento");
						Cadenas.MostrarCRUD(ItemActual);
						if (Agregar == true)
						{
							Archivos.Agregar(ref Lista, "Segmentos.txt", "Segmento");
							Agregar = false;
							continue;
						}
						else if (Actualizar == true)
						{
							Archivos.Actualizar(ref Lista, "Segmentos.txt", "Segmento");
							Actualizar = false;
							continue;
						}
						else if (Eliminar == true)
						{
							Archivos.Eliminar(ref Lista, "Segmentos.txt");
							Eliminar = false;
							continue;
						}
					}
					else if (SubmenuActual == 5) // Combustibles
					{
						Archivos.InitList(ref Lista, "Combustibles.txt", "Combustible");
						Cadenas.MostrarCRUD(ItemActual);
						if (Agregar == true)
						{
							Archivos.Agregar(ref Lista, "Combustibles.txt", "Combustible");
							Agregar = false;
							continue;
						}
						else if (Actualizar == true)
						{
							Archivos.Actualizar(ref Lista, "Combustibles.txt", "Combustible");
							Actualizar = false;
							continue;
						}
						else if (Eliminar == true)
						{
							Archivos.Eliminar(ref Lista, "Combustibles.txt");
							Eliminar = false;
							continue;
						}
					}
					else if (SubmenuActual == 6) // Localidades
					{
						Archivos.InitListLoc(ref Lista);
						Cadenas.MostrarCRUD(ItemActual);
						if (Agregar == true)
						{
							Archivos.AgregarLoc(ref Lista, ref ListaAux);
							Agregar = false;
							continue;
						}
						else if (Actualizar == true)
						{
							Archivos.ActualizarLoc(ref Lista, ref ListaAux);
							Actualizar = false;
							continue;
						}
						else if (Eliminar == true)
						{
							Archivos.Eliminar(ref Lista, "Localidades.txt");
							Eliminar = false;
							continue;
						}
					}
					else if (SubmenuActual == 7) // Provincias
					{
						Archivos.InitList(ref Lista, "Provincias.txt", "Provincia");
						Cadenas.MostrarCRUD(ItemActual);
						if (Agregar == true)
						{
							Archivos.Agregar(ref Lista, "Provincias.txt", "Provincia");
							Agregar = false;
							continue;
						}
						else if (Actualizar == true)
						{
							Archivos.Actualizar(ref Lista, "Provincias.txt", "Provincia");
							Actualizar = false;
							continue;
						}
						else if (Eliminar == true)
						{
							Archivos.Eliminar(ref Lista, "Provincias.txt");
							Eliminar = false;
							continue;
						}
					}
				}
				Cadenas.Navegacion(ref MenuActual, ref SubmenuActual, ref ItemActual, ref Salir, ref Agregar, ref Actualizar, ref Eliminar);
			} while (Salir != true);
		}
	}
}
