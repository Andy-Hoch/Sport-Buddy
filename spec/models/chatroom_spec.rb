require 'rails_helper'

RSpec.describe Chatroom, type: :model do
  context 'with DB columns' do
    {
      sport_session_id: :integer
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type type }
    end
  end

  describe 'associations' do
    it { should have_many(:messages) }
    it { should have_many(:users).through(:messages) }
    it { should belong_to(:sport_session) }
  end
end
