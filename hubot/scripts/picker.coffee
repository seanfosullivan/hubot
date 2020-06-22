module.exports = (robot) ->
  robot.respond /pick (.*)$/i, (msg) ->  
    
    options = parseInt msg.match[1]
    num=[]
    num = (x for x in [1..options])
    msg.send msg.random num
