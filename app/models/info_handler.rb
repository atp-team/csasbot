class InfoHandler

  def handle(parameters)
    text = "My name is *ČSAS bot* and i've been created by <http://applifting.cz|Applifting>:applifting: ,
 using  :csaswebapi: <https://developers.csas.cz/|WebAPI> service. My father is <https://twitter.com/snopedom|@snopedom> and my godfather is <https://twitter.com/vratislav_|@vratislav_>\n\nMy current version is `0.2.0`"
    thumb_url = 'http://slack-csbot.herokuapp.com/img/robot.png'
    color = '#005593'
    title = 'Hello world!'
    return {
        attachments: [
            {
                text: text,
                thumb_url: thumb_url,
                color: color,
                title: title,
                mrkdwn_in: ['text']
            }
        ],
        text: ''
    }
  end

end