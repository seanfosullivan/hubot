module.exports = (robot) ->

  robot.respond /joke me(.*)$/i, (msg) ->
    name = msg.match[1].trim()

    if name is "dad"
      url = "dadjokes"
    else if name is "clean"
      url = "cleanjokes"
    else if name is "mom"
      url = "mommajokes"
    else if name is "classy"
      url = "classyjokes"
    else if name is "jokes"
      url = "jokes"
    else if name is "mean"
      url = "meanjokes"
    else
      urls = ["dadjokes", "cleanjokes", "mommajokes", "classyjokes", "jokes", "meanjokes"]
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
        msg.send "Erm, something went EXTREMELY wrong - #{ex}"

