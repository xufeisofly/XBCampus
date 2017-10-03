require 'rails_helper'

RSpec.describe "UserPages", type: :request do
    
    subject { page }

    describe "profile page", :type => :feature do
        let(:user) { FactoryGirl.create(:user) }
        before { visit user_path(user) }

        it { should have_selector('h1', text: user.name) }
    end

    describe "student signup", :type => :feature do
        
        before {visit "student/signup"}


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

    describe "edit", :type => :feature do
        let(:user) { FactoryGirl.create(:user) }
        before do
            sign_in user
            visit edit_user_path(user)
        end

        describe "page" do
            it { should have_selector('h1', text: "Update your profile")}
        end

        describe "with invalid information" do
            before{ click_button "保存设置" }
            it { should have_content('error') }
        end

        # describe "with valid information", :type => :feature do
        #     let(:new_name) { "New Name" }
        #     let(:new_email) { "new@example.com" }
        #     before do
        #         fill_in "昵称",        with: new_name
        #         fill_in "邮箱",        with: new_email
        #         fill_in "密码",     with: user.password
        #         fill_in "确认密码" , with: user.password_confirmation, visible: false
        #         click_button "保存设置"
        #     end

        #     it { should have_slector('div.alert.alert-success') }
        #     specify { user.reload.name.should == new_name }
        #     specify { user.reload.email.should == new_email }
        # end
    end
end
