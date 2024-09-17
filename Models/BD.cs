using System.Collections.Generic;
using System.Data.SqlClient;
using Dapper;

namespace TP07___PreguntadORT.Models
{
    public class BD
    {
        private static string _connectionString = @"Server=localhost;DataBase=TP07-PreguntadORT;trusted_connection=true;";

        public static List<Categoria> ObtenerCategorias()
        {
            List<Categoria> listaCategorias = new List<Categoria>();
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT * FROM Categorias";
                listaCategorias = db.Query<Categoria>(sql).ToList();
            }
            return listaCategorias;
        }

        public static List<Dificultad> ObtenerDificultades()
        {
            List<Dificultad> listaDificultades = new List<Dificultad>();
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT * FROM Dificultades";
                listaDificultades = db.Query<Dificultad>(sql).ToList();
            }
            return listaDificultades;
        }

      public static List<Pregunta> ObtenerPreguntas(int dificultad, int categoria)
{
    List<Pregunta> listaPreguntas = new List<Pregunta>();
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        string sql = "SELECT * FROM Preguntas WHERE (@dificultad = -1 OR IdDificultad = @dificultad) AND (@categoria = -1 OR IdCategoria = @categoria)";
        listaPreguntas = db.Query<Pregunta>(sql, new { dificultad, categoria }).ToList();
    }
    return listaPreguntas;
}

       public static List<Respuesta> ObtenerRespuestas(int idPregunta)
{
    List<Respuesta> listaRespuestas = new List<Respuesta>();
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        string sql = "SELECT * FROM Respuestas WHERE IdPregunta = @idPregunta";
        listaRespuestas = db.Query<Respuesta>(sql, new { idPregunta }).ToList();
    }
    return listaRespuestas;
}


        public static Respuesta ObtenerRespuestaPorId(int idRespuesta)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT * FROM Respuestas WHERE idRespuesta = @idRespuesta";
                return db.QueryFirstOrDefault<Respuesta>(sql, new { idRespuesta });
            }
        }

        public static Respuesta ObtenerRespuestaCorrecta(int idPregunta)
        {
            
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT * FROM Respuestas WHERE IdPregunta = @idPregunta AND Correcta = 1";
                return db.QueryFirstOrDefault<Respuesta>(sql, new { idPregunta });
            }
        }
    }
}
