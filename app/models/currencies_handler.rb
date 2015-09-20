class CurrenciesHandler

  def handle(parameters)
    response = "This is a list of currencies that i can support:\n\n"
    rates = Endpoint.new.get_exchange_rates
    rates.each do |rate|
      response += "`#{rate['shortName']}` - #{rate['country']}\n"
    end
    return {text: response}
  end

end