module Movies

import Base: @kwdef

export CoverMetadata
export Movie
export ImdbMovie
export Queue
export QueueItem

@kwdef mutable struct QueueItem
    id::String
end

@kwdef mutable struct Queue
    queue::Array{QueueItem}
end

@kwdef mutable struct CoverMetadata
    url::String
    ratio::Float32
end

@kwdef mutable struct ImdbMovie
    id::String
    title::String
    year::Int
    rating::String
    cover::CoverMetadata
    coverUrl::String
end

@kwdef mutable struct Movie
    id::String
    status::String
    imdb::ImdbMovie
end

end
