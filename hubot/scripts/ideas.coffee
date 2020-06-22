module.exports = (robot) ->
 robot.respond /idea (.*)/i, (msg) ->
    cmd = msg.match[1]
    @exec = require('child_process').exec
    command = "bash /home/hedge/mybot/hubot/external_scripts/bash/ideas.sh #{cmd}"

    @exec command, (error, stdout, stderr) ->
      msg.send stdout
    
    msg.send "Saved your great idea!"
