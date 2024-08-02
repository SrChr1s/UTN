using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Herencia_2
{
	class Empresa
	{
		private long pCuit;
		private int pRazonSocial;
		private DateTime pFecInActComer;
		private string pWebInst;
		private double pRecaudacionTotal;
		private List<PaqueteTuristico> Paquetes;

		public int RazonSocial { get => pRazonSocial; set => pRazonSocial = value; }
		public DateTime FecInActComer { get => pFecInActComer; set => pFecInActComer = value; }
		public string WebInst { get => pWebInst; set => pWebInst = value; }
		public long Cuit { get => pCuit; set => pCuit = value; }
		public double RecaudacionTotal { get => pRecaudacionTotal; }
		internal List<PaqueteTuristico> Paquetes1 { get => Paquetes; set => Paquetes = value; }
	}
}
