using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Herencia
{
	class Director : Jefe
	{
		// Propiedades
		private int pSectoresAcargo;

		// Metodos de Propiedades
		public int SectoresAcargo
		{
			get { return this.pSectoresAcargo; }
			set { this.pSectoresAcargo = value; }
		}
	}
}
