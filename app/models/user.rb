class User < ApplicationRecord
    def user_params
        params.require(:user).permit(:name, 
                                     :email, 
                                     :password, 
                                     :password_confirmation)
    end
    has_secure_password

    before_save { |user| user.email = email.downcase }

    validates :password_confirmation, presence: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :name, presence: true, length: { maximum: 25 }
    VAILD_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                      format: {with: VAILD_EMAIL_REGEX}, 
                      uniqueness: { case_sensitive: false}

    
end
