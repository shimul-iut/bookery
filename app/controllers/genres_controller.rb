class GenresController < ApplicationController
    before_action :set_genre, only: [:show]

    #GET /genres
    def index
        @genres = Genre.all
        json_response(@genres)
    end
    
    # POST /genres
    def create
        @genre = Genre.create!(genre_params)
        json_response(@genre, :created)
    end

    #GET /genres/:id
    def show
        json_response(@genre)
    end

    private

    def genre_params
        # whitelist params
        params.permit(:name , :popularity_rating)
    end

    def set_genre
        @genre = Genre.find(params[:id])
    end
end
