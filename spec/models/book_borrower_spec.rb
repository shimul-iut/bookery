require 'rails_helper'

RSpec.describe BookBorrower, type: :model do
    it { should belong_to(:user) }
    it { should belong_to(:book_list) }
    it { should belong_to(:book_owner) }
end  