class CommandHandler

  ALLOWED_COMMANDS = {
      'info' => {
          'info' => 'Shows information about ČSAS bot.'
      },
      'convert' => {
          'convert [amount] [currency] to [currency]' => 'Converts amounts between available currencies.'
      },
      'rate' => {
          'rate [currency]/[currency]' => 'Returns exchange rate between given currencies.',
          'rate [currency]' => 'Returns exchange rate of given currency in CZK.'
      },

      'currencies' => {
          'currencies' => 'Shows list of available currencies.'
      },
      'help' => {}
  }

  def self.handle(command,parameters)
    if ALLOWED_COMMANDS.include?(command)
      "#{command.titleize}Handler".constantize.new.handle(parameters)
    else
      return "Oh, Sorry! I don't understand *#{command}*. Type `/csbot help` for available commands"
    end
  end

end