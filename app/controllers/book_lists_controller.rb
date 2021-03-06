class BookListsController < ApplicationController
    before_action :set_genre
    before_action :set_book_owner
    before_action :set_genre_book_list, only: [:show, :update]

    #GET /genres/:genre_id/book_lists

    def index
        json_response(@genre.book_lists)
    end
    
    # GET /genres/:genre_id/book_lists/:id
    def show
        json_response(@book_list)
    end

    # POST /genres/:genre_id/book_lists
    def create
        @genre.book_lists.create!(book_list_params)
        json_response(@genre, :created)
    end

    #GET /book_owners/:book_owner_id/book_lists

    # def index
    #     json_response(@book_owner.book_lists)
    # end
 
    private 
    
    def book_list_params
        params.permit(:name, :author, :unique_id, :image_url, :isbn, :genre_id, :book_owner_id)
    end
    
    def set_genre
        @genre = Genre.find(params[:genre_id])
    end 

    def set_genre_book_list
        @book_list = @genre.book_lists.find_by!(id: params[:id]) if @genre 
    end

    def set_book_owner
        @book_owner = BookOwner.find(params[:book_owner_id])
    end 

    # def book_owner_book_list
    #     @book_list = @book_owner.book_lists.find_by!(id: params[:id]) if @book_owner 
    # end

end
