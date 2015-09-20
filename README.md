# ČSAS Bot for Slack!
CSAS Slack BOt is open source itegration into Slack messaging app. CSAS BOT was created as an example application for ČSAS WebApi service integration.

## Prerequisites

To use CSAS BOT you need account on Slack messaging app, have at least two free integrations left in your Slack team.

Furthermore you need to generate web api key from [WebApi developer portal](https://developers.csas.cz/).

## Deployment

1. Deploy repository on server (for example to [Heroku](https://www.heroku.com/))
2. Add **Slash Commands** integration into your Slack team
    * Set command `/csbot` and POST url `<your server url>/csbot`
4. Add **Incoming WebHook** integration into your Slack team
5. Set Environmental variables
    * `CSAS_WEB_API_KEY`=*`<api key from WebApi service>`*
    * `CSBOT_SLACK_TOKENS`=*`<slack_token1=hook_url1;slack_token2=hook_url2>`*
6. Run `/csbot help` or `/csbot info` command and enjoy your own CSAS BOT! 

## Contributing

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history. 
* Send us a pull request.
