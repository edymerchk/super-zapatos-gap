module AuthHelper
  def basic_auth(user, password)
    ActionController::HttpAuthentication::Basic.encode_credentials user, password
  end

  def headers
    {'HTTP_AUTHORIZATION' =>  basic_auth('my_username','my_password') }
  end
end