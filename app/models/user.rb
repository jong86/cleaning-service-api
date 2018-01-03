class User < ApplicationRecord
  has_secure_password
  validates :type, inclusion: { in: %w(Client Employee Admin), message: "is invalid" }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true, format: {
    with: /\A[a-zA-Z0-9_]+\z/, message: "only allows letters, numbers and underscore characters"
  }
  validates :email, uniqueness: true, :email_format => { :message => "is invalid" }
  validates :password, :length => { :minimum => 8 }
end
