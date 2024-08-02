using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Polimorfismo
{
	class Humano : Mamifero
	{
		// Metodos
		public override void Pensar()
		{
			Console.WriteLine("Pensamiento avanzado");
		}
	}
}
