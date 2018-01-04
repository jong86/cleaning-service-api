class User < ApplicationRecord
    has_secure_password
    validates :type, inclusion: { in: %w(Client Employee Admin), message: "is invalid" }
    validates :first_name, presence: true, if: lambda { new_record? || !first_name.blank? }
    validates :last_name, presence: true, if: lambda { new_record? || !last_name.blank? }
    validates :username, presence: true, uniqueness: true, format: {
      with: /\A[a-zA-Z0-9_]+\z/, message: "only allows letters, numbers and underscore characters"
    }, if: lambda { new_record? || !username.blank? }
    validates :email, uniqueness: true, :email_format => { :message => "is invalid" }, if: lambda { new_record? || !email.blank? }
    validates :password, confirmation: true, :length => { :minimum => 8 }, if: lambda { new_record? || !password.blank? }
    # The lambda functions allow ignoring the validations on updates if they are left blank
end
