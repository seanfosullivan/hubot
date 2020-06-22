module.exports = (robot) ->
 robot.respond /worklog (.*)/i, (msg) ->
    cmd = msg.match[1]
    @exec = require('child_process').exec
    command = "bash /home/hedge/mybot/hubot/external_scripts/bash/worklog.sh #{cmd}"

    @exec command, (error, stdout, stderr) ->
      msg.send stdout
    
    msg.send "Wrote to worklog."
