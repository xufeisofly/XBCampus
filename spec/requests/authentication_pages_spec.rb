require 'rails_helper'

RSpec.describe "AuthenticationPages", type: :request do
  # describe "GET /authentication_pages" do
  #   it "works! (now write some real specs)" do
  #     get authentication_pages_index_path
  #     expect(response).to have_http_status(200)
  #   end
  # end

  subject { page }

  describe "studentsignin page", :type => :feature do
    before { visit studentsignin_path}

    it { should have_selector('h1', text: 'Sign in')}
  end

  describe "studentsignin", :type => :feature do
    before { visit studentsignin_path } 
    
    let(:submit) { "Sign in" }
    
    describe "with invalid information" do
      before {click_button submit}
      
      it { should have_selector('div.alert.alert-error', text: 'Invalid')}
    end

    describe "with valid information" do
      let(:user) {FactoryBot.create(:user)}
      before do
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
        cookies[:remember_token] = user.remember_token
      end

      # it { should have_link('Sign out', href: studentsignout_path) }
      # it { should have_link('Settings', href: edit_user_path(user))}
      # it { should_not have_link('Sign in', href: studentsignin_path)}
      
      describe "followed by signout" do
        before { click_link "Sign out"}
        it { should have_link('Sign in')}
      end
    end    
  end

  describe "Authorization", :type => :feature do

    describe "for non-signed-in users" do
      let(:user) { FactoryBot.create(:user) }

      describe "submitting to the update action" do
        before { put user_path(user) }
        specify { response.should redirect_to(studentsignin_path) }
      end

      describe "visit Users#index page" do
        before { get users_path}
        specify { response.should redirect_to(studentsignin_path)}
      end
    end

    describe "as wrong user" do
      let(:user) { FactoryBot.create(:user) }
      let(:wrong_user) { FactoryBot.create(:user, email: "wrong@example.com") }
      before { sign_in user }

      describe "visit Users#edit page" do
        before { visit edit_user_path(wrong_user) }
        it { should_not have_selector('h1', text: "Update your profile") }
      end

      describe "submitting a PUT request to the Users#update action" do
        before { put user_path(wrong_user) }
        specify { response.should redirect_to(studentsignin_path) }
      end
    end
  end
end
