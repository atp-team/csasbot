class Converter

  def convert_amount(amount,first_currency,second_currency)
   begin
      if first_currency == second_currency
        return "#{amount} #{second_currency}"
      end
      rates = Endpoint.new.get_exchange_rates
      if first_currency == 'CZK'
        convert_from_czk(amount,rates,second_currency)
      elsif second_currency == 'CZK'
        convert_to_czk(amount,rates,first_currency)
      else
        convert_other_currencies(amount,rates,first_currency,second_currency)
      end
    rescue
     return 'Oh, sorry! I cannot process your request. Example is `/csbot convert 20 EUR to CZK`'
    end
  end



  def convert_from_czk(amount,rates,second_currency)
    rate = Rater.new.get_currency_rate_in_czk(rates,second_currency)

    if rate.class == String
      return rate
    end

    return "#{number_to_currency(amount)} CZK is #{number_to_currency((amount/rate).round(2))} #{second_currency}"
  end

  def convert_to_czk(amount,rates,first_currency)
    rate = Rater.new.get_currency_rate_in_czk(rates,first_currency)

    if rate.class == String
      return rate
    end

    return "#{number_to_currency(amount)} #{first_currency} is #{number_to_currency((amount*rate).round(2))} CZK"

  end

  def convert_other_currencies(amount,rates,first_currency,second_currency)
    first_rate = Rater.new.get_currency_rate_in_czk(rates,first_currency)

    if first_rate.class == String
      return first_rate
    end

    amount_in_czk = amount*first_rate
    second_rate = Rater.new.get_currency_rate_in_czk(rates,second_currency)

    if second_rate.class == String
      return second_rate
    end

    return "#{number_to_currency(amount)} #{first_currency} is #{number_to_currency((amount_in_czk/second_rate).round(2))} #{second_currency}"
  end

  private

  def unsupported_currency(currency)
    return "I don't support '#{currency}' currency! To see all currencies, type `/csbot currencies`."
  end

  def number_to_currency(number)
    ActionController::Base.helpers.number_to_currency(number,{delimiter: ' ',unit: ''})
  end

end