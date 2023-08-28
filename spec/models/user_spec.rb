require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with DB columns' do
    {
      first_name: :string,
      last_name: :string,
      sex: :integer,
      email: :string,
      birth_date: :date,
      encrypted_password: :string,
      phone_number: :string
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type type }
    end
  end

  describe 'associations' do
    it { should have_many(:attendees) }
    it { should have_many(:events).through(:attendees).source(:sport_session) }
    it { should have_many(:my_events).class_name('SportSession') }
    it { should have_many(:messages) }
  end
end
