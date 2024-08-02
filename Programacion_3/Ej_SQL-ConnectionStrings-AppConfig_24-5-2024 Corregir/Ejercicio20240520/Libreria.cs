using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Ejercicio20240520
{
    public static class Libreria
    {
        public static void Ejecutar(string sql)
        {
            SqlConnection conexion = new SqlConnection();
            // Conexion Casa
            //conexion.ConnectionString = ConfigurationManager.ConnectionStrings["Casa"].ConnectionString;

            // Conexion Labo 2
            //conexion.ConnectionString = ConfigurationManager.ConnectionStrings["LAB205"].ConnectionString;

            // Conexion Labo Arriba
            conexion.ConnectionString = ConfigurationManager.ConnectionStrings["LABOarriba"].ConnectionString;

            conexion.Open();

            SqlCommand comando = new SqlCommand();
            comando.Connection = conexion;
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = sql;
            comando.ExecuteNonQuery();
            conexion.Close();
        }

        public static DataTable Recuperar(string sql)
        {
            SqlConnection conexion = new SqlConnection();

            // Conexion Casa
            //conexion.ConnectionString = ConfigurationManager.ConnectionStrings["Casa"].ConnectionString;

            // Conexion Labo 2
            //conexion.ConnectionString = ConfigurationManager.ConnectionStrings["LAB205"].ConnectionString;

            // Conexion Labo Arriba
            conexion.ConnectionString = ConfigurationManager.ConnectionStrings["LABOarriba"].ConnectionString;

            conexion.Open();

            DataTable dt = new DataTable();
            SqlCommand comando = new SqlCommand();
            comando.Connection = conexion;
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = sql;
            dt.Load(comando.ExecuteReader());
            conexion.Close();

            return dt;
        }

        public static void Recuperar(string sql, out DataTable dt)
        {
            SqlConnection conexion = new SqlConnection();

            // Conexion Casa
            //conexion.ConnectionString = ConfigurationManager.ConnectionStrings["Casa"].ConnectionString;

            // Conexion Labo 2
            //conexion.ConnectionString = ConfigurationManager.ConnectionStrings["LAB205"].ConnectionString;

            // Conexion Labo Arriba
            conexion.ConnectionString = ConfigurationManager.ConnectionStrings["LABOarriba"].ConnectionString;

            conexion.Open();

            dt = new DataTable();
            SqlCommand comando = new SqlCommand();
            comando.Connection = conexion;
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = sql;
            dt.Load(comando.ExecuteReader());
            conexion.Close();
        }

        public static int LocalidadRepetida(int CodPostal)
        {
            int count;
            using (SqlConnection conexion = new SqlConnection())
            {
                conexion.ConnectionString = ConfigurationManager.ConnectionStrings["LABOarriba"].ConnectionString;
                conexion.Open();
                SqlCommand comando = new SqlCommand();
                comando.Connection = conexion;
                comando.CommandType = System.Data.CommandType.Text;
                comando.CommandText = $"select count(*) from Localidades as l where l.CodigoPostal = {CodPostal}";
                count = Convert.ToInt32(comando.ExecuteScalar());
            }
            return count;
        }
    }
}
