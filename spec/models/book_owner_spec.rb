require 'rails_helper'

RSpec.describe BookOwner, type: :model do
    it { should belong_to(:user) }
    it { should belong_to(:book_list) }

    it { should have_many(:book_borrowers) }
end