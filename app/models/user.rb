class User < ApplicationRecord
    has_many :comments
    before_create :confirmation_token

    def user_params
        params.require(:user).permit(:name, 
                                     :email, 
                                     :password, 
                                     :password_confirmation)
    end
    has_secure_password

    before_save { |user| user.email = email.downcase }
    before_save :create_remember_token

    validates :password_confirmation, presence: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :name, presence: true, length: { maximum: 25 }
    VAILD_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                      format: {with: VAILD_EMAIL_REGEX}, 
                      uniqueness: { case_sensitive: false}

    private

    def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
    end

    def confirmation_token
        if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
    end

    def email_activate
        self.email_confirmed = true
        self.confirm_token = nil
        save!(:validate => false)
    end
end
