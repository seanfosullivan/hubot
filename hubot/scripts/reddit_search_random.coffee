module.exports = (robot) ->
 
  robot.respond /reddit me(.*)$/i, (msg) ->
    name = msg.match[1].trim()
    
    if name is ""
      url = "all"
    else
      url = name

    msg.http("http://www.reddit.com/r/#{url}.json")
    .get() (err, res, body) ->
      try
        data = JSON.parse body
        children = data.data.children
        text = msg.random(children).data

        post = text.title.replace(/\*\.\.\.$/,'') + ' ' + text.selftext.replace(/^\.\.\.\s*/, '')

        msg.send post.trim()

      catch ex
        msg.send "Erm, something went wrong - #{ex}"
