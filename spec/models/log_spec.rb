require 'rails_helper'

RSpec.describe Log, type: :model do
  it { should validate_presence_of(:logtype) }
end
