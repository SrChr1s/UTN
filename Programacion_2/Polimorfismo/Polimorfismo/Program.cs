using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Polimorfismo
{
	class Program
	{
		static void Main(string[] args)
		{
			Gorila gorila1 = new Gorila();
			Ballena ballena1 = new Ballena();
			Humano persona = new Humano();
			gorila1.Pensar();
			ballena1.Pensar();
			persona.Pensar();
		}
	}
}
