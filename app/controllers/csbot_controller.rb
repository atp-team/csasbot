class CsbotController < ApplicationController
  skip_before_filter :verify_authenticity_token

  include HTTParty
  base_uri 'https://hooks.slack.com/services'

  def command_parser
    param_array = params[:text].split(' ')
    command = param_array.first
    param_array.shift
    parameters = param_array

    before_text = "#{params[:user_name].titleize} asked me to execute `#{params[:text]}`.\n\n"
    response_body =  CommandHandler.handle(command,parameters)
    if response_body.is_a? String
      response_body = {text: response_body}
    end
    response_body[:text] = before_text + response_body[:text]
    location = guess_message_location(params[:channel_name],params[:user_name])
    response_body = response_body.merge(location)


    send_data_to_bot(params[:token],response_body)


    render nothing: true, status: 200
  end

  private

  def send_data_to_bot(token,body)
    url = Rails.application.config.x.slack_tokens[token]
    self.class.post(url, body: body.to_json)
  end

  def guess_message_location(channel_name,user_name)
    if channel_name == 'directmessage'
      return { channel: "@#{user_name}" }
    elsif channel_name == 'privategroup'
      return {}
    else
      return { channel: "##{channel_name}" }
    end
  end

end
