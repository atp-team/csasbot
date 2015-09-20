token_string = ENV['CSBOT_SLACK_TOKENS']
if token_string == nil
  raise StandardError.new("Slack tokens environment variable is not defined.
Please define CSBOT_SLACK_TOKENS with format token1=hook_url1;token2=hook_url2")
end
tokens = {}
token_pairs = token_string.split(';')
token_pairs.each do |pair|
  token_and_url = pair.split('=')
  if token_and_url.count < 2
    raise StandardError.new('Please define CSBOT_SLACK_TOKENS with format token1=hook_url1;token2=hook_url2')
  end
  tokens[token_and_url[0].strip] = token_and_url[1]
end

Rails.application.config.x.slack_tokens = tokens