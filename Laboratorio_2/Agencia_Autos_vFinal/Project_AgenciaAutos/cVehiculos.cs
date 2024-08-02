using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project_AgenciaAutos
{
	class cVehiculos
	{
		// Propiedades
		private int pIdVeh, pAnio, pCilindrada;
		private string pMarca, pSeg, pCombus, pPatente, pModelo, pObs, pColor, pTipoVeh;
		private double pKiloM, pPrecioVTA, pDimensionCaja, pCargaMax;
		private bool pCajaCarga;

		// Metodos de propiedades
		public int IdVehiculo { get => this.pIdVeh; set => this.pIdVeh = value; }
		public int AnioVeh { get => this.pAnio; set => this.pAnio = value; }
		public string Marca { get => this.pMarca; set => this.pMarca = value; }
		public string Seg { get => this.pSeg; set => this.pSeg = value; }
		public string Combus { get => this.pCombus; set => this.pCombus = value; }
		public string Patente { get => this.pPatente; set => this.pPatente = value; }
		public string Modelo { get => this.pModelo; set => this.pModelo = value; }
		public string Obs { get => this.pObs; set => this.pObs = value; }
		public string Color { get => this.pColor; set => this.pColor = value; }
		public double KiloM { get => this.pKiloM; set => this.pKiloM = value; }
		public double PreVTA { get => this.pPrecioVTA; set => this.pPrecioVTA = value; }
		public string TipoVeh { get => this.pTipoVeh; set => this.pTipoVeh = value; }
		public bool CajaCarga { get => this.pCajaCarga; set => this.pCajaCarga = value; }
		public double DimensionCaja { get => this.pDimensionCaja; set => this.pDimensionCaja = value; }
		public double CargaMax { get => this.pCargaMax; set => this.pCargaMax = value; }
		public int Cilindrada { get => this.pCilindrada; set => this.pCilindrada = value; }

		// Constructores
		public cVehiculos() { }
		public cVehiculos(int IdVeh, string Tipo, int Anio, string Marca, string Seg, string Combus, string Pat, string Model, string Obs, string Color, double Km, double PrV, bool Caja, double Dimensiones, double CargaMax, int Cilindrada)
		{
			this.IdVehiculo = IdVeh;
			this.TipoVeh = Tipo;
			this.AnioVeh = Anio;
			this.Marca = Marca;
			this.Seg = Seg;
			this.Combus = Combus;
			this.Patente = Pat;
			this.Modelo = Model;
			this.Obs = Obs;
			this.Color = Color;
			this.KiloM = Km;
			this.PreVTA = PrV;
			this.CajaCarga = Caja;
			this.DimensionCaja = Dimensiones;
			this.CargaMax = CargaMax;
			this.Cilindrada = Cilindrada;
		}
	}
	class cAutos : cVehiculos
	{
		// Constructores
		public cAutos() { }
		public cAutos(int IdVeh, string Tipo, int Anio, string Marca, string Seg, string Combus, string Pat, string Model, string Obs, string Color, double Km, double PrV)
		{
			this.IdVehiculo = IdVeh;
			this.TipoVeh = Tipo;
			this.AnioVeh = Anio;
			this.Marca = Marca;
			this.Seg = Seg;
			this.Combus = Combus;
			this.Patente = Pat;
			this.Modelo = Model;
			this.Obs = Obs;
			this.Color = Color;
			this.KiloM = Km;
			this.PreVTA = PrV;
		}
	}
	class cCamiones : cVehiculos
	{
		// Constructores
		public cCamiones() { }
		public cCamiones(int IdVeh, string Tipo, int Anio, string Marca, string Seg, string Combus, string Pat, string Model, string Obs, string Color, double Km, double PrV, bool Caja, double Dimensiones, double CargaMax)
		{
			this.IdVehiculo = IdVeh;
			this.TipoVeh = Tipo;
			this.AnioVeh = Anio;
			this.Marca = Marca;
			this.Seg = Seg;
			this.Combus = Combus;
			this.Patente = Pat;
			this.Modelo = Model;
			this.Obs = Obs;
			this.Color = Color;
			this.KiloM = Km;
			this.PreVTA = PrV;
			this.CajaCarga = Caja;
			this.DimensionCaja = Dimensiones;
			this.CargaMax = CargaMax;
		}
	}
	class cMotos : cVehiculos
	{
		// Constructores
		public cMotos() { }
		public cMotos(int IdVeh, string Tipo, int Anio, string Marca, string Seg, string Combus, string Pat, string Model, string Obs, string Color, double Km, double PrV, int Cilindrada)
		{
			this.IdVehiculo = IdVeh;
			this.TipoVeh = Tipo;
			this.AnioVeh = Anio;
			this.Marca = Marca;
			this.Seg = Seg;
			this.Combus = Combus;
			this.Patente = Pat;
			this.Modelo = Model;
			this.Obs = Obs;
			this.Color = Color;
			this.KiloM = Km;
			this.PreVTA = PrV;
			this.Cilindrada = Cilindrada;
		}
	}
}
