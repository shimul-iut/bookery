require 'rails_helper'

RSpec.describe User, type: :model do
    it { should have_many(:book_owners) }
    it { should have_many(:book_borrowers) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:company_email) }
    it { should validate_presence_of(:company_id) }
    it { should validate_presence_of(:phone) }
end