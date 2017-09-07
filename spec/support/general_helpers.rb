module Features
    module GeneralHelpers
        def sign_in(user)
          visit studentsignin_path
          fill_in "Email", with: user.email
          fill_in "Password", with: user.password
          click_button "Sign in"
        
          #cookies[:remember_token] = user.remember_token
        end
    end
end