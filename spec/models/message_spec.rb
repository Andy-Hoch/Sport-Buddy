require 'rails_helper'

RSpec.describe Message, type: :model do
  context 'with DB columns' do
    {
      user_id: :integer,
      chatroom_id: :integer,
      content: :string
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type type }
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:chatroom) }
  end
end
