module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      sign_in user
    end
  end

  def create_flats
    before(:each) do
      FactoryBot.create(:flat, 3)
    end
  end
end
