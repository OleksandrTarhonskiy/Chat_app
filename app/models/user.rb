class User < ApplicationRecord
  has_many :chat_messages

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :last_name,  presence: true
  validates :first_name, presence: true
  validates :password, :password_confirmation, presence: true, length: { minimum: 6 }
end
