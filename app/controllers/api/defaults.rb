module API
  module Defaults
    extend ActiveSupport::Concern

    included do
      format :json

      rescue_from ActiveRecord::RecordNotFound do |e|
        rack_response('{ "success": false, "error_msg": "Record not Found", "error_code": 404 }', 404)
      end

      # HTTP Basic Authentication
      http_basic do |username, password|
        username ==  "my_username"  && password == "my_password"
      end
    end
  end
end