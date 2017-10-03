module SessionsHelper
    # use remember_token for user records, the expire time is 10 days
    def student_signed_in(user)
        cookies[:remember_token] = { value: user.remember_token,
                                     expires: 10.days.from_now.utc }
        self.current_student = user
    end

    def student_signed_in?
        !current_student.nil?
    end

    def current_student=(user)
        @current_student = user
    end

    def current_student
        @current_student ||= User.find_by_remember_token(cookies[:remember_token])
    end

    def current_student?(user)
        user == current_student
    end

    def student_signed_out
        self.current_student = nil
        cookies.delete(:remember_token)
    end
end
