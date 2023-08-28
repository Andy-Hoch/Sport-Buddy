require 'rails_helper'

RSpec.describe Chatroom, type: :model do
  describe 'associations' do
    it { should have_many(:messages) }
    it { should have_many(:users).through(:messages) }
    it { should have_many(:sport_sessions) }
  end
end
