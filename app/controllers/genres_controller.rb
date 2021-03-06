class GenresController < ApplicationController
    before_action :set_genre, only: [:show, :update]

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

      # PUT /genres/:id
    def update
        @genre.update(genre_params)
        head :no_content
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
