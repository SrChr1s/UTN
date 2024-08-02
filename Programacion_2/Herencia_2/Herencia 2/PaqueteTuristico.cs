using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Herencia_2
{
	class PaqueteTuristico
	{
		private float pPrecioPaquete;
		private List<cCliente> pPasajerosPaquete;
		private string pLugarDestino;
		private DateTime pFecHoraLlegada;
		private double pRecaudacionPaquete;
		private DateTime pFecHoraSalida;
		private int pCupoPasajeros;

		public float PrecioPaquete { get => pPrecioPaquete; set => pPrecioPaquete = value; }
		public List<cCliente> PasajerosPaquete { get => pPasajerosPaquete; set => pPasajerosPaquete = value; }
		public string LugarDestino { get => pLugarDestino; set => pLugarDestino = value; }
		public DateTime FecHoraLlegada { get => pFecHoraLlegada; set => pFecHoraLlegada = value; }
		public double RecaudacionPaquete { get => pRecaudacionPaquete; }
		public DateTime FecHoraSalida { get => pFecHoraSalida; set => pFecHoraSalida = value; }
		public int CupoPasajeros { get => pCupoPasajeros; set => pCupoPasajeros = value; }

		public void AgregarPasajero()
		{

		}
		public void QuitarPasajero()
		{

		}

	}
}
