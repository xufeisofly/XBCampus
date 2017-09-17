class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_email(params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            if user.email_confirmed
                student_signed_in(user)
                redirect_to root_path
            else
                flash.now[:error] = "Please activate your account"
                render 'new'
            end
        else
            flash.now[:error] = 'Invalid email/password'
            render 'new'
        end
    end

    def destroy
        student_signed_out
        redirect_to root_path
    end
end
