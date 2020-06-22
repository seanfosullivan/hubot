module.exports = (robot) ->

  robot.hear /movie me|film me/i, (res) ->
    @exec = require('child_process').exec
    command = "python /home/hedge/mybot/hubot/external_scripts/python/film.py"
    @exec command, (error, stdout, stderr) ->
      res.send stdout

  robot.hear /tv me|tv show me|telly me/i, (res) ->
    @exec = require('child_process').exec
    command = "python /home/hedge/mybot/hubot/external_scripts/python/telly.py"
    @exec command, (error, stdout, stderr) ->
      res.send stdout

