using Microsoft.Win32.SafeHandles;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace Project_AgenciaAutos
{
	class cClientes
	{
		// Propiedades
		private int pIdCliente, pUltimoId;
		private string pCliente, pCUIT, pDomicilio, pCorreo, pLocalidad;
		private long pTelefono;
		private cArchivos ObjArchivos = new cArchivos();

		// Metodos de propiedades
		public int IdCli { get => this.pIdCliente; set => this.pIdCliente = value; }
		public string Cliente { get => this.pCliente; set => this.pCliente = value; }
		public string CUIT { get => pCUIT; set => pCUIT = value; }
		public string Domicilio { get => pDomicilio; set => pDomicilio = value; }
		public string Correo { get => pCorreo; set => pCorreo = value; }
		public string Localidad { get => pLocalidad; set => pLocalidad = value; }
		public long Telefono { get => pTelefono; set => pTelefono = value; }

		// Constructores
		public cClientes() { }
		public cClientes(int IdCl, string Cliente, string Cuit, string Domic, string Email, string Local, long Tel)
		{
			this.IdCli = IdCl;
			this.Cliente = Cliente;
			this.CUIT = Cuit;
			this.Domicilio = Domic;
			this.Correo = Email;
			this.Localidad = Local;
			this.Telefono = Tel;
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
		public void InitList(ref List<cClientes> Lista)
		{
			FileStream Archivo;
			StreamReader Leer;
			string Data;
			string[] DataSplit;

			if (File.Exists("Clientes.txt"))
			{
				Archivo = new FileStream("Clientes.txt", FileMode.Open);
				Leer = new StreamReader(Archivo);
				Lista.Clear();
				while (Leer.EndOfStream == false)
				{
					Data = Leer.ReadLine();
					DataSplit = Data.Split(';');
					Lista.Add(new cClientes( int.Parse(DataSplit[0]), DataSplit[1], DataSplit[2], DataSplit[3], DataSplit[4], DataSplit[5], long.Parse(DataSplit[6]) ) );
					pUltimoId = int.Parse(DataSplit[0]);
				}
				Archivo.Close();
				Leer.Close();
				Mostrar(Lista);
			}
			else
			{
				Archivo = new FileStream("Clientes.txt", FileMode.Create);
				Archivo.Close();
				InitList(ref Lista);
			}
		}
		private void Mostrar(List<cClientes> ListaClientes)
		{
			if (ListaClientes.Count == 0)
			{
				CursorPos(2);
				Console.WriteLine("┌──────┬────────────────────────────────────┬───────────────┬──────────────────────────────────────────┬──────────────┐");
				CursorPos(2);
				Console.BackgroundColor = ConsoleColor.DarkGray; Console.ForegroundColor = ConsoleColor.Black;
				Console.WriteLine("│  ID  │ Cliente                            │ CUIT          │ Localidad                                │ Telefono     │");
				Console.ResetColor();
				CursorPos(2);
				Console.WriteLine("├──────┼────────────────────────────────────┼───────────────┼──────────────────────────────────────────┼──────────────┤");
				CursorPos(2);
				Console.WriteLine($"│ {null,-4} │ {null,-34} │ {null,-13} │ {null,-40} │ {null,-12} │");
				CursorPos(2);
				Console.WriteLine("└──────┴────────────────────────────────────┴───────────────┴──────────────────────────────────────────┴──────────────┘");
				CursorPos(2);
				Console.WriteLine("┌───────────────────────────────────────────┬────────────────────────────────────────────┬────────────────────────────┐");
				CursorPos(2);
				Console.WriteLine("│ Domicilio                                 │ Correo                                     │                            │");
				CursorPos(2);
				Console.WriteLine("├───────────────────────────────────────────┼────────────────────────────────────────────┼────────────────────────────┤");
				CursorPos(2);
				Console.WriteLine($"│ {null,-41} │ {null,-42} │ {null,-26} │");
				CursorPos(2);
				Console.WriteLine("└───────────────────────────────────────────┴────────────────────────────────────────────┴────────────────────────────┘");
				CursorPos(1);
				Console.WriteLine("   NO TIENE CLIENTES REGISTRADOS\n");
			}
			foreach (cClientes item in ListaClientes)
			{
				CursorPos(2);
				Console.WriteLine("┌──────┬────────────────────────────────────┬───────────────┬──────────────────────────────────────────┬──────────────┐");
				CursorPos(2);
				Console.BackgroundColor = ConsoleColor.DarkGray; Console.ForegroundColor = ConsoleColor.Black;
				Console.WriteLine("│  ID  │ Cliente                            │ CUIT          │ Localidad                                │ Telefono     │");
				Console.ResetColor();
				CursorPos(2);
				Console.WriteLine("├──────┼────────────────────────────────────┼───────────────┼──────────────────────────────────────────┼──────────────┤");
				CursorPos(2);
				Console.WriteLine($"│ {item.IdCli,-4} │ {item.Cliente,-34} │ {item.CUIT,-13} │ {item.Localidad,-40} │ {item.Telefono,-12} │");
				CursorPos(2);
				Console.WriteLine("└──────┴────────────────────────────────────┴───────────────┴──────────────────────────────────────────┴──────────────┘");
				CursorPos(2);
				Console.WriteLine("┌───────────────────────────────────────────┬────────────────────────────────────────────┬────────────────────────────┐");
				CursorPos(2);
				Console.WriteLine("│ Domicilio                                 │ Correo                                     │                            │");
				CursorPos(2);
				Console.WriteLine("├───────────────────────────────────────────┼────────────────────────────────────────────┼────────────────────────────┤");
				CursorPos(2);
				Console.WriteLine($"│ {item.Domicilio,-41} │ {item.Correo,-42} │ {null,-26} │");
				CursorPos(2);
				Console.WriteLine("└───────────────────────────────────────────┴────────────────────────────────────────────┴────────────────────────────┘");
				Console.WriteLine("\n");
			}
		}
		private void Guardar(List<cClientes> ListaClientes)
		{
			FileStream Archivo = new FileStream("Clientes.txt", FileMode.Create);
			StreamWriter Grabar = new StreamWriter(Archivo);
			foreach (cClientes item in ListaClientes)
			{
				Grabar.WriteLine($"{item.IdCli};{item.Cliente};{item.CUIT};{item.Domicilio};{item.Correo};{item.Localidad};{item.Telefono}");
			}
			Grabar.Close();
			Archivo.Close();
			pUltimoId = 0; // Tema con el ID
		}
		public void Agregar(ref List<cClientes> ListaClientes, List<cArchivos> ListaAux)
		{
			pUltimoId++;
			Console.Clear();
			CursorPos(1);
			Console.Write("Nombre: ");
			string Nombre = Console.ReadLine();
			string CUIT = VerificarCUIT();
			CursorPos(1);
			Console.Write("Domicilio: ");
			string Domicilio = Console.ReadLine();
			string Localidad = IdExtras(ListaAux, "Localidades.txt", "Localidad");
			long Tel = VerificarTel(false);
			CursorPos(1);
			Console.Write("Correo: ");
			string Correo = Console.ReadLine();
			ListaClientes.Add(new cClientes ( pUltimoId, Nombre.ToUpper(), CUIT, Domicilio.ToUpper(), Correo, Localidad, Tel ));
			Console.Clear();
			Guardar(ListaClientes);
		}
		public void Actualizar(ref List<cClientes> ListaClientes, List<cArchivos> ListaAux)
		{
			bool Entero, IdValido;
			int IdMod;
			do
			{
				Console.WriteLine("\n");
				CursorPos(1);
				Console.Write("Ingrese el ID del item a modificar: ");
				Entero = int.TryParse(Console.ReadLine(), out IdMod);
				IdValido = ListaClientes.FindIndex(i => i.IdCli == IdMod) != -1;
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
			Console.Write("2 > CUIT");
			CursorPos(1);
			Console.Write("3 > Domicilio");
			CursorPos(1);
			Console.Write("4 > Localidad");
			CursorPos(1);
			Console.Write("5 > Telefono");
			CursorPos(1);
			Console.Write("6 > Correo");
			CursorPos(1);
			Console.Write("7 > Ninguno");
			int CampoMod;
			bool Condicion1, Condicion2;
			do
			{
				CursorPos(1);
				Console.Write("Que campo desea modificar?: ");
				Condicion1 = int.TryParse(Console.ReadLine(), out CampoMod);
				Condicion2 = CampoMod > 0 && CampoMod < 8;
				if (!Condicion1 || !Condicion2)
				{
					CursorPos(1);
					Console.WriteLine("Debe ser un Campo valido!");
				}

			} while (!Condicion1 || !Condicion2);
			CursorPos(1);
			switch (CampoMod)
			{
				case 1:
					Console.Write("Nombre nuevo: ");
					string NombreMod = Console.ReadLine();
					ListaClientes[ListaClientes.FindIndex(i => i.IdCli == IdMod)].Cliente = NombreMod.ToUpper();
					break;
				case 2:
					Console.Write("CUIT nuevo: ");
					string CUITMod = VerificarCUIT();
					ListaClientes[ListaClientes.FindIndex(i => i.IdCli == IdMod)].CUIT = CUITMod;
					break;
				case 3:
					Console.Write("Domicilio nuevo: ");
					string DomicMod = Console.ReadLine();
					ListaClientes[ListaClientes.FindIndex(i => i.IdCli == IdMod)].Domicilio = DomicMod.ToUpper();
					break;
				case 4:
					string LocalidadMod = IdExtras(ListaAux, "Localidades.txt", "Localidad");
					ListaClientes[ListaClientes.FindIndex(i => i.IdCli == IdMod)].Localidad = LocalidadMod;
					break;
				case 5:
					long TelMod = VerificarTel(true);
					ListaClientes[ListaClientes.FindIndex(i => i.IdCli == IdMod)].Telefono = TelMod;
					break;
				case 6:
					Console.Write("Correo Nuevo: ");
					string CorreoMod = Console.ReadLine();
					ListaClientes[ListaClientes.FindIndex(i => i.IdCli == IdMod)].Correo = CorreoMod;
					break;
				case 7:

					break;
				default:
					break;
			}
			Guardar(ListaClientes);
		}
		public void Eliminar(ref List<cClientes> Lista)
		{
			bool Entero, IdValido;
			int IdDel;
			do
			{
				Console.WriteLine();
				CursorPos(1);
				Console.Write("ID del item a Eliminar: ");
				Entero = int.TryParse(Console.ReadLine(), out IdDel);
				IdValido = Lista.FindIndex(i => i.IdCli == IdDel) != -1;
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
			Lista.RemoveAt(Lista.FindIndex(i => i.IdCli == IdDel));
			Guardar(Lista);
		}

		private string VerificarCUIT()
		{
			string cuil; bool condicion;
			do
			{
				CursorPos(1);
				Console.Write("CUIT: ");
				cuil = Console.ReadLine();
				condicion = cuil.Contains("-") || !cuil.All(char.IsDigit) || (cuil.Length != 11);
				if (condicion)
				{
					CursorPos(1);
					Console.WriteLine("Error! Contiene caracteres invalidos o falta de caracteres");
				}
			} while (condicion);

			string preDni = cuil.Substring(0, cuil.Length - 1);

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

			if (Calculos[2].ToString() == cuil.Substring(10))
			{
				return cuil;
			}
			else
			{
				CursorPos(1);
				Console.WriteLine("El CUIT no es Valido!");
				return VerificarCUIT();
			}
		}
		private long VerificarTel(bool nuevo)
		{
			long tel;
			CursorPos(1);
			if (nuevo == true)
			{
				Console.Write("Telefono nuevo: ");
			}
			else
			{
				Console.Write("Telefono: ");
			}
			if(!long.TryParse(Console.ReadLine(), out tel))
			{
				CursorPos(1);
				Console.Write("Debe ser en enteros!\n");
				if (nuevo == true)
				{
					return VerificarTel(true);
				}
				else
				{
					return VerificarTel(false);
				}
			}
			else if (tel >= 0 && tel < 10000000000)
			{
				return tel;
			}
			else
			{
				CursorPos(1);
				Console.Write("Numero de telefono invalido!\n");
				if (nuevo == true)
				{
					return VerificarTel(true);
				}
				else
				{
					return VerificarTel(false);
				}
			}
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
	}
}
