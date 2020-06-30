# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  sesion_token    :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord

    validates :username, presence:true, uniqueness:true
    validates :session_token, :password_digest, presence:true 
    validates :password, length: {minimum: 6, allow_nil: true}
    has_many :subs,
        foreign_key: :user_id,
        class_name: :User
    has_many :posts

    attr_reader :password

    after_initialize :ensure_session_token

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        bcpw = BCrypt::Password.new(self.password_digest)
        bcpw.is_password?(password)
    end

    def self.generate_session_token
        SecureRandom.urlsafe_base64
    end

    def reset_session_token!
        self.session_token = self.class.generate_session_token
        self.save!
        self.session_token
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        user && user.is_password?(password) ? user : nil
    end



    private

    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end


end
