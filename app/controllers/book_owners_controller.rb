class BookOwnersController < ApplicationController

    #GET /book_owners/

    def index
        @book_owners = current_user.book_owners
        json_response(@book_owners)
    end
    
    # POST /book_owners
    def create
        @book_owner = current_user.book_owners.create!(book_owner_params)
        json_response(@book_owner, :created)
    end
    
    #GET /book_owners/:id
    def show
        @book_owner = BookOwner.find(params[:id])
        json_response(@book_owner)
    end

    private 
    
    def book_owner_params
        params.permit(:is_active, :is_borrowed, :user_id)
    end

end
