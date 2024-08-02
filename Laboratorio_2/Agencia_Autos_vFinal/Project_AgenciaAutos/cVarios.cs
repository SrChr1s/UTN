using System;

namespace Project_AgenciaAutos
{
	internal class cVarios
	{
		// Propiedades
		private readonly string[] pMenu1 = {
			"  Menu Principal  ",
			"┌────────────────┐",
			"│    Clientes    │",
			"├────────────────┤",
			"│    Vehiculos   │",
			"├────────────────┤",
			"│     Ventas     │",
			"├────────────────┤",
			"│  Parametricas  │",
			"├────────────────┤",
			"│      Salir     │",
			"└────────────────┘"
		};
		private readonly string[] pMenu2 = {
			"                  ",
			"┌────────────────┐",
			"│     Marcas     │",
			"├────────────────┤",
			"│    Segmentos   │",
			"├────────────────┤",
			"│  Combustibles  │",
			"├────────────────┤",
			"│  Localidades   │",
			"├────────────────┤",
			"│   Provincias   │",
			"├────────────────┤",
			"│     Volver     │",
			"└────────────────┘"
		};
		private readonly string[] pArtWelcome =
		{
			"                              _.-=\"_-         _                             ",
			"                         _.-=\"   _-          | ||\"\"\"\"\"\"\"---._______     __..",
			"             ___.===\"\"\"\"-.______-,,,,,,,,,,,,`-''----\" \"\"\"\"\"       \"\"\"\"\"  __'",
			"      __.--\"\"     __        ,'                   o \\           __        [__|",
			"  __-\"\"=======.--\"\"  \"\"--.=================================.--\"\"  \"\"--.=======:",
			" ]       [w] : /        \\ : |========================|    : /        \\ :  [w] :",
			" V___________:|          |: |========================|    :|          |:   _-\"",
			"V__________: \\        / :_|=======================/_____: \\        / :__-\"",
			"-----------'  \"-____-\"  `-------------------------------'  \"-____-\"        "
		};

		private readonly string[] pCRUD =
		{
			"Crear",
			"Actualizar",
			"Eliminar",
			"Volver"
		};

		// Metodos de propiedades
		public string[] ArtWelcome { get { return this.pArtWelcome; } }

		// Metodos
		public void MostrarMenu(int menu, int item, int menuActual)
		{
			int i = 0;
			if (menu == 1)
			{
				Console.CursorTop = menuActual == 1 ? (Console.WindowHeight / 2 - this.pMenu1.Length / 2) : (Console.WindowHeight / 2 - this.pMenu1.Length / 2 - 4);
				foreach (var linea in this.pMenu1)
				{
					if (menuActual == 1)
					{
						Console.CursorLeft = (Console.WindowWidth / 2) - linea.Length / 2;
					}
					else
					{
						Console.CursorLeft = (Console.WindowWidth / 2) - linea.Length;
					}
					if (item == i)
					{
						Console.BackgroundColor = ConsoleColor.DarkRed;
						Console.WriteLine(linea);
						Console.ResetColor();
					}
					else
					{
						Console.WriteLine(linea);
					}
					i++;
				}
			}
			else
			{
				MostrarMenu(1, 8, 2);
				foreach (var linea in this.pMenu2)
				{
					Console.SetCursorPosition( 1 + Console.WindowWidth / 2, Console.WindowHeight / 2 + i - 4);
					if (item == i)
					{
						Console.BackgroundColor = ConsoleColor.DarkRed;
						Console.WriteLine(linea);
						Console.ResetColor();
					}
					else
					{
						Console.WriteLine(linea);
					}
					i++;
				}
			}
		}
		public void MostrarCRUD(int ItemActual)
		{
			Console.CursorLeft = (Console.WindowWidth / 2) - 35 / 2;
			for (int i = 0; i < 4; i++)
			{
				if (i == ItemActual)
				{
					Console.BackgroundColor = ConsoleColor.DarkRed;
					Console.Write(this.pCRUD[i]);
					Console.ResetColor();
					Console.Write("  ");
				}
				else
				{
					Console.Write(this.pCRUD[i]);
					Console.Write("  ");
				}
			}
		}
		public void Navegacion(ref int MenuActual, ref int SubmenuActual, ref int ItemActual, ref bool Salir, ref bool Agregar, ref bool Actualizar, ref bool Eliminar)
		{
			ConsoleKeyInfo Tecla = Console.ReadKey();
			switch (Tecla.Key)
			{
				case ConsoleKey.Enter:
					if (MenuActual == 0) // Menu Principal
					{
						if (ItemActual == 2) // Clientes
						{
							SubmenuActual = 0;
							MenuActual = -1;
							ItemActual = 0;
						}
						else if (ItemActual == 4) // Vehiculos
						{
							SubmenuActual = 1;
							MenuActual = -1;
							ItemActual = 0;
						}
						else if (ItemActual == 6) // Ventas
						{
							SubmenuActual = 2;
							MenuActual = -1;
							ItemActual = 0;
						}
						else if (ItemActual == 8) // Parametricas
						{
							MenuActual = 1;
							ItemActual = 2;
						}
						else
						{
							Salir = true;
						}
					}
					else if (MenuActual == 1) // Submenu Parametricas
					{
						if (ItemActual == 2) // Marcas
						{
							SubmenuActual = 3;
							MenuActual = -2;
							ItemActual = 0;
						}
						else if (ItemActual == 4) // Segmentos
						{
							SubmenuActual = 4;
							MenuActual = -2;
							ItemActual = 0;
						}
						else if (ItemActual == 6) // Combustibles
						{
							SubmenuActual = 5;
							MenuActual = -2;
							ItemActual = 0;
						}
						else if (ItemActual == 8) // Localidades
						{
							SubmenuActual = 6;
							MenuActual = -2;
							ItemActual = 0;
						}
						else if (ItemActual == 10) // Provincias
						{
							SubmenuActual = 7;
							MenuActual = -2;
							ItemActual = 0;
							
						}
						else if (ItemActual == 12) // Volver a Menu Principal
						{
							MenuActual = 0;
							ItemActual = 8;
						}
					}
					else
					{
						if (SubmenuActual == 0) // Clientes
						{
							ModuloCRUD(ref MenuActual, ref ItemActual, ref Agregar, ref Actualizar, ref Eliminar, 2);
						}
						else if (SubmenuActual == 1) // Vehiculos
						{
							ModuloCRUD(ref MenuActual, ref ItemActual, ref Agregar, ref Actualizar, ref Eliminar, 4);
						}
						else if (SubmenuActual == 2) // Ventas
						{
							ModuloCRUD(ref MenuActual, ref ItemActual, ref Agregar, ref Actualizar, ref Eliminar, 6);
						}
						else if (SubmenuActual == 3) // Marcas
						{
							ModuloCRUD(ref MenuActual, ref ItemActual, ref Agregar, ref Actualizar, ref Eliminar, 2);
						}
						else if (SubmenuActual == 4) // Segmentos
						{
							ModuloCRUD(ref MenuActual, ref ItemActual, ref Agregar, ref Actualizar, ref Eliminar, 4);
						}
						else if (SubmenuActual == 5) // Combustibles
						{
							ModuloCRUD(ref MenuActual, ref ItemActual, ref Agregar, ref Actualizar, ref Eliminar, 6);
						}
						else if (SubmenuActual == 6) // Localidades
						{
							ModuloCRUD(ref MenuActual, ref ItemActual, ref Agregar, ref Actualizar, ref Eliminar, 8);
						}
						else if (SubmenuActual == 7) // Provincias
						{
							ModuloCRUD(ref MenuActual, ref ItemActual, ref Agregar, ref Actualizar, ref Eliminar, 10);
						}
					}
					break;
				case ConsoleKey.UpArrow:
					if (ItemActual < 4 && MenuActual == 0)
					{
						ItemActual = 10;
					}
					else if (MenuActual == 0)
					{
						ItemActual -= 2;
					}
					else if (ItemActual < 4 && MenuActual == 1)
					{
						ItemActual = 12;
					}
					else if (MenuActual == 1)
					{
						ItemActual -= 2;
					}
					break;
				case ConsoleKey.DownArrow:
					if (ItemActual > 8 && MenuActual == 0)
					{
						ItemActual = 2;
					}
					else if (MenuActual == 0)
					{
						ItemActual += 2;
					}
					else if (ItemActual > 10 && MenuActual == 1)
					{
						ItemActual = 2;
					}
					else if (MenuActual == 1)
					{
						ItemActual += 2;
					}
					break;
				case ConsoleKey.LeftArrow:
					if (MenuActual != 0 && MenuActual != 1)
					{
						if (ItemActual < 1)
						{
							ItemActual = 3;
						}
						else
						{
							ItemActual--;
						}
					}
					break;
				case ConsoleKey.RightArrow:
					if (MenuActual != 0 && MenuActual != 1)
					{
						if (ItemActual > 2)
						{
							ItemActual = 0;
						}
						else
						{
							ItemActual++;
						}
					}
					break;
				default:
					break;
			}
		}
		private void ModuloCRUD(ref int MenuActual, ref int ItemActual, ref bool Agregar, ref bool Actualizar, ref bool Eliminar, int Seleccion)
		{
			if (ItemActual == 0) // Agregar
			{
				Agregar = true;
			}
			else if (ItemActual == 1) // Actualizar
			{
				Actualizar = true;
			}
			else if (ItemActual == 2) // Eliminar
			{
				Eliminar = true;
			}
			else if (ItemActual == 3) // Volver
			{
				if (MenuActual == -1)
				{
					MenuActual = 0;
				}
				else if (MenuActual == -2)
				{
					MenuActual = 1;
				}
				ItemActual = Seleccion;
			}
		}
	}
}
