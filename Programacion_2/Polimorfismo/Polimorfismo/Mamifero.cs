using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Polimorfismo
{
	class Mamifero
	{
		// Propiedades privadas
		private string _nombre;

		// Metodo de propiedad
		public string Nombre
		{
			get { return this._nombre; }
			set { this._nombre = value; }
		}

		// Metodos
		public virtual void Pensar()
		{
			Console.WriteLine("Pensamiento basico");
		}
	}
}
