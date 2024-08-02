using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Herencia
{
	class Empresa
	{
		// Propiedades
		private string pRazSoc;
		private List<Empleado> pPlantaLaboral;

		// Metodos de Propiedades
		public string RazSoc
		{
			get { return this.pRazSoc; }
			set { this.pRazSoc = value; }
		}

		// Metodos
		public void AgregarEmpleado(Empleado empleado)
		{
			pPlantaLaboral.Add(empleado);
		}
		public void QuitarEmpleado()
		{

		}
		public void ListarEmpleado()
		{

		}
	}
}
