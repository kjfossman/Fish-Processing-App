class User < ApplicationRecord
    
    has_secure_password
    validates :username, uniqueness: true
    validates :username, presence: true

    def password_verified(password)
        verified = authenticate(password)
        errors.add(:password, 'is invalid') unless verified
        verified
    end

  
end
