using System.Data.SqlClient;
using Dapper;
namespace TP07___PreguntadORT.BD;
public class BD
{
private static string _connectionString = @"Server=localhost;DataBase=TP07-PreguntadORT;trusted_connection=true;";
public static List<Categoria> ObtenerCategorias()
{
    List<Categoria> ListaCategorias = new List<Categoria>();
       using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Categorias";
            ListaCategorias = db.Query<Categoria>(sql).ToList();
        }
        return ListaCategorias;
}

public static List<Dificultad> ObtenerDificultades()
{
 List<Dificultad> ListaDificultades = new List<Dificultad>();
       using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Dificultades";
            ListaDificultades = db.Query<Dificultad>(sql).ToList();
        }
        return ListaDificultades;
}
public List<Pregunta> ObtenerPreguntas(int dificultad, int categoria)
{
   List<Pregunta> listaPreguntas;

            using (SqlConnection db = new SqlConnection(_connectionString))
            {
               
                string sql = "SELECT * FROM Preguntas WHERE (@dificultad = -1 OR IdDificultad = @dificultad) AND (@categoria = -1 OR IdCategoria = @categoria)";
                
                
                listaPreguntas = db.Query<Pregunta>(sql, new { dificultad, categoria }).ToList();
            }

            return listaPreguntas;
}
public List<Respuesta> ObtenerRespuestas(int idPregunta)
{
            List<Respuesta> listaRespuestas;

            using (SqlConnection db = new SqlConnection(_connectionString))
            {
               
                string sql = "SELECT * FROM Respuestas WHERE IdPregunta = @idPregunta";
                
                
                listaRespuestas = db.Query<Respuesta>(sql, new { idPregunta }).ToList();
            }

            return listaRespuestas;
}

}
