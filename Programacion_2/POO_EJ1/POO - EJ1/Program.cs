using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace POO___EJ1
{
	class Cuadrado
	{
		public int lado1;
		public int lado2;
		public int perimetro;
		public int area;
		public void IngresarLados(int l1, int l2)
		{
			Console.WriteLine("Ingrese el lado 1: ");
			while (!int.TryParse(Console.ReadLine(), out l1))
			{
				Console.Write("Debe ser un numero entero!: ");
			}
			Console.WriteLine("Ingrese el lado 2: ");
			while (!int.TryParse(Console.ReadLine(), out l2))
			{
				Console.Write("Debe ser un numero entero!: ");
			}
		}
		public void ImprimirPerimetro()
		{

		}
		public void ImprimirArea()
		{

		}
	}
	internal class Program
	{
		static void Main(string[] args)
		{
			Cuadrado Square = new Cuadrado();

		}
	}
}
