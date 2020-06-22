module.exports = (robot) ->
 
  sleep = (ms) ->
    start = new Date().getTime()
    continue while new Date().getTime() - start < ms

  robot.respond /learn me(.*)$/i, (msg) ->
    name = msg.match[1].trim()
    if name is "news"
      url = "worldnews"
    else if name is "nto"
      url = "nottheonion"
    else if name is "life tips"
      url = "lifeprotips"
    else if name is "science"
      url = "science"
    else if name is "tech"
      url = "technology"
    else if name is "til"
      url = "todayilearned"
    else if name is "fm"
      url = "floridaman"
    else
      urls = ["worldnews", "nottheonion", "science", "technology", "todayilearned", "floridaman"]
      url = msg.random urls
    msg.http("http://www.reddit.com/r/#{url}.json")
    .get() (err, res, body) ->
      try
        data = JSON.parse body
        children = data.data.children
        joke = msg.random(children).data

        joketext = joke.title.replace(/\*\.\.\.$/,'') + ' ' + joke.selftext.replace(/^\.\.\.\s*/, '')
        msg.send joketext.trim()

      catch ex
        msg.send "Erm, something went wrong - #{ex}"
