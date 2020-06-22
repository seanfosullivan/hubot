module.exports = (robot) ->

  robot.respond /Q. (.*)/i, (msg) ->
    message = msg.match[1]
    @exec = require('child_process').exec
    command = "python /home/hedge/mybot/hubot/external_scripts/python/knowledgebase.py 'Q.' #{message}"
    @exec command, (error, stdout, stderr) ->
      msg.send stdout

