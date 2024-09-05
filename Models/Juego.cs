static class Juego
{
private static string Username;
private static int PuntajeActual;
private static int CantidadPreguntasCorrectas;
private static int ContadorNroPreguntaActual;
private static Pregunta PreguntaActual;
private static List<Pregunta> ListaPreguntas;
private static List<Respuesta> ListaRespuestas;


    public static void IniciarJuego()
    {
        Username = string.Empty;
        PuntajeActual = 0;
        CantidadPreguntasCorrectas = 0;
        ContadorNroPreguntaActual = 0;
        PreguntaActual = null;
        ListaPreguntas=null;
        ListaRespuestas=null;
    }
   


}