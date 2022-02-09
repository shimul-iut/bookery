require 'rails_helper'

RSpec.describe "Genres API", type: :request do
    let!(:genres) {create_list(:genre, 10)}
    let(:genre_id) {genres.first.id}


    describe 'GET /genres' do
        before {get '/genres'}
        
        it 'returs genres' do
            expect(json).not_to be_empty
        end

        it 'returns genres' do
            # Note `json` is a custom helper to parse JSON responses
            expect(json).not_to be_empty
            expect(json.size).to eq(10)
        end

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    describe 'GET /genres/:id' do
        before { get "/genres/#{genre_id}" }
    
        context 'when the record exists' do

            it 'returns the genre' do
                expect(json).not_to be_empty
                expect(json['id']).to eq(genre_id)
            end
    
            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end
        end
    
        context 'when the record does not exist' do
            
            let(:genre_id) { 20 }
    
            it 'returns status code 404' do
                expect(response).to have_http_status(404)
            end
    
            it 'returns a not found message' do
                expect(response.body).to match(/Couldn't find Genre/)
            end
        
        end
    end

      # Test suite for POST /todos
    describe 'POST /genres' do
        # valid payload
        let(:valid_attributes) { { name: 'Science Fiction', popularity_rating: '4.3' } }

        context 'when the request is valid' do
            before { post '/genres', params: valid_attributes }

            it 'creates a genre' do
                expect(json['name']).to eq('Science Fiction')
                expect(json['slug']).to eq('science-fiction')
            end

            it 'returns status code 201' do
                expect(response).to have_http_status(201)
            end
        end

        context 'when the request is invalid' do

            before { post '/genres', params: { title: 'Foobar' } }

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end

            it 'returns a validation failure message' do
                expect(response.body)
                .to match(/Validation failed: Name can't be blank/)
            end
        end
    end
end
