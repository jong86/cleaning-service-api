class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password, username)
    @email = email
    @password = password
    @username = username
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :email, :password, :username

  def user
    if (email)
      user = User.find_by_email(email)
      return user if user && user.authenticate(password)
    elsif (username)
      # Allows users to log in with username too
      # TODO: refactor if possible to eliminate DB double-dipping
      user_by_username = User.where(username: username)
      if (user_by_username.exists?)
        email = user_by_username[0][:email]
        user = User.find_by_email(email)
        return user if user && user.authenticate(password)
      end
    end

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end
