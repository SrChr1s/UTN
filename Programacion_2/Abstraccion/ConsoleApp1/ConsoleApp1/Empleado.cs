using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
	class Empleado : Persona
	{
		public override void MostraDatos()
		{
			Console.WriteLine($"Nombre completo: {this.ApelNom}");
		}
	}
}
