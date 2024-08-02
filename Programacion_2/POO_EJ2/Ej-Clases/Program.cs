using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
namespace Ej_Clases
{
	class Program
	{
		static void Main(string[] args)
		{
			clsEmpleado Empleado = new clsEmpleado();
			StreamReader Leer;
			string Datos;
			string[] DatosSpdos;
			FileStream Archivo = new FileStream("empleados.txt", FileMode.Open);
			Leer = new StreamReader(Archivo);
			while (Leer.EndOfStream == false)
			{
				Datos = Leer.ReadLine();
				DatosSpdos = Datos.Split(';');
				Empleado.Legajo = int.Parse(DatosSpdos[0]);
				Empleado.Apellido = DatosSpdos[1];
				Empleado.Nombre = DatosSpdos[2];
				Empleado.FechaNac = DatosSpdos[3];
				Empleado.Genero = DatosSpdos[4];
				Empleado.Sueldo = long.Parse(DatosSpdos[5]);
				Empleado.MostrarDatos(); 
			}
			Leer.Close();
			Archivo.Close();
			Console.ReadKey();
		}
	}
}
