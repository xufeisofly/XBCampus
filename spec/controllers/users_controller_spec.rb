require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  ##nameError with usermailer
  describe "POST /signup" do
    it "should deliver the confirmation email" do
      expect(UserMailer).to(receive(:confirmation_email).with("email@example.com", "Jimmy Bean", "foobar", "foobar"))

      post :signup
    end
  end

end
