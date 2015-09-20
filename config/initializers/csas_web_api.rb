key_string = ENV['CSAS_WEB_API_KEY']
if key_string == nil
  raise StandardError.new("CSAS WEB API key environment variable is not defined.
Please define CSAS WEB API key.")
end


Rails.application.config.x.csas_web_api_key = key_string