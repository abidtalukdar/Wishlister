class User < ApplicationRecord

    has_many :wishlists

    validates_presence_of :username
    validates_uniqueness_of :username

    has_secure_password

    # def password=(password)
    #     self.password_digest = BCrypt::Password.create(password)
    # end

    # def authenticate(password)
    #     BCrypt::Password.new(self.password_digest) == password
    # end

end
 