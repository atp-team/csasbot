class HelpHandler

  def handle(parameters)
    response = "This is a list of all commands that i am able to process:\n"
    CommandHandler::ALLOWED_COMMANDS.each do |command|
      if command != 'help'
        command.second.each do |hint|
          response += "`#{hint.first}` - #{hint.second}\n"
        end
      end
    end
    return {text: response}
  end

end