using Genie, Genie.Router, Genie.Renderer.Html, .Renderer.Json, Genie.Requests
using HTTP
using JSON2
using Movies
using MoviesController

route("/") do
  serve_static_file("welcome.html")
end

route("/movies", MoviesController.index)
