using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project_AgenciaAutos
{
	internal class cConcesionaria
	{
		// Propiedades
		private cArchivos ObjArchivos = new cArchivos();
		private int pUltimoId;

		// Metodos
		private void CursorPos(int ver)
		{
			if (ver == 1)
			{
				Console.WriteLine();
				Console.CursorLeft = (Console.WindowWidth / 2) - 35 / 2;
			}
			else
			{
				Console.CursorLeft = (Console.WindowWidth / 2) - 120 / 2;
			}
		}
		public void InitList(ref List<cVehiculos> ListaVehiculos)
		{
			FileStream Archivo;
			StreamReader Leer;
			string Data;
			string[] DataSplit;

			if (File.Exists("Vehiculos.txt"))
			{
				Archivo = new FileStream("Vehiculos.txt", FileMode.Open);
				Leer = new StreamReader(Archivo);
				ListaVehiculos.Clear();
				while (Leer.EndOfStream == false)
				{
					Data = Leer.ReadLine();
					DataSplit = Data.Split(';');
					if (DataSplit[1] == "AUTO")
					{
						ListaVehiculos.Add(new cAutos(int.Parse(DataSplit[0]), DataSplit[1], int.Parse(DataSplit[2]), DataSplit[3], DataSplit[4], DataSplit[5], DataSplit[6], DataSplit[7], DataSplit[8], DataSplit[9], double.Parse(DataSplit[10]), double.Parse(DataSplit[11]) ) );
					}
					else if (DataSplit[1] == "CAMION")
					{
						ListaVehiculos.Add(new cCamiones(int.Parse(DataSplit[0]), DataSplit[1], int.Parse(DataSplit[2]), DataSplit[3], DataSplit[4], DataSplit[5], DataSplit[6], DataSplit[7], DataSplit[8], DataSplit[9], double.Parse(DataSplit[10]), double.Parse(DataSplit[11]), bool.Parse(DataSplit[12]), double.Parse(DataSplit[13]), double.Parse(DataSplit[14]) ) );
					}
					else
					{
						ListaVehiculos.Add(new cMotos(int.Parse(DataSplit[0]), DataSplit[1], int.Parse(DataSplit[2]), DataSplit[3], DataSplit[4], DataSplit[5], DataSplit[6], DataSplit[7], DataSplit[8], DataSplit[9], double.Parse(DataSplit[10]), double.Parse(DataSplit[11]), int.Parse(DataSplit[15]) ) );
					}
					
					pUltimoId = int.Parse(DataSplit[0]);
				}
				Archivo.Close();
				Leer.Close();
				Mostrar(ListaVehiculos);
			}
			else
			{
				Archivo = new FileStream("Vehiculos.txt", FileMode.Create);
				Archivo.Close();
				InitList(ref ListaVehiculos);
			}
		}
		private void Mostrar(List<cVehiculos> ListaVehiculos)
		{
			if (ListaVehiculos.Count == 0)
			{
				CursorPos(2);
				Console.WriteLine("┌──────┬─────────────────────┬──────────────────────┬───────┬────────────────────┬───────────────────────┬────────────┐");
				CursorPos(2);
				Console.BackgroundColor = ConsoleColor.DarkGray; Console.ForegroundColor = ConsoleColor.Black;
				Console.WriteLine("│ ID   │ Marca               │ Modelo               │  Año  │ Precio             │ Observaciones         │ Color      │");
				Console.ResetColor();
				CursorPos(2);
				Console.WriteLine("├──────┼─────────────────────┼──────────────────────┼───────┼────────────────────┼───────────────────────┼────────────┤");
				CursorPos(2);
				Console.WriteLine($"│ {null,-4} │ {null,-19} │ {null,-20} │ {null,-5} │ ${null,-17} │ {null,-21} │ {null,-10} │");
				CursorPos(2);
				Console.WriteLine("└──────┴─────────────────────┴──────────────────────┴───────┴────────────────────┴───────────────────────┴────────────┘");
				CursorPos(2);
				Console.WriteLine("┌──────────────┬──────────────┬───────────┬────────────┬──────────────────────────────────────────────────────────────┐");
				CursorPos(2);
				Console.WriteLine("│ Combustible  │ Kilometraje  │ Segmento  │ Patente    │                                                              │");
				CursorPos(2);
				Console.WriteLine("├──────────────┼──────────────┼───────────┼────────────┼──────────────────────────────────────────────────────────────┤");
				CursorPos(2);
				Console.WriteLine($"│ {null,-12} │ {null,-10}km │ {null,-9} │ {null,-10} │ {null,-60} │");
				CursorPos(2);
				Console.WriteLine("└──────────────┴──────────────┴───────────┴────────────┴──────────────────────────────────────────────────────────────┘");
				CursorPos(1);
				Console.WriteLine("  NO TIENE VEHICULOS REGISTRADOS\n");
			}
			foreach (cVehiculos item in ListaVehiculos)
			{
				CursorPos(2);
				Console.WriteLine("┌──────┬─────────────────────┬──────────────────────┬───────┬────────────────────┬───────────────────────┬────────────┐");
				CursorPos(2);
				Console.BackgroundColor = ConsoleColor.DarkGray; Console.ForegroundColor = ConsoleColor.Black;
				Console.WriteLine("│ ID   │ Marca               │ Modelo               │  Año  │ Precio             │ Observaciones         │ Color      │");
				Console.ResetColor();
				CursorPos(2);
				Console.WriteLine("├──────┼─────────────────────┼──────────────────────┼───────┼────────────────────┼───────────────────────┼────────────┤");
				CursorPos(2);
				Console.WriteLine($"│ {item.IdVehiculo,-4} │ {item.Marca,-19} │ {item.Modelo,-20} │ {item.AnioVeh,-5} │ ${item.PreVTA,-17} │ {item.Obs,-21} │ {item.Color,-10} │");
				CursorPos(2);
				Console.WriteLine("└──────┴─────────────────────┴──────────────────────┴───────┴────────────────────┴───────────────────────┴────────────┘");
				CursorPos(2);
				if (item.TipoVeh == "AUTO")
				{
					Console.WriteLine("┌──────────────┬──────────────┬───────────┬────────────┬──────────────────────────────────────────────────────────────┐");
					CursorPos(2);
					Console.WriteLine("│ Combustible  │ Kilometraje  │ Segmento  │ Patente    │                                                              │");
					CursorPos(2);
					Console.WriteLine("├──────────────┼──────────────┼───────────┼────────────┼──────────────────────────────────────────────────────────────┤");
					CursorPos(2);
					Console.WriteLine($"│ {item.Combus,-12} │ {item.KiloM,-10}km │ {item.Seg,-9} │ {item.Patente,-10} │ {null,-60} │");
					CursorPos(2);
					Console.WriteLine("└──────────────┴──────────────┴───────────┴────────────┴──────────────────────────────────────────────────────────────┘");
				}
				else if (item.TipoVeh == "CAMION")
				{
					if (item.CajaCarga == false)
					{
						Console.WriteLine("┌──────────────┬──────────────┬───────────┬────────────┬────────────┬─────────────────────────────────────────────────┐");
						CursorPos(2);
						Console.WriteLine("│ Combustible  │ Kilometraje  │ Segmento  │ Patente    │ Caja Carga │                                                 │");
						CursorPos(2);
						Console.WriteLine("├──────────────┼──────────────┼───────────┼────────────┼────────────┼─────────────────────────────────────────────────┤");
						CursorPos(2);
						Console.WriteLine($"│ {item.Combus,-12} │ {item.KiloM,-10}km │ {item.Seg,-9} │ {item.Patente,-10} │ {"No",-10} │ {null,-47} │");
						CursorPos(2);
						Console.WriteLine("└──────────────┴──────────────┴───────────┴────────────┴────────────┴─────────────────────────────────────────────────┘");
					}
					else
					{
						Console.WriteLine("┌──────────────┬──────────────┬───────────┬────────────┬────────────┬────────────────┬──────────────┬─────────────────┐");
						CursorPos(2);
						Console.WriteLine("│ Combustible  │ Kilometraje  │ Segmento  │ Patente    │ Caja Carga │ Dimension Caja │ Carga Maxima │                 │");
						CursorPos(2);
						Console.WriteLine("├──────────────┼──────────────┼───────────┼────────────┼────────────┼────────────────┼──────────────┼─────────────────┤");
						CursorPos(2);
						Console.WriteLine($"│ {item.Combus,-12} │ {item.KiloM,-10}km │ {item.Seg,-9} │ {item.Patente,-10} │ {"Si",-10} │ {item.DimensionCaja,-12}m³ │ {item.CargaMax,-10}Kg │ {null,-15} │");
						CursorPos(2);
						Console.WriteLine("└──────────────┴──────────────┴───────────┴────────────┴────────────┴────────────────┴──────────────┴─────────────────┘");
					}
				}
				else
				{
					Console.WriteLine("┌──────────────┬──────────────┬───────────┬────────────┬────────────┬─────────────────────────────────────────────────┐");
					CursorPos(2);
					Console.WriteLine("│ Combustible  │ Kilometraje  │ Segmento  │ Patente    │ Cilindrada │                                                 │");
					CursorPos(2);
					Console.WriteLine("├──────────────┼──────────────┼───────────┼────────────┼────────────┼─────────────────────────────────────────────────┤");
					CursorPos(2);
					Console.WriteLine($"│ {item.Combus,-12} │ {item.KiloM,-10}km │ {item.Seg,-9} │ {item.Patente,-10} │ {item.Cilindrada,-8}cc │ {null,-47} │");
					CursorPos(2);
					Console.WriteLine("└──────────────┴──────────────┴───────────┴────────────┴────────────┴─────────────────────────────────────────────────┘");
				}
				Console.WriteLine("\n");
			}
		}
		public void Guardar(List<cVehiculos> ListaVehiculo)
		{
			FileStream Archivo = new FileStream("Vehiculos.txt", FileMode.Create);
			StreamWriter Grabar = new StreamWriter(Archivo);
			foreach (cVehiculos item in ListaVehiculo)
			{
				Grabar.WriteLine($"{item.IdVehiculo};{item.TipoVeh};{item.AnioVeh};{item.Marca};{item.Seg};{item.Combus};{item.Patente};{item.Modelo};{item.Obs};{item.Color};{item.KiloM};{item.PreVTA};{item.CajaCarga};{item.DimensionCaja};{item.CargaMax};{item.Cilindrada}");
			}
			Grabar.Close();
			Archivo.Close();
			pUltimoId = 0; // Tema con el ID
		}
		public void Agregar(ref List<cVehiculos> ListaVehiculos, List<cArchivos> ListaAux)
		{
			pUltimoId++;
			Console.Clear();
			string Tipo;
			do {
				CursorPos(1);
				Console.Write("Tipo de Vehiculo (Auto, Camion o Moto): ");
				Tipo = Console.ReadLine();
				if (Tipo.ToUpper() != "AUTO" && Tipo.ToUpper() != "CAMION" && Tipo.ToUpper() != "MOTO")
				{
					CursorPos(1);
					Console.WriteLine("Tipo de Vehiculo Invalido!");
				}
			} while (Tipo.ToUpper() != "AUTO" && Tipo.ToUpper() != "CAMION" && Tipo.ToUpper() != "MOTO");
			CursorPos(1);
			Console.Write("Patente: ");
			string Patente = Console.ReadLine();
			double Kilometros;
			bool Condicion1, Condicion2;
			do
			{
				CursorPos(1);
				Console.Write("Kilometros: ");
				Condicion1 = double.TryParse(ReempPuntos(Console.ReadLine()), out Kilometros);
				Condicion2 = Kilometros >= 0;
				if (!Condicion1 || !Condicion2)
				{
					CursorPos(1);
					Console.WriteLine("Kilometraje Invalido!");
				}
			} while (!Condicion1 || !Condicion2);
			int Anio;
			do
			{
				CursorPos(1);
				Console.Write("Año: ");
				Condicion1 = int.TryParse(Console.ReadLine(), out Anio);
				Condicion2 = Anio >= 1886 && Anio <= DateTime.Now.Year;
				if (!Condicion1 || !Condicion2)
				{
					CursorPos(1);
					Console.WriteLine("Año Invalido!");
				}
			} while (!Condicion1 || !Condicion2);
			string Marca = IdExtras(ListaAux, "Marcas.txt", "Marca");
			CursorPos(1);
			Console.Write("Modelo: ");
			string Modelo = Console.ReadLine();
			CursorPos(1);
			string Seg = IdExtras(ListaAux, "Segmentos.txt", "Segmento");
			string Combs = IdExtras(ListaAux, "Combustibles.txt", "Combustible");
			double PrVTA;
			do
			{
				CursorPos(1);
				Console.Write("Precio de Venta: ");
				Condicion1 = double.TryParse(ReempPuntos(Console.ReadLine()), out PrVTA);
				Condicion2 = PrVTA >= 0;
				if (!Condicion1 || !Condicion2)
				{
					CursorPos(1);
					Console.WriteLine("Precio Invalido!");
				}
			} while (!Condicion1 || !Condicion2);
			CursorPos(1);
			Console.Write("Observaciones: ");
			string Obs = Console.ReadLine();
			CursorPos(1);
			Console.Write("Color: ");
			string Color = Console.ReadLine();

			bool Caja = false;
			double DimenCaja = 0, CargaMax = 0;
			int Cilindrada = 0;
			if (Tipo.ToUpper() == "CAMION")
			{
				CursorPos(1);
				Console.Write("Tiene una Caja de Carga? (Si/No): ");
				string rsp = Console.ReadLine();
				while (rsp.ToUpper() != "SI" && rsp.ToUpper() != "NO")
				{
					CursorPos(1);
					Console.Write("Respuesta Invalida!: ");
					rsp = Console.ReadLine();
				}
				if (rsp.ToUpper() == "SI")
				{
					Caja = true;
					CursorPos(1);
					Console.Write("Dimension de la Caja (en metros)");
					double Largo;
					do
					{
						CursorPos(1);
						Console.Write("Largo: ");
						Condicion1 = double.TryParse(ReempPuntos(Console.ReadLine()), out Largo);
						Condicion2 = Largo > 0;
						if (!Condicion1 || !Condicion2)
						{
							CursorPos(1);
							Console.WriteLine("Ingreso Invalido!");
						}
					} while (!Condicion1 || !Condicion2);
					double Ancho;
					do
					{
						CursorPos(1);
						Console.Write("Ancho: ");
						Condicion1 = double.TryParse(ReempPuntos(Console.ReadLine()), out Ancho);
						Condicion2 = Ancho > 0;
						if (!Condicion1 || !Condicion2)
						{
							CursorPos(1);
							Console.WriteLine("Ingreso Invalido!");
						}
					} while (!Condicion1 || !Condicion2);
					double Alto;
					do
					{
						CursorPos(1);
						Console.Write("Alto: ");
						Condicion1 = double.TryParse(ReempPuntos(Console.ReadLine()), out Alto);
						Condicion2 = Alto > 0;
						if (!Condicion1 || !Condicion2)
						{
							CursorPos(1);
							Console.WriteLine("Ingreso Invalido!");
						}
					} while (!Condicion1 || !Condicion2);
					DimenCaja = Largo * Ancho * Alto;
					do
					{
						CursorPos(1);
						Console.Write("Peso Maximo de Carga (Kg): ");
						Condicion1 = double.TryParse(ReempPuntos(Console.ReadLine()), out CargaMax);
						Condicion2 = CargaMax > 0;
						if (!Condicion1 || !Condicion2)
						{
							CursorPos(1);
							Console.WriteLine("Ingreso Invalido!");
						}
					} while (!Condicion1 || !Condicion2);
				}
				else
				{
					Caja = false;
				}
			}
			else if (Tipo.ToUpper() == "MOTO")
			{
				CursorPos(1);
				Console.Write("Cilindrada: ");
				while (!int.TryParse(Console.ReadLine(), out Cilindrada))
				{
					Console.Write("Solo en numeros!: ");
				}
			}

			if (Tipo.ToUpper() == "AUTO")
			{
				ListaVehiculos.Add(new cAutos(pUltimoId, Tipo.ToUpper(), Anio, Marca, Seg, Combs, Patente.ToUpper(), Modelo.ToUpper(), Obs.ToUpper(), Color.ToUpper(), Kilometros, PrVTA) );
			}
			else if (Tipo.ToUpper() == "CAMION")
			{
				ListaVehiculos.Add(new cCamiones(pUltimoId, Tipo.ToUpper(), Anio, Marca, Seg, Combs, Patente.ToUpper(), Modelo.ToUpper(), Obs.ToUpper(), Color.ToUpper(), Kilometros, PrVTA, Caja, DimenCaja, CargaMax) );
			}
			else
			{
				ListaVehiculos.Add(new cMotos(pUltimoId, Tipo.ToUpper(), Anio, Marca, Seg, Combs, Patente.ToUpper(), Modelo.ToUpper(), Obs.ToUpper(), Color.ToUpper(), Kilometros, PrVTA, Cilindrada));
			}
			
			Console.Clear();
			Guardar(ListaVehiculos);
		}
		public void Actualizar(ref List<cVehiculos> ListaVehiculos, List<cArchivos> ListaAux)
		{
			bool Entero, IdValido;
			int IdMod;
			do
			{
				Console.WriteLine("\n");
				CursorPos(1);
				Console.Write("Ingrese el ID del item a modificar: ");
				Entero = int.TryParse(Console.ReadLine(), out IdMod);
				IdValido = ListaVehiculos.FindIndex(i => i.IdVehiculo == IdMod) != -1;
				if (!Entero)
				{
					CursorPos(1);
					Console.WriteLine("Debe ser un numero entero!");
				}
				if (!IdValido && Entero)
				{
					CursorPos(1);
					Console.WriteLine("Debe ser un ID valido!");
				}
			} while (!Entero || !IdValido);
			int CampoMod = 0;
			bool Condicion1, Condicion2;
			if (ListaVehiculos[ListaVehiculos.FindIndex(i => i.IdVehiculo == IdMod)].TipoVeh == "AUTO")
			{
				CursorPos(1);
				Console.Write("1 > Marca");
				CursorPos(1);
				Console.Write("2 > Modelo");
				CursorPos(1);
				Console.Write("3 > Año");
				CursorPos(1);
				Console.Write("4 > Precio");
				CursorPos(1);
				Console.Write("5 > Observaciones");
				CursorPos(1);
				Console.Write("6 > Color");
				CursorPos(1);
				Console.Write("7 > Combustible");
				CursorPos(1);
				Console.Write("8 > Kilometraje");
				CursorPos(1);
				Console.Write("9 > Segmento");
				CursorPos(1);
				Console.Write("10 > Patente");
				CursorPos(1);
				Console.Write("11 > Ninguno");
				Console.WriteLine();
				do
				{
					CursorPos(1);
					Console.Write("Que campo desea modificar?: ");
					Condicion1 = int.TryParse(Console.ReadLine(), out CampoMod);
					Condicion2 = CampoMod > 0 && CampoMod < 12;
					if (!Condicion1 || !Condicion2)
					{
						CursorPos(1);
						Console.WriteLine("Campo Invalido!");
					}
				} while (!Condicion1 || !Condicion2);
			}
			else if (ListaVehiculos[ListaVehiculos.FindIndex(i => i.IdVehiculo == IdMod)].TipoVeh == "CAMION")
			{
				CursorPos(1);
				Console.Write("1 > Marca");
				CursorPos(1);
				Console.Write("2 > Modelo");
				CursorPos(1);
				Console.Write("3 > Año");
				CursorPos(1);
				Console.Write("4 > Precio");
				CursorPos(1);
				Console.Write("5 > Observaciones");
				CursorPos(1);
				Console.Write("6 > Color");
				CursorPos(1);
				Console.Write("7 > Combustible");
				CursorPos(1);
				Console.Write("8 > Kilometraje");
				CursorPos(1);
				Console.Write("9 > Segmento");
				CursorPos(1);
				Console.Write("10 > Patente");
				CursorPos(1);
				Console.Write("11 > Caja de Carga");
				CursorPos(1);
				Console.Write("12 > Ninguno");
				Console.WriteLine();
				do
				{
					CursorPos(1);
					Console.Write("Que campo desea modificar?: ");
					Condicion1 = int.TryParse(Console.ReadLine(), out CampoMod);
					Condicion2 = CampoMod > 0 && CampoMod < 13;
					if (!Condicion1 || !Condicion2)
					{
						CursorPos(1);
						Console.WriteLine("Campo Invalido!");
					}
				} while (!Condicion1 || !Condicion2);
			}
			else
			{
				CursorPos(1);
				Console.Write("1 > Marca");
				CursorPos(1);
				Console.Write("2 > Modelo");
				CursorPos(1);
				Console.Write("3 > Año");
				CursorPos(1);
				Console.Write("4 > Precio");
				CursorPos(1);
				Console.Write("5 > Observaciones");
				CursorPos(1);
				Console.Write("6 > Color");
				CursorPos(1);
				Console.Write("7 > Combustible");
				CursorPos(1);
				Console.Write("8 > Kilometraje");
				CursorPos(1);
				Console.Write("9 > Segmento");
				CursorPos(1);
				Console.Write("10 > Patente");
				CursorPos(1);
				Console.Write("11 > Cilindrada");
				CursorPos(1);
				Console.Write("12 > Ninguno");
				Console.WriteLine();
				do
				{
					CursorPos(1);
					Console.Write("Que campo desea modificar?: ");
					Condicion1 = int.TryParse(Console.ReadLine(), out CampoMod);
					Condicion2 = CampoMod > 0 && CampoMod < 13;
					if (!Condicion1 || !Condicion2)
					{
						CursorPos(1);
						Console.WriteLine("Campo Invalido!");
					}
				} while (!Condicion1 || !Condicion2);
			}
			CursorPos(1);
			switch (CampoMod)
			{
				case 1:
					string MarcaMod = IdExtras(ListaAux, "Marcas.txt", "Marca");
					ListaVehiculos[ListaVehiculos.FindIndex(i => i.IdVehiculo == IdMod)].Marca = MarcaMod.ToUpper();
					break;
				case 2:
					Console.Write("Modelo nuevo: ");
					string ModeloMod = Console.ReadLine();
					ListaVehiculos[ListaVehiculos.FindIndex(i => i.IdVehiculo == IdMod)].Modelo = ModeloMod.ToUpper();
					break;
				case 3:
					int AnioMod;
					do
					{
						Console.Write("Año nuevo: ");
						Condicion1 = int.TryParse(Console.ReadLine(), out AnioMod);
						Condicion2 = AnioMod >= 1886 && AnioMod <= DateTime.Now.Year;
						if (!Condicion1 || !Condicion2)
						{
							CursorPos(1);
							Console.WriteLine("Año Invalido!");
						}
					} while (!Condicion1 || !Condicion2);
					ListaVehiculos[ListaVehiculos.FindIndex(i => i.IdVehiculo == IdMod)].AnioVeh = AnioMod;
					break;
				case 4:
					double PrecioMod;
					do
					{
						Console.Write("Precio de Venta nuevo: ");
						Condicion1 = double.TryParse(ReempPuntos(Console.ReadLine()), out PrecioMod);
						Condicion2 = PrecioMod >= 0;
						if (!Condicion1 || !Condicion2)
						{
							CursorPos(1);
							Console.WriteLine("Precio Invalido!");
						}
					} while (!Condicion1 || !Condicion2);
					ListaVehiculos[ListaVehiculos.FindIndex(i => i.IdVehiculo == IdMod)].PreVTA = PrecioMod;
					break;
				case 5:
					Console.Write("Observacion nueva: ");
					string ObsMod = Console.ReadLine();
					ListaVehiculos[ListaVehiculos.FindIndex(i => i.IdVehiculo == IdMod)].Obs = ObsMod;
					break;
				case 6:
					Console.Write("Color nuevo: ");
					string ColorMod = Console.ReadLine();
					ListaVehiculos[ListaVehiculos.FindIndex(i => i.IdVehiculo == IdMod)].Color = ColorMod;
					break;
				case 7:
					string CombusMod = IdExtras(ListaAux, "Combustibles.txt", "Combustible");
					ListaVehiculos[ListaVehiculos.FindIndex(i => i.IdVehiculo == IdMod)].Combus = CombusMod;
					break;
				case 8:
					double KiloMod;
					do
					{
						Console.Write("Kilometros nuevo: ");
						Condicion1 = double.TryParse(ReempPuntos(Console.ReadLine()), out KiloMod);
						Condicion2 = KiloMod >= 0;
						if (!Condicion1 || !Condicion2)
						{
							CursorPos(1);
							Console.WriteLine("Kilometraje Invalido!");
						}
					} while (!Condicion1 || !Condicion2);
					ListaVehiculos[ListaVehiculos.FindIndex(i => i.IdVehiculo == IdMod)].KiloM = KiloMod;
					break;
				case 9:
					string SegMod = IdExtras(ListaAux, "Segmentos.txt", "Segmento");
					ListaVehiculos[ListaVehiculos.FindIndex(i => i.IdVehiculo == IdMod)].Seg = SegMod;
					break;
				case 10:
					Console.Write("Patente nueva: ");
					string PatMod = Console.ReadLine();
					ListaVehiculos[ListaVehiculos.FindIndex(i => i.IdVehiculo == IdMod)].Patente = PatMod;
					break;
				case 11:
					if (ListaVehiculos[ListaVehiculos.FindIndex(i => i.IdVehiculo == IdMod)].TipoVeh == "AUTO")
					{

					}
					else
					{
						if (ListaVehiculos[ListaVehiculos.FindIndex(i => i.IdVehiculo == IdMod)].TipoVeh == "CAMION")
						{
							bool CajaMod;
							double CargaMaxMod;
							Console.Write("Tiene una Caja de Carga? (Si/No): ");
							string rsp = Console.ReadLine();
							while (rsp.ToUpper() != "SI" && rsp.ToUpper() != "NO")
							{
								CursorPos(1);
								Console.Write("Respuesta Invalida!: ");
								rsp = Console.ReadLine();
							}
							if (rsp.ToUpper() == "SI")
							{
								CajaMod = true;
								CursorPos(1);
								Console.Write("Dimension de la Caja (en metros)");
								double Largo;
								do
								{
									CursorPos(1);
									Console.Write("Largo: ");
									Condicion1 = double.TryParse(ReempPuntos(Console.ReadLine()), out Largo);
									Condicion2 = Largo > 0;
									if (!Condicion1 || !Condicion2)
									{
										CursorPos(1);
										Console.WriteLine("Ingreso Invalido!");
									}
								} while (!Condicion1 || !Condicion2);
								double Ancho;
								do
								{
									CursorPos(1);
									Console.Write("Ancho: ");
									Condicion1 = double.TryParse(ReempPuntos(Console.ReadLine()), out Ancho);
									Condicion2 = Ancho > 0;
									if (!Condicion1 || !Condicion2)
									{
										CursorPos(1);
										Console.WriteLine("Ingreso Invalido!");
									}
								} while (!Condicion1 || !Condicion2);
								double Alto;
								do
								{
									CursorPos(1);
									Console.Write("Alto: ");
									Condicion1 = double.TryParse(ReempPuntos(Console.ReadLine()), out Alto);
									Condicion2 = Alto > 0;
									if (!Condicion1 || !Condicion2)
									{
										CursorPos(1);
										Console.WriteLine("Ingreso Invalido!");
									}
								} while (!Condicion1 || !Condicion2);
								double DimenCajaMod = Largo * Ancho * Alto;
								do
								{
									CursorPos(1);
									Console.Write("Peso Maximo de Carga (Kg): ");
									Condicion1 = double.TryParse(ReempPuntos(Console.ReadLine()), out CargaMaxMod);
									Condicion2 = CargaMaxMod > 0;
									if (!Condicion1 || !Condicion2)
									{
										CursorPos(1);
										Console.WriteLine("Ingreso Invalido!");
									}
								} while (!Condicion1 || !Condicion2);
								ListaVehiculos[ListaVehiculos.FindIndex(i => i.IdVehiculo == IdMod)].CajaCarga = CajaMod;
								ListaVehiculos[ListaVehiculos.FindIndex(i => i.IdVehiculo == IdMod)].DimensionCaja = DimenCajaMod;
								ListaVehiculos[ListaVehiculos.FindIndex(i => i.IdVehiculo == IdMod)].CargaMax = CargaMaxMod;
							}
							else
							{
								CajaMod = false;
								ListaVehiculos[ListaVehiculos.FindIndex(i => i.IdVehiculo == IdMod)].CajaCarga = CajaMod;
								ListaVehiculos[ListaVehiculos.FindIndex(i => i.IdVehiculo == IdMod)].DimensionCaja = 0;
								ListaVehiculos[ListaVehiculos.FindIndex(i => i.IdVehiculo == IdMod)].CargaMax = 0;
							}
						}
						else
						{
							int CilindradaMod;
							Console.Write("Cilindrada nueva: ");
							while (!int.TryParse(Console.ReadLine(), out CilindradaMod))
							{
								Console.Write("Solo en numeros!: ");
							}
							ListaVehiculos[ListaVehiculos.FindIndex(i => i.IdVehiculo == IdMod)].Cilindrada = CilindradaMod;
						}
					}
					break;
				default:
					break;
			}
			Guardar(ListaVehiculos);
		}
		public void Eliminar(ref List<cVehiculos> ListaVehiculos)
		{
			bool Entero, IdValido;
			int IdDel;
			do
			{
				Console.WriteLine();
				CursorPos(1);
				Console.Write("ID del item a Eliminar: ");
				Entero = int.TryParse(Console.ReadLine(), out IdDel);
				IdValido = ListaVehiculos.FindIndex(i => i.IdVehiculo == IdDel) != -1;
				if (!Entero)
				{
					CursorPos(1);
					Console.WriteLine("Debe ser un numero entero!");
				}
				if (!IdValido && Entero)
				{
					CursorPos(1);
					Console.WriteLine("Debe ser un ID valido!");
				}
			} while (!Entero || !IdValido);
			ListaVehiculos.RemoveAt(ListaVehiculos.FindIndex(i => i.IdVehiculo == IdDel));
			Guardar(ListaVehiculos);
		}
		private string IdExtras(List<cArchivos> ListaAux, string txt, string title)
		{
			CursorPos(1);
			ObjArchivos.InitList(ref ListaAux, txt, title);
			int Id;
			bool Condicion, Condicion2;
			do
			{
				CursorPos(1);
				if (title[title.Length - 1] == 'a' || title[title.Length - 1] == 'd')
				{
					Console.Write($"ID de la {title} perteneciente: ");
				}
				else
				{
					Console.Write($"ID del {title} perteneciente: ");
				}
				Condicion = int.TryParse(Console.ReadLine(), out Id);
				Condicion2 = ListaAux.FindIndex(i => i.IdItem == Id) != -1;
				if (!Condicion)
				{
					CursorPos(1);
					Console.WriteLine("Debe ser un numero entero!");
				}
				if (!Condicion2 && Condicion)
				{
					CursorPos(1);
					Console.WriteLine("Debe ser un ID valido!");
				}
			} while (!Condicion || !Condicion2);
			return ListaAux[Id - 1].Item.ToString();
		}
		private string ReempPuntos(string importe)
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
	}
}
