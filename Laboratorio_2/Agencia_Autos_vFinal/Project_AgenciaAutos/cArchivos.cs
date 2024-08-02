using System;
using System.Collections.Generic;
using System.IO;

namespace Project_AgenciaAutos
{
	internal class cArchivos
	{
		// Propiedades
		private int pIdItem;
		private string pItem;
		private int pUltimoId;

		// Metodos de propiedades
		public int IdItem { get => this.pIdItem; set => this.pIdItem = value; }
		public string Item { get => this.pItem; set => this.pItem = value; }

		// Constructores
		public cArchivos() { }
		public cArchivos(int Id, string Item)
		{
			this.IdItem = Id;
			this.Item = Item;
		}

		// Metodos
		private void CursorPos(int ver)
		{
			if (ver == 1)
			{
				Console.CursorLeft = (Console.WindowWidth / 2) - 61 / 2;
			}
			else if	(ver == 2)
			{
				Console.CursorLeft = (Console.WindowWidth / 2) - 120 / 2;
			}
			else
			{
				Console.CursorLeft = (Console.WindowWidth / 2) - 90 / 2;
			}
		}
		public void InitList(ref List<cArchivos> Lista, string txt, string title)
		{
			FileStream Archivo;
			StreamReader Leer;
			string Data;
			string[] DataSplit;

			if (File.Exists(txt))
			{
				Archivo = new FileStream(txt, FileMode.Open);
				Leer = new StreamReader(Archivo);
				Lista.Clear();
				while (Leer.EndOfStream == false)
				{
					Data = Leer.ReadLine();
					DataSplit = Data.Split(';');
					Lista.Add(new cArchivos(int.Parse(DataSplit[0]), DataSplit[1]));
					pUltimoId = int.Parse(DataSplit[0]);
				}
				Archivo.Close();
				Leer.Close();
				Mostrar(Lista, title);
			}
			else
			{
				Archivo = new FileStream(txt, FileMode.Create);
				Archivo.Close();
				InitList(ref Lista, txt, title);
			}
		}
		private void Mostrar(List<cArchivos> Lista, string title)
		{
			CursorPos(1);
			Console.WriteLine("┌──────┬────────────────────────────────────────────────────┐");
			CursorPos(1);
			Console.BackgroundColor = ConsoleColor.DarkGray; Console.ForegroundColor = ConsoleColor.Black;
			Console.WriteLine($"│  ID  │ {title,-50} │");
			Console.ResetColor();
			foreach (cArchivos item in Lista)
			{
				CursorPos(1);
				Console.WriteLine("├──────┼────────────────────────────────────────────────────┤");
				CursorPos(1);
				Console.WriteLine($"│ {item.IdItem,-4} │ {item.Item,-50} │");
			}
			CursorPos(1);
			Console.WriteLine("└──────┴────────────────────────────────────────────────────┘");
		}
		private void Guardar(List<cArchivos> Lista, string txt)
		{
			FileStream Archivo = new FileStream(txt, FileMode.Create);
			StreamWriter Grabar = new StreamWriter(Archivo);
			foreach (cArchivos item in Lista)
			{
				Grabar.WriteLine($"{item.pIdItem};{item.pItem}");
			}
			Grabar.Close();
			Archivo.Close();
			pUltimoId = 0; // Tema con el ID
		}
		public void Agregar(ref List<cArchivos> Lista, string txt, string title)
		{
			pUltimoId++;
			Console.Clear();
			CursorPos(1);
			if (title[title.Length - 1] == 'a' || title[title.Length - 1] == 'd')
			{
				Console.Write($"Nombre de la nueva {title}: ");
			}
			else
			{
				Console.Write($"Nombre del nuevo {title}: ");
			}
			string Entrada = Console.ReadLine();
			Lista.Add(new cArchivos(pUltimoId, Entrada.ToUpper()));
			Console.Clear();
			Guardar(Lista, txt);
		}
		public void Actualizar(ref List<cArchivos> Lista, string txt, string title)
		{
			bool Entero, IdValido;
			int IdMod;
			do
			{
				Console.WriteLine("\n");
				CursorPos(1);
				Console.Write("Ingrese el ID del item a modificar: ");
				Entero = int.TryParse(Console.ReadLine(), out IdMod);
				IdValido = Lista.FindIndex(i => i.IdItem == IdMod) != -1;
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
			Console.WriteLine();
			CursorPos(1);
			if (title[title.Length - 1] == 'a' || title[title.Length - 1] == 'd')
			{
				Console.Write($"Nombre de la nueva {title}: ");
			}
			else
			{
				Console.Write($"Nombre del nuevo {title}: ");
			}
			string ItemUpd = Console.ReadLine();
			Lista[IdMod - 1].Item = ItemUpd.ToUpper();
			Guardar(Lista, txt);
		}
		public void Eliminar(ref List<cArchivos> Lista, string txt)
		{
			bool Entero, IdValido;
			int IdDel;
			do
			{
				Console.WriteLine("\n");
				CursorPos(1);
				Console.Write("ID del item a Eliminar: ");
				Entero = int.TryParse(Console.ReadLine(), out IdDel);
				IdValido = Lista.FindIndex(i => i.IdItem == IdDel) != -1;
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
			Lista.RemoveAt(Lista.FindIndex(i => i.IdItem == IdDel));
			Guardar(Lista, txt);
		}

		// ##############################################################
		// ####################### LOCALIDADES ##########################
		// ##############################################################

		// Propiedades
		private int pUltimoIdLoc;
		private string pProvincia;

		// Metodos de Propiedades
		public string Provincia { get => this.pProvincia; set => this.pProvincia = value; }

		// Constructores
		public cArchivos(int Id, string Item, string Prov)
		{
			this.IdItem = Id;
			this.Item = Item;
			this.pProvincia = Prov;
		}

		// Metodos
		public void InitListLoc(ref List<cArchivos> Lista)
		{
			FileStream Archivo;
			StreamReader Leer;
			string Data;
			string[] DataSplit;

			if (File.Exists("Localidades.txt"))
			{
				Archivo = new FileStream("Localidades.txt", FileMode.Open);
				Leer = new StreamReader(Archivo);
				Lista.Clear();
				while (Leer.EndOfStream == false)
				{
					Data = Leer.ReadLine();
					DataSplit = Data.Split(';');
					Lista.Add(new cArchivos( int.Parse(DataSplit[0]), DataSplit[1], DataSplit[2] ));
					pUltimoIdLoc = int.Parse(DataSplit[0]);
				}
				Archivo.Close();
				Leer.Close();
				MostrarLoc(Lista);
			}
			else
			{
				Archivo = new FileStream("Localidades.txt", FileMode.Create);
				Archivo.Close();
				InitListLoc(ref Lista);
			}
		}
		private void MostrarLoc(List<cArchivos> Lista)
		{
			CursorPos(3);
			Console.WriteLine("┌──────┬────────────────────────────────────────┬────────────────────────────────────────┐");
			CursorPos(3);
			Console.BackgroundColor = ConsoleColor.DarkGray; Console.ForegroundColor = ConsoleColor.Black;
			Console.WriteLine("│  ID  │ Localidad                              │ Provincia                              │");
			Console.ResetColor();
			foreach (cArchivos item in Lista)
			{
				CursorPos(3);
				Console.WriteLine("├──────┼────────────────────────────────────────┼────────────────────────────────────────┤");
				CursorPos(3);
				Console.WriteLine($"│ {item.pIdItem,-4} │ {item.pItem,-38} │ {item.Provincia,-39}│");
			}
			CursorPos(3);
			Console.WriteLine("└──────┴────────────────────────────────────────┴────────────────────────────────────────┘");
		}
		private void GuardarLoc(List<cArchivos> Lista)
		{
			FileStream Archivo = new FileStream("Localidades.txt", FileMode.Create);
			StreamWriter Grabar = new StreamWriter(Archivo);
			foreach (cArchivos item in Lista)
			{
				Grabar.WriteLine($"{item.IdItem};{item.Item};{item.Provincia}");
			}
			Grabar.Close();
			Archivo.Close();
			pUltimoIdLoc = 0; // Tema con el ID
		}
		public void AgregarLoc(ref List<cArchivos> Lista, ref List<cArchivos> Lista2)
		{
			Console.Clear();
			Console.WriteLine("\n");
			InitList(ref Lista2, "Provincias.txt", "Provincia");
			int IdP;
			bool Condicion, Condicion2;
			do
			{
				CursorPos(1);
				Console.Write("ID de la Provincia a la que pertenece: ");
				Condicion = int.TryParse(Console.ReadLine(), out IdP);
				Condicion2 = Lista2.FindIndex(i => i.IdItem == IdP) != -1;
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
			Console.Clear();
			InitListLoc(ref Lista);
			pUltimoIdLoc++;
			CursorPos(1);
			Console.Write("Nombre de la Localidad: ");
			string Entrada = Console.ReadLine();
			Lista.Add(new cArchivos ( pUltimoIdLoc, Entrada.ToUpper(), Lista2[Lista2.FindIndex(i => i.IdItem == IdP)].Item ));
			GuardarLoc(Lista);
		}
		public void ActualizarLoc(ref List<cArchivos> Lista, ref List<cArchivos> Lista2)
		{
			Console.WriteLine("\n");
			bool Entero, IdValido;
			int IdMod;
			do
			{
				CursorPos(1);
				Console.Write("ID del item a modificar:");
				Entero = int.TryParse(Console.ReadLine(), out IdMod);
				IdValido = Lista.FindIndex(i => i.IdItem == IdMod) != -1;
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
			Console.WriteLine("Nombre de la nueva Localidad: ");
			string ItemUpd = Console.ReadLine();
			Console.Clear();
			InitList(ref Lista2, "Provincias.txt", "Provincia");
			int IdP;
			bool Condicion, Condicion2;
			do
			{
				CursorPos(1);
				Console.Write("ID de la Provincia la que pertenece: ");
				Condicion = int.TryParse(Console.ReadLine(), out IdP);
				Condicion2 = Lista2.FindIndex(i => i.IdItem == IdP) != -1;
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
			Lista[Lista.FindIndex(i => i.IdItem == IdMod)].Item = ItemUpd.ToUpper();
			Lista[Lista.FindIndex(i => i.IdItem == IdMod)].Provincia = Lista2[Lista2.FindIndex(i => i.IdItem == IdP)].Item;
			GuardarLoc(Lista);
		}
	}
}
