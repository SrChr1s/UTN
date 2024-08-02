using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project_AgenciaAutos
{
	class cVentas
	{
		// Propiedades
		private string pFecCompra, pFecEntrega, pCli, pVeh;
		private double pSubtotal, pIVA, pDescuento;
		private int pIdVenta, pUltimoId;
		private cClientes ObjClientes = new cClientes();
		private cConcesionaria ObjAutos = new cConcesionaria();

		// Metodos de Propiedades
		public string FecCompra { get => this.pFecCompra; set => this.pFecCompra = value; }
		public string FecEntrega { get => this.pFecEntrega; set => this.pFecEntrega = value; }
		public double Subtotal { get => this.pSubtotal; set => this.pSubtotal = value; }
		public double IVA { get => this.pIVA; set => this.pIVA = value; }
		public double Descuento { get => this.pDescuento; set => this.pDescuento = value; }
		public string Cli { get => pCli; set => pCli = value; }
		public string Veh { get => pVeh; set => pVeh = value; }
		public int IdVenta { get => pIdVenta; set => pIdVenta = value; }

		// Constructores
		public cVentas() { }
		public cVentas(int IdVen, string Cliente, string Vehiculo, string FechaC, string FechaE, double SubT, double IVA, double Desc)
		{
			this.IdVenta = IdVen;
			this.Cli = Cliente;
			this.Veh = Vehiculo;
			this.FecCompra = FechaC;
			this.FecEntrega = FechaE;
			this.Subtotal = SubT;
			this.IVA = IVA;
			this.Descuento = Desc;
		}

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
		public void InitList(ref List<cVentas> ListaVentas)
		{
			FileStream Archivo;
			StreamReader Leer;
			string Data;
			string[] DataSplit;

			if (File.Exists("Ventas.txt"))
			{
				Archivo = new FileStream("Ventas.txt", FileMode.Open);
				Leer = new StreamReader(Archivo);
				ListaVentas.Clear();
				while (Leer.EndOfStream == false)
				{
					Data = Leer.ReadLine();
					DataSplit = Data.Split(';');
					ListaVentas.Add(new cVentas( int.Parse(DataSplit[0]), DataSplit[1], DataSplit[2], DataSplit[3], DataSplit[4], double.Parse(DataSplit[5]), double.Parse(DataSplit[6]), double.Parse(DataSplit[7]) ));
					pUltimoId = int.Parse(DataSplit[0]);
				}
				Archivo.Close();
				Leer.Close();
				Mostrar(ListaVentas);
			}
			else
			{
				Archivo = new FileStream("Ventas.txt", FileMode.Create);
				Archivo.Close();
				InitList(ref ListaVentas);
			}
		}
		private void Mostrar(List<cVentas> ListaVentas)
		{
			if (ListaVentas.Count == 0)
			{
				CursorPos(2);
				Console.WriteLine("┌──────┬───────────────────────────────────┬───────────────────────────────────────────┬──────────────┬───────────────┐");
				CursorPos(2);
				Console.BackgroundColor = ConsoleColor.DarkGray; Console.ForegroundColor = ConsoleColor.Black;
				Console.WriteLine("│  ID  │ Cliente                           │ Vehiculo                                  │ Fecha Compra │ Fecha Entrega │");
				Console.ResetColor();
				CursorPos(2);
				Console.WriteLine("├──────┼───────────────────────────────────┼───────────────────────────────────────────┼──────────────┼───────────────┤");
				CursorPos(2);
				Console.WriteLine($"│ {null,-4} │ {null,-33} │ {null,-41} │ {null,-12} │ {null,-13} │");
				CursorPos(2);
				Console.WriteLine("└──────┴───────────────────────────────────┴───────────────────────────────────────────┴──────────────┴───────────────┘");
				CursorPos(2);
				Console.WriteLine("┌───────────────────────────┬──────────────┬───────────────┬───────────────────────────────────────┬──────────────────┐");
				CursorPos(2);
				Console.WriteLine("│ Subtotal                  │ IVA          │ Descuento     │ Total                                 │                  │");
				CursorPos(2);
				Console.WriteLine("├───────────────────────────┼──────────────┼───────────────┼───────────────────────────────────────┼──────────────────┤");
				CursorPos(2);
				Console.WriteLine($"│ ${null,-24} │ {null,-11}% │ {null,-12}% │ ${null,-36} │ {null,-16} │");
				CursorPos(2);
				Console.WriteLine("└───────────────────────────┴──────────────┴───────────────┴───────────────────────────────────────┴──────────────────┘");
				CursorPos(1);
				Console.WriteLine("    NO TIENE VENTAS REGISTRADAS\n");
			}
			
			foreach (cVentas item in ListaVentas)
			{
				double Total = item.pSubtotal - (item.pSubtotal * (item.pDescuento * 0.01)); Total = Total + (Total * (item.pIVA * 0.01));
				CursorPos(2);
				Console.WriteLine("┌──────┬───────────────────────────────────┬───────────────────────────────────────────┬──────────────┬───────────────┐");
				CursorPos(2);
				Console.BackgroundColor = ConsoleColor.DarkGray; Console.ForegroundColor = ConsoleColor.Black;
				Console.WriteLine("│  ID  │ Cliente                           │ Vehiculo                                  │ Fecha Compra │ Fecha Entrega │");
				Console.ResetColor();
				CursorPos(2);
				Console.WriteLine("├──────┼───────────────────────────────────┼───────────────────────────────────────────┼──────────────┼───────────────┤");
				CursorPos(2);
				Console.WriteLine($"│ {item.IdVenta,-4} │ {item.Cli,-33} │ {item.Veh,-41} │ {item.FecCompra,-12} │ {item.FecEntrega,-13} │");
				CursorPos(2);
				Console.WriteLine("└──────┴───────────────────────────────────┴───────────────────────────────────────────┴──────────────┴───────────────┘");
				CursorPos(2);
				Console.WriteLine("┌───────────────────────────┬──────────────┬───────────────┬───────────────────────────────────────┬──────────────────┐");
				CursorPos(2);
				Console.WriteLine("│ Subtotal                  │ IVA          │ Descuento     │ Total                                 │                  │");
				CursorPos(2);
				Console.WriteLine("├───────────────────────────┼──────────────┼───────────────┼───────────────────────────────────────┼──────────────────┤");
				CursorPos(2);
				Console.WriteLine($"│ ${item.Subtotal,-24} │ {item.IVA,-11}% │ {item.Descuento,-12}% │ ${Total,-36} │ {null,-16} │");
				CursorPos(2);
				Console.WriteLine("└───────────────────────────┴──────────────┴───────────────┴───────────────────────────────────────┴──────────────────┘");

				Console.WriteLine("\n");
			}
		}
		private void Guardar(List<cVentas> ListaVentas)
		{
			FileStream Archivo = new FileStream("Ventas.txt", FileMode.Create);
			StreamWriter Grabar = new StreamWriter(Archivo);
			foreach (cVentas item in ListaVentas)
			{
				double Total = item.pSubtotal - (item.pSubtotal * (item.pDescuento * 0.01)); Total = Total + (Total * (item.pIVA * 0.01));
				Grabar.WriteLine($"{item.IdVenta};{item.Cli};{item.Veh};{item.FecCompra};{item.FecEntrega};{item.Subtotal};{item.IVA};{item.Descuento};{Total}");
			}
			Grabar.Close();
			Archivo.Close();
			pUltimoId = 0;
		}
		public void Agregar(ref List<cVentas> ListaVentas, List<cClientes> ListaClientes, List<cVehiculos> ListaVeh)
		{
			pUltimoId++;
			Console.Clear();
			ObjClientes.InitList(ref ListaClientes);
			int IdCli;
			bool Condicion, Condicion2;
			do
			{
				CursorPos(1);
				Console.Write("ID del Cliente: ");
				Condicion = int.TryParse(Console.ReadLine(), out IdCli);
				Condicion2 = ListaClientes.FindIndex(i => i.IdCli == IdCli) != -1;
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
			string Cliente = ListaClientes[ListaClientes.FindIndex(i => i.IdCli == IdCli)].Cliente;
			Console.Clear();
			ObjAutos.InitList(ref ListaVeh);
			int IdVeh;
			do
			{
				CursorPos(1);
				Console.Write("ID del Vehiculo: ");
				Condicion = int.TryParse(Console.ReadLine(), out IdVeh);
				Condicion2 = ListaVeh.FindIndex(i => i.IdVehiculo == IdVeh) != -1;
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
			string Vehiculo = $"{ListaVeh[ListaVeh.FindIndex(i => i.IdVehiculo == IdVeh)].Marca} {ListaVeh[ListaVeh.FindIndex(i => i.IdVehiculo == IdVeh)].Modelo}";
			CursorPos(1);
			Console.Write("Fecha de Compra: ");
			DateTime FCompra;
			while (!DateTime.TryParseExact(Console.ReadLine(), "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out FCompra))
			{
				CursorPos(1);
				Console.Write("Fecha Invalida! (01/12/2023): ");
			}
			CursorPos(1);
			Console.Write("Fecha de Entrega: ");
			DateTime FEntrega;
			while (!DateTime.TryParseExact(Console.ReadLine(), "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out FEntrega))
			{
				CursorPos(1);
				Console.Write("Fecha Invalida! (01/12/2023): ");
			}
			double SubT;
			do
			{
				CursorPos(1);
				Console.Write("Subtotal: ");
				Condicion = double.TryParse(ReempPuntos(Console.ReadLine()), out SubT);
				Condicion2 = SubT >= 0;
				if (!Condicion || !Condicion2)
				{
					CursorPos(1);
					Console.WriteLine("Subtotal Invalido!");
				}
			} while (!Condicion || !Condicion2);
			double IVA;
			do
			{
				CursorPos(1);
				Console.Write("IVA: ");
				Condicion = double.TryParse(ReempPuntos(Console.ReadLine()), out IVA);
				Condicion2 = IVA >= 0;
				if (!Condicion || !Condicion2)
				{
					CursorPos(1);
					Console.WriteLine("IVA Invalido!");
				}
			} while (!Condicion || !Condicion2);
			double Descuento;
			do
			{
				CursorPos(1);
				Console.Write("Descuento: ");
				Condicion = double.TryParse(ReempPuntos(Console.ReadLine()), out Descuento);
				Condicion2 = Descuento >= 0;
				if (!Condicion || !Condicion2)
				{
					CursorPos(1);
					Console.WriteLine("Descuento Invalido!");
				}
			} while (!Condicion || !Condicion2);
			ListaVeh[ListaVeh.FindIndex(i => i.IdVehiculo == IdVeh)].Obs = "###### VENDIDO ######";
			ObjAutos.Guardar(ListaVeh);
			ListaVentas.Add(new cVentas ( pUltimoId, Cliente, Vehiculo, FCompra.ToString("dd/MM/yyyy"), FEntrega.ToString("dd/MM/yyyy"), SubT, IVA, Descuento ));
			Console.Clear();
			Guardar(ListaVentas);
		}
		public void Actualizar(ref List<cVentas> ListaVentas, List<cClientes> ListaClientes, List<cVehiculos> ListaVeh )
		{
			bool Entero, IdValido;
			int IdMod;
			do
			{
				Console.WriteLine();
				CursorPos(1);
				Console.Write("ID del item a modificar: ");
				Entero = int.TryParse(Console.ReadLine(), out IdMod);
				IdValido = ListaVentas.FindIndex(i => i.IdVenta == IdMod) != -1;
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
			CursorPos(1);
			Console.Write("1 > Cliente");
			CursorPos(1);
			Console.Write("2 > Vehiculo");
			CursorPos(1);
			Console.Write("3 > Fecha Compra");
			CursorPos(1);
			Console.Write("4 > Fecha Entrega");
			CursorPos(1);
			Console.Write("5 > Subtotal");
			CursorPos(1);
			Console.Write("6 > IVA");
			CursorPos(1);
			Console.Write("7 > Descuento");
			CursorPos(1);
			Console.Write("8 > Ninguno");
			Console.WriteLine();
			int CampoMod;
			bool Condicion1, Condicion2;
			do
			{
				CursorPos(1);
				Console.Write("Que campo desea modificar?: ");
				Condicion1 = int.TryParse(Console.ReadLine(), out CampoMod);
				Condicion2 = CampoMod > 0 && CampoMod < 9;
				if (!Condicion1 || !Condicion2)
				{
					CursorPos(1);
					Console.WriteLine("Campo Invalido!");
				}
			} while (!Condicion1 || !Condicion2);
			switch (CampoMod)
			{
				case 1:
					ObjClientes.InitList(ref ListaClientes);
					int IdCli;
					do
					{
						CursorPos(1);
						Console.Write("ID del Cliente nuevo: ");
						Condicion1 = int.TryParse(Console.ReadLine(), out IdCli);
						Condicion2 = ListaClientes.FindIndex(i => i.IdCli == IdCli) != -1;
						if (!Condicion1)
						{
							CursorPos(1);
							Console.WriteLine("Debe ser un numero entero!");
						}
						if (!Condicion2 && Condicion1)
						{
							CursorPos(1);
							Console.WriteLine("Debe ser un ID valido!");
						}
					} while (!Condicion1 || !Condicion2);
					ListaVentas[ListaVentas.FindIndex(i => i.IdVenta == IdMod)].Cli = ListaClientes[ListaClientes.FindIndex(i => i.IdCli == IdCli)].Cliente;
					break;
				case 2:
					ObjAutos.InitList(ref ListaVeh);
					int IdVeh;
					do
					{
						CursorPos(1);
						Console.Write("ID del Vehiculo nuevo: ");
						Condicion1 = int.TryParse(Console.ReadLine(), out IdVeh);
						Condicion2 = ListaVeh.FindIndex(i => i.IdVehiculo == IdVeh) != -1;
						if (!Condicion1)
						{
							CursorPos(1);
							Console.WriteLine("Debe ser un numero entero!");
						}
						if (!Condicion2 && Condicion1)
						{
							CursorPos(1);
							Console.WriteLine("Debe ser un ID valido!");
						}
					} while (!Condicion1 || !Condicion2);
					ListaVentas[ListaVentas.FindIndex(i => i.IdVenta == IdMod)].Veh = $"{ListaVeh[ListaVeh.FindIndex(i => i.IdVehiculo == IdVeh)].Marca} {ListaVeh[ListaVeh.FindIndex(i => i.IdVehiculo == IdVeh)].Modelo}";
					break;
				case 3:
					CursorPos(1);
					Console.Write("Fecha de Compra nueva: ");
					DateTime FCompraMod;
					while (!DateTime.TryParseExact(Console.ReadLine(), "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out FCompraMod))
					{
						Console.Write("Fecha Invalida! (01/12/2023): ");
					}
					ListaVentas[ListaVentas.FindIndex(i => i.IdVenta == IdMod)].FecCompra = FCompraMod.ToString("dd/MM/yyyy");
					break;
				case 4:
					CursorPos(1);
					Console.Write("Fecha de Entrega nueva: ");
					DateTime FEntregaMod;
					while (!DateTime.TryParseExact(Console.ReadLine(), "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out FEntregaMod))
					{
						Console.Write("Fecha Invalida! (01/12/2023): ");
					}
					ListaVentas[ListaVentas.FindIndex(i => i.IdVenta == IdMod)].FecEntrega = FEntregaMod.ToString("dd/MM/yyyy");
					break;
				case 5:
					double SubTMod;
					do
					{
						CursorPos(1);
						Console.Write("Subtotal nuevo: ");
						Condicion1 = double.TryParse(ReempPuntos(Console.ReadLine()), out SubTMod);
						Condicion2 = SubTMod >= 0;
						if (!Condicion1 || !Condicion2)
						{
							CursorPos(1);
							Console.WriteLine("Subtotal Invalido!");
						}
					} while (!Condicion1 || !Condicion2);
					ListaVentas[ListaVentas.FindIndex(i => i.IdVenta == IdMod)].Subtotal = SubTMod;
					break;
				case 6:
					double IVAMod;
					do
					{
						CursorPos(1);
						Console.Write("IVA nuevo: ");
						Condicion1 = double.TryParse(ReempPuntos(Console.ReadLine()), out IVAMod);
						Condicion2 = IVAMod >= 0;
						if (!Condicion1 || !Condicion2)
						{
							CursorPos(1);
							Console.WriteLine("IVA Invalido!");
						}
					} while (!Condicion1 || !Condicion2);
					ListaVentas[ListaVentas.FindIndex(i => i.IdVenta == IdMod)].IVA = IVAMod;
					break;
				case 7:
					double DescMod;
					do
					{
						CursorPos(1);
						Console.Write("Descuento nuevo: ");
						Condicion1 = double.TryParse(ReempPuntos(Console.ReadLine()), out DescMod);
						Condicion2 = DescMod >= 0;
						if (!Condicion1 || !Condicion2)
						{
							CursorPos(1);
							Console.WriteLine("Descuento Invalido!");
						}
					} while (!Condicion1 || !Condicion2);
					ListaVentas[ListaVentas.FindIndex(i => i.IdVenta == IdMod)].Descuento = DescMod;
					break;
				default:
					break;
			}
			Guardar(ListaVentas);
		}
		public void Eliminar(ref List<cVentas> Lista)
		{
			bool Entero, IdValido;
			int IdDel;
			do
			{
				Console.WriteLine();
				CursorPos(1);
				Console.Write("ID del item a Eliminar: ");
				Entero = int.TryParse(Console.ReadLine(), out IdDel);
				IdValido = Lista.FindIndex(i => i.IdVenta == IdDel) != -1;
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
			Lista.RemoveAt(Lista.FindIndex(i => i.IdVenta == IdDel));
			Guardar(Lista);
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
