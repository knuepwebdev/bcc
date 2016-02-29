module RequestMacros
  include Warden::Test::Helpers

  def sign_in(user)
    login_as user
  end
end
