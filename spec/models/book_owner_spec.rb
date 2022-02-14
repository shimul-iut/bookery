require 'rails_helper'

RSpec.describe BookOwner, type: :model do
    it { should belong_to(:user) }
    it { should have_many(:book_borrowers) }
    it { should have_many(:book_lists) }
end