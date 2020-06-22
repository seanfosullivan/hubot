module.exports = (robot) ->
 robot.respond /wiki (.*)$/i, (msg) ->
    cmd = msg.match[1]
    @exec = require('child_process').exec
    command = "python /home/hedge/mybot/hubot/external_scripts/python/wiki.py #{cmd}"

    @exec command, (error, stdout, stderr) ->
      msg.send stdout
 
