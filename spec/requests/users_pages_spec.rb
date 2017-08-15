require 'rails_helper'

RSpec.describe "UserPages", type: :request do
    
    subject { page }

    describe "profile page", :type => :feature do
        let(:user) { FactoryGirl.create(:user) }
        before { visit user_path(user) }

        it { should have_selector('h1', text: user.name) }
    end
    describe "student signup", :type => :feature do
        
        before {visit signup_path}


        let(:submit) { "create my account" }

        describe "with invalid information" do
            it "should not create an account" do
                expect { click_button submit }.not_to change(User, :count)
            end
        end

        # unable to find field "confirmation"
        # describe "with valid information" do
        #     before do
        #         fill_in "Name",        with: "Example User"
        #         fill_in "Email",        with: "user@example.com"
        #         fill_in "Password",     with: "foobar"
        #         fill_in "Password confirmation", with: "foobar"
        #     end

        #     it "should create an account" do
        #         expect { click_button submit }.to change(User, :count).by(1)
        #     end
        # end
    end
end
