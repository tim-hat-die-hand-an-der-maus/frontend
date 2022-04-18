module MoviesController
    using Genie, Genie.Router, Genie.Renderer.Html, Genie.Requests
    using HTTP
    using JSON2
    using Movies
    using MoviesController

    function queue()
        response = HTTP.request("GET", "http://api:8080/queue", [("Accept", "application/json")])

        if response.status == 200
            try
                obj = JSON2.read(String(response.body), Queue)
            catch err
                throw(DomainError("couldn't decode json from response"))
            end
        else
            throw(DomainError("couldn't retrieve queue from api"))
        end
    end

    function getMovie(id)
        url = "https://api.timhatdiehandandermaus.consulting/movie/$id"
        response = HTTP.request("GET", url, [("Accept", "application/json")])

        if response.status == 200
            body = String(response.body)
            try
                obj = JSON2.read(body, Movie)
            catch err
                throw(err)
    #           throw(DomainError("couldn't decode json from response ($err) `$body` ($response)"))
            end
        else
            throw(DomainError("couldn't retrieve queue from api"))
        end
    end

    getMovies(ids) = map(getMovie, ids)

    function index()
      ids = map((item) -> item.id, queue().queue)
      movies = getMovies(ids)

      html(:movies, :index, movies = movies)
    end
end
