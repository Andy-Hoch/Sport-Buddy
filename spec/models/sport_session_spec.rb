require 'rails_helper'

RSpec.describe SportSession, type: :model do
  context 'with DB columns' do
    {
      user_id: :integer,
      venue_id: :integer,
      chatroom_id: :integer,
      title: :string,
      description: :string,
      address: :string,
      start_time: :datetime,
      end_time: :datetime,
      skill_level: :integer,
      max_attendees: :integer,
      price: :float
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type type }
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:venue) }
    it { should belong_to(:chatroom) }
    it { should have_many(:attendees) }
    it { should have_many(:participants).through(:attendees).source(:user) }
    it { should have_many(:messages) }
    it { should have_many(:session_categories) }
    it { should have_many(:sport_categories).through(:session_categories) }
  end
end
