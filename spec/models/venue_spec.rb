require 'rails_helper'

RSpec.describe Venue, type: :model do
  context 'with DB columns' do
    {
      name: :string,
      address: :string,
      description: :string
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type type }
    end
  end

  describe 'associations' do
    it { should have_many(:sport_sessions) }
  end
end
