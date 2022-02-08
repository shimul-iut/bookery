require 'rails_helper'

RSpec.describe Genre, type: :model do
    it { should have_many(:book_lists) }
    it { should validate_presence_of(:name) }
    
end