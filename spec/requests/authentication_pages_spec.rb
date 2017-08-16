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
      let(:user) {FactoryGirl.create(:user)}
      before do
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_link('Sign out', href: studentsignout_path) }
      it { should_not have_link('Sign in', href: studentsignin_path)}
      
      describe "followed by signout" do
        before { click_link "Sign out"}
        it { should have_link('Sign in')}
      end
    end    
  end
end
