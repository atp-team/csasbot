class Endpoint
  include HTTParty
  base_uri 'https://api.csas.cz/sandbox/webapi/api/v1/'

  def get_exchange_rates
    return self.class.get('/exchangerates',
                          headers:
                              { 'Content-Type' => 'application/json',
                                'WEB-API-Key' => Rails.application.config.x.csas_web_api_key
                              }).parsed_response
  end
end
