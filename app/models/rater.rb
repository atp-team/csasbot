class Rater

  def get_rate(first_currency,second_currency)
    rates = Endpoint.new.get_exchange_rates
    begin
      if second_currency == 'CZK'
        rate = get_currency_rate_in_czk(rates,first_currency)
        if rate.class == String
          return rate
        else
          return "1 #{first_currency} = #{rate.round(2)} CZK"
        end
      elsif first_currency == 'CZK'
        rate = get_currency_rate_in_czk(rates,second_currency)
        if rate.class == String
          return rate
        else
          return "1 CZK = #{(1/rate).round(2)} #{second_currency}"
        end
      else
        get_rate_for_other_currencies(rates,first_currency,second_currency)
      end
    rescue
      return 'Oh, sorry! I cannot process your request. Example is `/csbot rate EUR/CZK` or `/csbot rate EUR`'
    end
  end

  def get_currency_rate_in_czk(rates,currency)
    final_rate = nil
    if currency == 'CZK'
      return 1.0
    end
    rates.each do |rate|
      if rate['shortName'] == currency
        final_rate = rate['currMid']/rate['amount']
      end
    end
    if final_rate.to_f == 0.0
      return "I don't support '#{currency}' currency! To see all currencies, type `/csbot currencies`."
    else
      return final_rate.to_f
    end
  end

  private

  def get_rate_for_other_currencies(rates,first_currency,second_currency)
    first_rate = get_currency_rate_in_czk(rates,first_currency)
    second_rate = get_currency_rate_in_czk(rates,second_currency)
    return "1 #{first_currency} = #{(first_rate/second_rate).round(2)} #{second_currency}"
  end

end