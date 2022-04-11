using Genie, Genie.Router, Genie.Renderer.Html, .Renderer.Json, Genie.Requests
using HTTP
using JSON2
using Movies
using MoviesController

route("/", MoviesController.index)
