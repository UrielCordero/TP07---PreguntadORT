using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP07___PreguntadORT.Models;

namespace TP07___PreguntadORT.Controllers
{
   public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }

    public IActionResult ConfigurarJuego()
    {
        ViewBag.Dificultades = Juego.ObtenerDificultades();
        ViewBag.Categorias = Juego.ObtenerCategorias();
        return View();
    }

    public IActionResult Comenzar(string username, int dificultadId, int categoriaId)
    {
       
        Juego.CargarPartida(username, dificultadId, categoriaId);
        return RedirectToAction("Jugar");
    }

    public IActionResult Jugar()
    {
        Pregunta siguientePregunta = Juego.ObtenerProximaPregunta();

        if (siguientePregunta != null)
        {
             List<Respuesta> ListaRespuestas = Juego.ObtenerProximasRespuestas(siguientePregunta.idPregunta);

            ViewBag.siguientePregunta = siguientePregunta;
            ViewBag.listaRespuestas = ListaRespuestas;

            return View("Juego");
        }
        else
        {
            ViewBag.Username = Juego.Username; 
            ViewBag.PuntajeFinal = Juego.PuntajeActual; 
            return View("Fin");
        }
    }

    [HttpPost]
    public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        bool esCorrecta = Juego.VerificarRespuesta(idRespuesta);

        ViewBag.EsCorrecta = esCorrecta;
        ViewBag.RespuestaCorrecta = Juego.ObtenerRespuestaCorrecta(idPregunta);

        return View("Respuesta");
    }
}

}
