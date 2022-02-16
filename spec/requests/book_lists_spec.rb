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
        before { get "/genres/#{genre_id}/book_lists" }
        
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
end
