require 'rails_helper'

RSpec.describe BookList, type: :model do
    it { should belong_to(:genre) }
    it { should have_many(:book_borrowers) }
end  