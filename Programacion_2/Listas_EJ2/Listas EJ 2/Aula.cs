using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Listas_EJ_2
{
	class Aula
	{
		//nombre del aula, canƟdad de alumnos limite, lista de alumnos
		private string pNomAula;
		private int pCantAlumLim;
		private List<Alumno> pListAlumnos;

		public Aula()
		{

		}

		public string NomAula
		{
			get
			{
				return this.pNomAula;
			}
			set
			{
				this.pNomAula = value;
			}
		}
		public int CantAlumLim
		{
			get
			{
				return this.pCantAlumLim;
			}
			set
			{
				this.pCantAlumLim = value;
			}
		}
		public List<Alumno> ListAlumnos 
		{
			get
			{
				return this.pListAlumnos;
			}
			set
			{
				this.pListAlumnos = value;
			}
		}

		public void MostrarListado()
		{
			foreach (var Alumno in this.ListAlumnos)
			{
				Alumno.MostrarAlumno();
			}
		}
	}
}
