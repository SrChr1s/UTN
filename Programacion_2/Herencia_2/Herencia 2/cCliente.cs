using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Herencia_2
{
	class cCliente
	{
		private string pApelNom;
		private int pDni;
		private long pCelular;

		public string ApelNom { get => pApelNom; set => pApelNom = value; }
		public int Dni { get => pDni; set => pDni = value; }
		public long Celular { get => pCelular; set => pCelular = value; }

	}
}
