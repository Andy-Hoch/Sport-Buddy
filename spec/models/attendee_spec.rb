require 'rails_helper'

RSpec.describe Attendee, type: :model do
  context 'with DB columns' do
    {
      user_id: :integer,
      sport_session_id: :integer
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type type }
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:sport_session) }
  end
end
