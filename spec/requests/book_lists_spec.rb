require 'rails_helper'

RSpec.describe "Book Lists API" do
    
    let!(:genre) { create(:genre )}
    let!(:user) { create(:user) }
    let!(:book_owners) { create_list(:book_owner, 20, user_id: user.id) }
    #let!(:book_owner) { create(:book_owner, user_id: user.id)}
    let!(:book_lists) { create_list(:book_list, 20, genre_id: genre.id, book_owner_id: book_owners.first.id )}
    let(:genre_id) { genre.id }
    let(:book_owner_id) { book_owners.first.id }
    let(:id) { book_lists.first.id }

    describe 'GET /genres/:genre_id/book_lists' do
        before { get "/genres/#{genre_id}/book_lists", params: {}, headers: headers }
        
        context "When Genre exists" do
            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end  
            
            it 'returns all Genre BookLists' do
                expect(json.size).to eq(20)
            end
        end

        context "When Genre Does not exist" do
            let(:genre_id) {20}

            it 'returns status code 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns a not found message' do
                expect(response.body).to match(/Couldn't find Genre/)
            end
        end
    end

    # Test suite for POST /genres/:genre_id/book_lists
    describe 'POST /genres/:genre_id/book_lists' do
        let(:valid_attributes) { { name: '1984', author: 'G. Orwell', unique_id: 'GH4F3WT3QF32T2L14', image_url: 'https://gas.com', isbn: '56163261551' } }

        before { post "/genres/#{genre_id}/book_lists", params: valid_attributes, headers: headers }
            context 'when request attributes are valid' do

                it 'returns status code 201' do
                    expect(response).to have_http_status(201)
                end
            end
        before { post "/genres/#{genre_id}/book_lists", params: {} }
        
            context 'when an invalid request' do

                it 'returns status code 422' do
                    expect(response).to have_http_status(422)
                end

                it 'returns a failure message' do
                    expect(response.body).to match(/Validation failed: name can't be blank/)
                end
        end
    end

    describe 'GET /genres/:genre_id/books_lists/:id'
        before {get "/genres/#{genre_id}/book_lists/#{id}", params: {}, headers: headers}

        context 'When Book List item exists' do
            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end
        
            it 'returns the book_list' do
                expect(json['id']).to eq(id)
            end
        end
    

        context 'when Booklist item does not exist' do
            let(:id) { 0 }
    
            it 'returns status code 404' do
                expect(response).to have_http_status(404)
            end
    
            it 'returns a not found message' do
                expect(response.body).to match(/Couldn't find BookList/)
            end
        end
    end
#end