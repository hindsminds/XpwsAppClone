class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :password, length: { in: 6..20 }
    validates :email, presence: true, uniqueness: true
    
end
