require 'rails_helper'

RSpec.describe "Book Owners API" do
    
    let!(:genre) { create(:genre )}
    let!(:user) { create(:user) }
    let!(:book_owners) { create_list(:book_owner, 20, user_id: user.id) }
    #let!(:book_owner) { create(:book_owner, user_id: user.id)}
    let!(:book_lists) { create_list(:book_list, 20, genre_id: genre.id, book_owner_id: book_owners.first.id )}
    #let(:genre_id) { genre.id }
    let(:book_owner_id) { book_owners.first.id }
    #let(:id) { book_lists.first.id }
    
    describe 'GET /book_owners' do
        before { get "/book_owners" }

        context "When BookOwner exists" do
            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end  
            
            it 'returns all BookOwners' do
                expect(json).not_to be_empty
                expect(json.size).to eq(20)
            end
        end
    end

    describe 'GET /book_owners/:id' do
        before { get "/book_owners/#{book_owner_id}" }

        context "When BookOwner with ID exists" do  
            
            it 'returns the book_owner' do
                expect(json).not_to be_empty
                expect(json['id']).to eq(book_owner_id)
              end
        end

        context "When BookOwner with ID Does not exist" do
            let(:book_owner_id) {30}

            it 'returns status code 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns a not found message' do
                expect(response.body).to match(/Couldn't find BookOwner/)
            end
        end
    end
    
    # Test suite for POST /book_owners
    describe 'POST /book_owners' do
    # valid payload
        let(:valid_attributes) { { user_id: '1'} }

        context 'when the request is valid' do
            before { post '/book_owners', params: valid_attributes}

            it 'creates a book_owner' do
                expect(json['user_id']).to eq(1)
            end

            it 'returns status code 201' do
                expect(response).to have_http_status(201)
            end
        end
  end
    # describe 'GET /book_owners/:book_owner_id/book_lists' do
    #     before { get "/book_owners/#{book_owner_id}/book_lists" }

    #     context "When BookOwner with BookLists exists" do
    #         it 'returns status code 200' do
    #             expect(response).to have_http_status(200)
    #         end  
            
    #         it 'returns all BookOwner BookLists' do
    #             expect(json).to eq(20)
    #         end
    #     end

    #     context "When BookOwner Does not exist" do
    #         let(:book_owner_id) {30}

    #         it 'returns status code 404' do
    #             expect(response).to have_http_status(404)
    #         end

    #         it 'returns a not found message' do
    #             expect(response.body).to match(/Couldn't find BookOwner/)
    #         end
    #     end
    # end
end