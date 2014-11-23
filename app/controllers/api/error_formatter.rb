module API
  module ErrorFormatter
    def self.call message, backtrace, options, env
      { error_msg: "Bad Request", error_code: 400, success: false }.to_json
    end
  end
end