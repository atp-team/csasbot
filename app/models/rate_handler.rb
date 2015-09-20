class RateHandler

  def handle(parameters)
    if parameters.first == 'help'
      return "Oh, Sorry! I don't understand *rate #{parameters.first}*. Type `/csbot help` for available commands"
    end
    currencies = parameters.first.split('/')
    first_currency = currencies.first.upcase
    if currencies.second != nil
      second_currency = currencies.second.upcase
      return {text: Rater.new.get_rate(first_currency,second_currency)}
    else
      return {text: Rater.new.get_rate(first_currency,'CZK')}
    end
  end
end