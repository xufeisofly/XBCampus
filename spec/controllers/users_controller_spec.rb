require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  ##nameError with usermailer
  # describe "POST /student/signup" do
  #   it "should deliver the confirmation email" do
  #     post :create, :params => { :user => { :name => "Jimmy Bean", :email => "email@example.com", :password => "foobar11", :password_confirmation => "foobar11"}}
  #     expect(UserMailer).to(receive(:confirmation_email).with("email@example.com", "Jimmy Bean", "foobar", "foobar"))

      
  #   end
  # end

end
