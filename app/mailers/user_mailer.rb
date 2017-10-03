class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def confirmation_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to XBCampus')
    end
end