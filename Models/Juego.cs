using System.Collections.Generic;
using TP07___PreguntadORT.Models; 

namespace TP07___PreguntadORT.Models
{
    public static class Juego
{
    public static string Username { get; private set; }
    public static int PuntajeActual { get; private set; }
    public static int CantidadPreguntasCorrectas { get; private set; }
    public static int ContadorNroPreguntaActual { get; private set; }
    public static Pregunta PreguntaActual { get; private set; }
    private static List<Pregunta> ListaPreguntas;
    private static List<Respuesta> ListaRespuestas;

    private static void InicializarJuego()
    {
        Username = string.Empty;
        PuntajeActual = 0;
        CantidadPreguntasCorrectas = 0;
        ContadorNroPreguntaActual = 0;
        PreguntaActual = null;
        ListaPreguntas = new List<Pregunta>();
        ListaRespuestas = new List<Respuesta>();
    }

    public static List<Categoria> ObtenerCategorias()
    {
        return BD.ObtenerCategorias();
    }

    public static List<Dificultad> ObtenerDificultades()
    {
        return BD.ObtenerDificultades();
    }

    public static void CargarPartida(string username, int dificultad, int categoria)
    {
        InicializarJuego();
        Username = username;
        ListaPreguntas = BD.ObtenerPreguntas(dificultad, categoria);
        ListaRespuestas = new List<Respuesta>(); // ListaRespuestas debe ser inicializada
    }

    public static Pregunta ObtenerProximaPregunta()
    {
        if (ListaPreguntas != null && ContadorNroPreguntaActual < ListaPreguntas.Count)
        {
            PreguntaActual = ListaPreguntas[ContadorNroPreguntaActual];
            return PreguntaActual;
        }
        return null;
    }

    public static List<Respuesta> ObtenerProximasRespuestas(int idPregunta)
    {
        return BD.ObtenerRespuestas(idPregunta);
    }

    public static bool VerificarRespuesta(int idRespuesta)
    {
        bool esCorrecta = false;

        Respuesta respuesta = BD.ObtenerRespuestaPorId(idRespuesta);

        if (respuesta != null)
        {
            esCorrecta = respuesta.Correcta;

            if (esCorrecta)
            {
                PuntajeActual += 10;
                CantidadPreguntasCorrectas++;
            }

            ContadorNroPreguntaActual++;
            PreguntaActual = ObtenerProximaPregunta();
        }

        return esCorrecta;
    }

    public static Respuesta ObtenerRespuestaCorrecta(int idPregunta)
    {
        return BD.ObtenerRespuestaCorrecta(idPregunta);
    }
}
}
