class ConvertHandler

  def handle(parameters)
    amount = parameters.first.delete(' ')
    if parameters.first == 'help'
      return "Oh, Sorry! I don't understand *help convert #{parameters.first}*. Type `/csbot help` for available commands"
    end
    if amount =~ /[[:alpha:]]/
      return 'Ou, sorry! I cannot process your request. Amount must be a number.'
    end
    first_currency = parameters.second.delete(' ').upcase
    second_currency = parameters.last.delete(' ').upcase
    return {text: Converter.new.convert_amount(amount.to_f,first_currency,second_currency)}
  end

end