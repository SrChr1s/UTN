using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
	abstract class Persona
	{
		private string _apelNom;
		private int _legajo;

		public string ApelNom
		{
			get { return this._apelNom; }
			set { this._apelNom = value; }
		}

		public int Legajo
		{
			get { return this._legajo; }
			set { this._legajo = value; }
		}

		public abstract void MostraDatos();
	}
}
