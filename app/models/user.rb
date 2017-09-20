class User < ApplicationRecord
    def user_params
        # the attributions for a user model
        params.require(:user).permit(:name, 
                                     :email, 
                                     :password, 
                                     :password_confirmation)
    end
    has_secure_password

    before_save { |user| user.email = email.downcase }
    
    #password min-length: 6, format(at least one letter and one number)
    #name length: 1-25, unique
    #email format, unique(also add_index_to_users in database to ensure uniqueness)
    VALID_PASSWORD_FORMAT = /\A(?=.*[a-zA-Z])(?=.*[0-9])/
    validates :password_confirmation, presence: true
    validates :password, presence: true, 
                         length: { minimum: 6 },
                         format: {with: VALID_PASSWORD_FORMAT}
    validates :name, presence: true, 
                     length: { maximum: 25 }, 
                     uniqueness: { case_sensitive: true}
    VAILD_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                      format: {with: VAILD_EMAIL_REGEX},
                      uniqueness: { case_sensitive: false}

    
end
